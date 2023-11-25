import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hinText,
    required this.style,
    required this.minLines,
    required this.maxLines,
    required this.controller,
    required this.color,
  });
  final String hinText;
  final int minLines;
  final int maxLines;
  final TextStyle style;
  final Color color;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontFamily: "Nunito-Regular",
            fontWeight: FontWeight.w500,
            color: color,
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
