import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.images, this.color, required this.backgroundColor,
  });
  final void Function()? onPressed;
  final String images;
  final Color? color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: Size(size.width * 0.063, size.height * 0.053),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 0.3),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Image(
        color: color,
        image: AssetImage(images),
        fit: BoxFit.cover,
        height: 24,
      ),
    );
  }
}
