import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'providers/friend_provider.dart';
import 'providers/permission_provider.dart';
import 'screens/splash_screen.dart';
import 'services/contants.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: APPBARCOLOR, // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FriendProvider(),
      child: ChangeNotifierProvider(
        create: (context) => PermissonProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
          supportedLocales: const [Locale('ru')],
          title: 'Госкомэкологии',
          theme: ThemeData(
            fontFamily: GoogleFonts.montserrat().fontFamily,
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
