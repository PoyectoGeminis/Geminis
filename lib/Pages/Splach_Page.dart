import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectopersonal/Pages/Home_Page.dart';
import 'package:proyectopersonal/Pages/Mi_Sitios_Tutristicos.dart';
import 'Login_Page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState(){
    _closeSplash();
    super.initState();
  }

  Future<void> _closeSplash() async {
    Future.delayed(const Duration(seconds: 5), () async {
      var currentUser = FirebaseAuth.instance.currentUser;
      if(currentUser == null){
        Navigator.pushReplacement(context,
            MaterialPageRoute(
                builder: (context) => const LoginPage()));
      } else{
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const HomePage()));
      }
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: Image(
            image: AssetImage("Assets/Imagenes/logo_1.png")
          ),
        ),
      ),
    );
  }
}

