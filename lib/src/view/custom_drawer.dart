import 'package:flutter/material.dart';

import '../common/constants/app_colors.dart';
import '../common/constants/app_icons.dart';
import 'drawer_button.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool values = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: AppColors.backgroundsColor,
      width: size.width * 0.637,
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0.070, left: 5, right: 5),
        child: Column(
          children: [
            Text(
              "Notes",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: "OverlockSC",
                  ),
            ),
            SizedBox(height: size.height * 0.023),
            CustomDrawerButton(
              text: "Dark and Light",
              widget: Switch(
                onChanged: (value) {
                  setState(() {
                    values = value;
                  });
                },
                value: values,
              ),
            ),
            SizedBox(height: size.height * 0.023),
            const CustomDrawerButton(
              text: "Help center",
              widget: Image(
                image: AssetImage(AppIcons.helpCenter),
                height: 24,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: size.height * 0.023),
            const CustomDrawerButton(
              text: "Info",
              widget: Image(
                image: AssetImage(AppIcons.infoIcons),
                height: 24,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
