import 'package:flutter/material.dart';
import 'package:proyectopersonal/Pages/Register_Page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _email=TextEditingController();
  final _password=TextEditingController();

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
                    onPressed: (){}, 
                    child: const Text("Iniciar Sesión")
                ),
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
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> RegisterPage()));
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
