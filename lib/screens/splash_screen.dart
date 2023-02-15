import 'package:flutter/material.dart';
import 'package:goskomekologii/providers/auth_provider.dart';
import 'package:goskomekologii/providers/friend_provider.dart';
import 'package:goskomekologii/providers/permission_provider.dart';
import 'package:goskomekologii/screens/intro_screen.dart';
import 'package:goskomekologii/services/update_all_data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _initVisit = true;

  @override
  void didChangeDependencies() {
    if (_initVisit) {
      Future.delayed(const Duration(seconds: 0), () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String token = prefs.getString('token') ?? '';
        if (token.isNotEmpty) {
          String phone = prefs.getString('phone') ?? '';

          await Provider.of<FriendProvider>(context, listen: false)
              .getProfileDetails();
          ;
          Provider.of<AuthProvider>(context, listen: false).getLocalToken();
          await updateAllData(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const IntroScreen(),
            ),
          );
        }
      });
    }

    super.didChangeDependencies();
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
