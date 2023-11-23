import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todo_ecommerce/src/common/constants/app_colors.dart';
import 'package:todo_ecommerce/src/controller/provider.dart';
import 'package:todo_ecommerce/src/pages/home_page.dart';

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box("settings").listenable(),
      builder: (context, box, child) {
        final isDark = box.get("is_dark", defaultValue: false);
        return ChangeNotifierProvider(
          create: (context) => MainController(),
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: isDark
                  ? ThemeData(
                      scaffoldBackgroundColor: AppColors.backgroundsColor,
                      primaryColor: AppColors.backgroundsColor,
                    )
                  : ThemeData.light(),
              home: const HomePage(),
            );
          },
        );
      },
    );
  }
}
