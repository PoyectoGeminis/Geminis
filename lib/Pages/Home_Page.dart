import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(


          children: [
            Container(

              width: 300,
              height: 80,

              margin: EdgeInsets.only(top: 70),
              child: Text("Parque Ecologico EL SALADO",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Titulos",
                  // color: Colors.black
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 300,
              height: 300,

              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("Assets/Imagenes/ecoparque-el-salado.jpg")
                ),
              ),

            ),

            Container(
              width: 350,
              height: 300,
              margin: EdgeInsets.only(left: 15,top: 10),

              child: Text("Ciudad: Envigado"
                  "                              "
                  "Departamento: Antioquia"
                  "                                   "
                  "Temperatura: 25°"
                  "                                         "
                  "Descripcion: El parque se encuentra ubicado en la zona rural de Envigado, sector El Salado, cuenta con 170.000 metros cuadrados de extensión,  que lo convierte en uno de los grandes parques ecológicos de Antioquia. "
                  "Cuenta con actividades de aventura: Canopy, muro de escalada y pruebas de habilidad. Un espacio para la diversión.",
                style: TextStyle(
                  fontSize: 19,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
