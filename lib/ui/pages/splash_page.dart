import 'dart:async';

import 'package:emoney_app/shared/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/onBoarding', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkBgColor,
        body: Center(
          child: Container(
            width: 155,
            height: 50,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/img_logo_dark.png'),
            )),
          ),
        ));
  }
}
