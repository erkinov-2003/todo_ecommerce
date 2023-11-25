import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_ecommerce/src/common/constants/app_icons.dart';
import 'package:todo_ecommerce/src/pages/details_page.dart';
import 'package:todo_ecommerce/src/pages/todo_page.dart';
import 'package:todo_ecommerce/src/view/custom_button.dart';
import 'package:todo_ecommerce/src/view/custom_drawer.dart';
import 'package:todo_ecommerce/src/view/delete_dialog.dart';

import '../common/constants/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void navigationPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TodoPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final hiveGet = Hive.box("settings");

    return Scaffold(
      backgroundColor: AppColors.backgroundsColor,
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 15, bottom: 30),
        child: FloatingActionButton(
          backgroundColor: AppColors.yellowColor,
          onPressed: navigationPage,
          child: const Image(
            image: AssetImage(AppIcons.addIcons),
            color: Colors.black,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
      ),
      endDrawer: const CustomDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notes",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                          fontFamily: "OverlockSC",
                        ),
                  ),
                  Builder(builder: (context) {
                    return CustomButton(
                      images: AppIcons.personIcons,
                      backgroundColor: const Color(0xFF3c096c),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    );
                  }),
                ],
              ),
              SizedBox(height: size.height * 0.035),
              Expanded(
                child: SizedBox(
                  height: size.height * 0.708,
                  child: ValueListenableBuilder(
                      valueListenable: hiveGet.listenable(),
                      builder: (context, box, child) {
                        return ListView.builder(
                          itemCount: hiveGet.keys.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final itemsKeys = hiveGet.keys.toList()[index];
                            final hiveValue = hiveGet.get(itemsKeys);

                            return Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailsPage(
                                            title: itemsKeys.toString(),
                                            description: hiveValue.toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      color: const Color(0xFF22223b),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                        side: BorderSide(
                                          color: Colors.white,
                                          width: 0.5,
                                        ),
                                      ),
                                      child: SizedBox(
                                        height: size.height * 0.106,
                                        width: double.infinity,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 15, right: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                itemsKeys.toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                      color:
                                                          AppColors.whiteColor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(
                                                height: size.height * 0.011,
                                              ),
                                              Text(
                                                hiveValue.toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                      color:
                                                          AppColors.yellowColor,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    onLongPress: () =>
                                        deleteDialog(context, itemsKeys),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
