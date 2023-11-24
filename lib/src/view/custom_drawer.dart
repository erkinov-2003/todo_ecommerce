import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_ecommerce/src/view/info_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common/constants/app_icons.dart';
import 'drawer_button.dart';

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
      backgroundColor: const Color(0xFF240046),
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0.070, left: 5, right: 5),
        child: Column(
          children: [
            Text(
              "Notes",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontFamily: "OverlockSC",
                    color: const Color(0xFF0096c7),
                  ),
            ),
            SizedBox(height: size.height * 0.023),
            ValueListenableBuilder(
                valueListenable: Hive.box("settings").listenable(),
                builder: (context, box, child) {
                  final isDark = box.get("is_dark", defaultValue: false);
                  return CustomDrawerButton(
                    text: "Dark and Light",
                    widget: Switch(
                      onChanged: (value) {
                        box.put("is_dark", value);
                      },
                      value: isDark,
                    ),
                  );
                }),
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
            const Spacer(flex: 9),
            const CustomDrawerButton(
              text: "Log out",
              widget: Image(
                image: AssetImage(AppIcons.logOutIcons),
                height: 24,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
