import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proyectopersonal/Pages/Login_Page.dart';
import 'package:proyectopersonal/Pages/Register_Page.dart';

import 'Pages/Splach_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GenesisTours',
      localizationsDelegates: const[
        GlobalWidgetsLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const[
        Locale("es", "CO"),
        Locale("en", "US"),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/Imagenes/img_2.png")
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: const SplashPage(),
        ),
      ),
    );
  }
}


