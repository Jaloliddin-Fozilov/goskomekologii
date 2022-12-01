import 'package:flutter/material.dart';
import 'package:goskomekologii/screens/intro_screen.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const IntroScreen()),
          (Route<dynamic> route) => false);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 120,
          ),
          const SizedBox(height: 10),
          const Text(
            'Государственный комитет Республики Узбекистан по экологии и охране окружающей среды',
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
