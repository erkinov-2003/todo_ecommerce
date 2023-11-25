import 'package:flutter/material.dart';
import 'package:todo_ecommerce/src/common/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../common/constants/app_icons.dart';
import 'drawer_button.dart';
import 'info_dialog.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      width: size.width * 0.637,
      backgroundColor: AppColors.backgroundsColor,
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0.070, left: 5, right: 5),
        child: Column(
          children: [
            Text(
              "Notes",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontFamily: "OverlockSC",
                    color: AppColors.textColor,
                  ),
            ),
            SizedBox(height: size.height * 0.023),
            CustomDrawerButton(
              text: "Help center",
              widget: const Image(
                image: AssetImage(AppIcons.helpCenter),
                height: 24,
                fit: BoxFit.cover,
              ),
              onPressed: () {
                String url = "https://t.me/erkinovv_dev";
                launchUrl(
                  Uri.parse(url),
                  mode: LaunchMode.externalApplication,
                );
              },
            ),
            SizedBox(height: size.height * 0.023),
            CustomDrawerButton(
              text: "Info",
              widget: const Image(
                image: AssetImage(AppIcons.infoIcons),
                height: 24,
                fit: BoxFit.cover,
              ),
              onPressed: () => infoDialog(context),
            ),
          ],
        ),
      ),
    );
  }
}
