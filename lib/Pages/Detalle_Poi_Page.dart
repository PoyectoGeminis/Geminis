import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proyectopersonal/Modelos/Sitios.dart';

class DetaillPoiPage extends StatefulWidget {
  const DetaillPoiPage({Key? key}) : super(key: key);

  @override
  State<DetaillPoiPage> createState() => _DetaillPoiPageState();
}

class _DetaillPoiPageState extends State<DetaillPoiPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Detalle del Sitio"),
        ),
        body: Container(
          child: ListView(
            children: [
              Image(image: AssetImage("Assets/Imagenes/Peñol.png")
              ),
              const SizedBox(
                height: 16.0,
              ),
              Container(
                child: Text(
                  "El peñón de Guatapé, o piedra del Peñol, es un monolito de 220 metros de altura, localizado en el término municipal de Guatapé, Antioquia, Colombia. La piedra de El Peñol es una masa granítica, compuesta por cuarzo, feldespato y mica, fue escalada por primera vez en 16 de julio de 1954 por un habitante de la zona, Luis Eduardo Villegas López. Actualmente se puede acceder a su cumbre subiendo los 715 escalones construidos en el monolito."
                ),
              )
            ],
          ),
        ),
      );
  }
}