import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
enum Genre{masculino,femenino}

class _RegisterPageState extends State<RegisterPage> {
  final _name=TextEditingController();
  final _email=TextEditingController();
  final _password=TextEditingController();
  final _repPassword=TextEditingController();

  String data="Informacion";

  Genre?_genre=Genre.masculino;

  void _showMsg(BuildContext context, String msg){
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
        SnackBar(
          content: Text(msg),
          action: SnackBarAction(
              label: "Aceptar", onPressed: scaffold.hideCurrentSnackBar),
        ),
    );
  }

  void _onRegisterButtonClickend(){
    setState(() {
      if(_password.text == _repPassword){
      String genre="Masculino";
      if (_genre==Genre.femenino){
        genre="Femenino";
      }
      data=
      "Nombre: ${_name.text} "
          "\nEmail: ${_email.text} "
          "\nGénero: $genre";
    }
      else{
        _showMsg(context, "Las contraseñas deben de ser iguales");
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
                  child: const Text("Registrar")),
              Text(
                data,
                style: const TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic)
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


