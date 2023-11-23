import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todo_ecommerce/src/common/constants/app_colors.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: AppColors.whiteColor,
      highlightColor: Colors.transparent,
      child: Card(
        color: const Color(0xFF184e77),
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
        ),
      ),
    );
  }
}
