import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetaillPoiPage extends StatefulWidget {
  QueryDocumentSnapshot dbsitio;
  DetaillPoiPage(this.dbsitio,{Key? key}) : super(key: key);

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
            const SizedBox(
              height: 16.0,
            ),
            Text(widget.dbsitio["nombre"],
              textAlign: TextAlign.center,
              style:TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Image.network(
              widget.dbsitio["photo"],
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text("Ciduad: "+widget.dbsitio["ciudad"],
              textAlign: TextAlign.justify,
              style:TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text("Departamento: "+widget.dbsitio["departamento"],
              textAlign: TextAlign.justify,
              style:TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text("Temperatura: "+widget.dbsitio["Temperatura"],
              textAlign: TextAlign.justify,
              style:TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text("Descripción: "+widget.dbsitio["descripcion"],
              textAlign: TextAlign.justify,
              style:TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}