import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:proyectopersonal/Pages/Register_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Modelos/Users.dart';
import 'package:proyectopersonal/Pages/Home_Page.dart';
import '../Repository/firebase_api.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _email=TextEditingController();
  final _password=TextEditingController();

  User userLoad = User.Empty();

  final FirebaseApi _firebaseApi = FirebaseApi();

  @override
  void initState(){
    //getUser();
    super.initState();
  }

  getUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = jsonDecode(prefs.getString("user")!);
    userLoad = User.fromJson(userMap);
  }
  void _showMsg(String msg){
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(
            label: "Aceptar", onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _validerUser() async {
    if (_email.text.isEmpty && _password.text.isEmpty) {
      _showMsg("Debe digitar el correo y la contraseña");
    }
    else {
      var result = await _firebaseApi.loginUser(_email.text, _password.text);
      String msg = "";
      if (result == 'invalid-email') {
        msg = "El correo electrónico está mal escrito";
      } else if (result == "wrong-password") {
        msg = "Correo o Contraseña incorrecta";
      } else if (result == "network-request-failed") {
        msg = "Revise su conexión a intenet";
      } else {
        msg = "Bienvenido";
      }
      _showMsg(msg);
      if (msg == "Bienvenido") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    }
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Image(
                    image: AssetImage("Assets/Imagenes/logo_1.png"),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Correo Electrónico"),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _password,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Contraseña"),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _validerUser();
                      },
                      child: const Text("Iniciar Sesión")),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              RegisterPage()));
                    },
                    child: const Text("Registrarse"),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
