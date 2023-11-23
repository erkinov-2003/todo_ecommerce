import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_ecommerce/src/common/constants/app_colors.dart';
import 'package:todo_ecommerce/src/common/constants/app_icons.dart';
import 'package:todo_ecommerce/src/controller/provider.dart';
import 'package:todo_ecommerce/src/view/custom_button.dart';
import 'package:todo_ecommerce/src/view/custom_text_field.dart';


class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deleteButton = Provider.of<MainController>(context).deleteButton;
    final saveButton = Provider.of<MainController>(context).saveButton;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundsColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      images: AppIcons.arrowBack,
                      backgroundColor: AppColors.buttonColor,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                      children: [
                        CustomButton(
                          images: AppIcons.deleteIcons,
                          onPressed: () => deleteButton(
                            titleController,
                            descriptionController,
                          ),
                          backgroundColor: Colors.red,
                        ),
                        SizedBox(width: size.width * 0.030),
                        CustomButton(
                          images: AppIcons.saveIcons,
                          backgroundColor: AppColors.buttonColor,
                          onPressed: () => saveButton(
                            titleController,
                            descriptionController,
                            context,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.053),
                CustomTextField(
                  controller: titleController,
                  hinText: "Title your todo. . .",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: AppColors.whiteColor,
                        fontFamily: "OverlockSC",
                      ),
                  minLines: 1,
                  maxLines: 1,
                ),
                SizedBox(height: size.height * 0.035),
                CustomTextField(
                  controller: descriptionController,
                  hinText: "Description your todo. . .",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.whiteColor,
                        fontFamily: "OverlockSC",
                      ),
                  minLines: 1,
                  maxLines: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
