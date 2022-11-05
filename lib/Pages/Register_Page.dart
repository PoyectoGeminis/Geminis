import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyectopersonal/Pages/Login_Page.dart';
import '../Modelos/Users.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../Repository/firebase_api.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
enum Genre{masculino,femenino}

class _RegisterPageState extends State<RegisterPage> {

  final FirebaseApi _firebaseApi = FirebaseApi();

  final _name=TextEditingController();
  final _email=TextEditingController();
  final _password=TextEditingController();
  final _repPassword=TextEditingController();

  String data="Informacion";

  Genre?_genre=Genre.masculino;

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

  void _saveUser(User user) async{
    var result = await _firebaseApi.createUser(user);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  void _registerUser(User user) async{
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setString("user", jsonEncode(user));
    var result = await _firebaseApi.registerUser(user.email, user.password);
    String msg = "";
    if (result == 'invalid-email'){
      msg = "El correo electrónico está mal escrito";
    } else if (result == "email-already-in-use"){
      msg = "Ya existe una cuenta con este correo electrónico";
    }else if (result == "waek-password") {
      msg = "Debe utilizar una contraseña de minimo 6 digitos";
    } else if (result == "network-request-failed"){
      msg = "Revise su conexión a intenet";
    } else {
      msg = "Usuario registrado con exito";
      user.uid = result;
      _saveUser(user);
    }
    _showMsg(msg);
    if (msg == "Usuario registrado con exito"){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  void _onRegisterButtonClickend(){
    setState(() {
      if(_password.text == _repPassword.text) {
        String genre = "Masculino";
        if (_genre == Genre.femenino) {
          genre = "Femenino";
        }

        var user = User("",_name.text,_email.text,_password.text, genre);
        _registerUser(user);
      } else{
        _showMsg("Las contraseñas deben ser iguales");
      }
    });
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
              children: <Widget> [
                const Image(
                image: AssetImage("Assets/Imagenes/vuelo-en-avion.png"),
                ),
                const SizedBox(
                  height: 14.0,
                ),
                TextFormField(
                  controller: _name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nombre",
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Correo Electronico"
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Contraseña"
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _repPassword,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Repita Contraseña"
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text("Masculino"),
                        leading: Radio<Genre>(
                          value: Genre.masculino,
                          groupValue: _genre,
                          onChanged: (Genre? value){
                            setState(() {
                              _genre=value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text("Femenino"),
                        leading: Radio<Genre>(
                          value: Genre.femenino,
                          groupValue: _genre,
                          onChanged: (Genre? value){
                            setState(() {
                              _genre=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: (){
                    _onRegisterButtonClickend();
                  },
                  child: const Text("Registrar")
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


