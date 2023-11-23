import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hinText,
    required this.style,
    required this.minLines,
    required this.maxLines, required this.controller,
  });
  final String hinText;
  final int minLines;
  final int maxLines;
  final TextStyle style;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Colors.white,
            fontFamily: "Nunito-Regular",
            fontWeight: FontWeight.w500,
          ),
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hinText,
        enabledBorder: InputBorder.none,
        border: InputBorder.none,
        hintStyle: style,
      ),
    );
  }
}
