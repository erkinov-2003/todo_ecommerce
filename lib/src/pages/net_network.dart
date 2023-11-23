import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NetNetworkScreen extends StatelessWidget {
  const NetNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "assets/lottie/Animation - 1700831316871 (1).json",
          height: 300,
        ),
      ),
    );
  }
}
