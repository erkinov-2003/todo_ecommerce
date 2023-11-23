import 'package:flutter/material.dart';
import 'package:todo_ecommerce/src/common/constants/app_colors.dart';

class CustomDrawerButton extends StatelessWidget {
  const CustomDrawerButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.widget,
  });
  final void Function()? onPressed;
  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonColor,
        fixedSize:  Size(size.width * 1.275, size.height * 0.047),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 0.4),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Nunito-Regular",
                  ),
            ),
            widget,
          ],
        ),
      ),
    );
  }
}
