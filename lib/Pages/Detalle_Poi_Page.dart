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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: ListView(
          children: [
            Text(widget.dbsitio["nombre"],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
            ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Image.network(
              widget.dbsitio["photo"]
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text("Ciudad: "+widget.dbsitio["ciudad"],
                textAlign: TextAlign.justify),
            const SizedBox(
              height: 12.0,
            ),
            Text("Departamento: "+ widget.dbsitio["departamento"],
                textAlign: TextAlign.left),
            const SizedBox(
              height: 12.0,
            ),
            Text("Descrición: "+ widget.dbsitio["descripcion"]),
            const SizedBox(
              height: 12.0,
            ),
          ],
        ),
      ),
    );
  }
}