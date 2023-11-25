import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_ecommerce/src/controller/provider.dart';
import 'package:todo_ecommerce/src/pages/home_page.dart';

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainController(),
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home:  HomePage(),
        );
      },
    );
  }
}
