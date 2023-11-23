import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    super.key,
    required this.title,
    required this.description
  });
  final String title;
  final String description;

  @override
  State<DetailsPage> createState() => _DetailsState();
}

class _DetailsState extends State<DetailsPage> {
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.053),
                Center(
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontFamily: "OverlockSC",
                          color: const Color(0xFF00a6fb),
                          fontWeight: FontWeight.w600,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: size.height * 0.035),
                Text(
                  widget.description,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontFamily: "OverlockSC",
                    color: const Color(0xFFffb627),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
