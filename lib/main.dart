import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proyectopersonal/Pages/Login_Page.dart';
import 'package:proyectopersonal/Pages/MiLista.dart';
import 'package:proyectopersonal/Pages/Register_Page.dart';
import 'Pages/Mi_Sitios_Tutristicos.dart';
import 'Pages/Splach_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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


