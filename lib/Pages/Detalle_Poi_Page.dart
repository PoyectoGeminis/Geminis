import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Boxes.dart';
import '../Modelos/Local_Sitio.dart';

class DetaillPoiPage extends StatefulWidget {
  QueryDocumentSnapshot dbsitio;
  DetaillPoiPage(this.dbsitio,{Key? key}) : super(key: key);

  @override
  State<DetaillPoiPage> createState() => _DetaillPoiPageState();
}

class _DetaillPoiPageState extends State<DetaillPoiPage> {

  var isFavorite = false;

  @override
  void initState() {
    _getLocalSitio();
    super.initState();
  }

  void _getLocalSitio(){
    final box = Boxes.getFavoritesBox();
    box.values.forEach((element) {
      if(element.id == widget.dbsitio.id){
        isFavorite = true;
      }
    });
  }

  void _onFavoriteButtonClicked() async {

    var localSitio = LocalSitio()
    ..id = widget.dbsitio.id
    ..nombre = widget.dbsitio["nombre"]
        ..photo = widget.dbsitio["photo"]
        ..ciudad = widget.dbsitio["ciudad"]
        ..departamento = widget.dbsitio["departamento"]
        ..temperatura = widget.dbsitio["Temperatura"]
        ..descripcion = widget.dbsitio["descripcion"];

    final box = Boxes.getFavoritesBox();
    //box.add(localSitio);
    if (isFavorite){
      box.delete(localSitio.id);
    } else{
      box.put(localSitio.id, localSitio);
    }

    setState(() {
      isFavorite = !isFavorite;
    });
  }

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
              width: 250,
              height: 250,
            ),
            Row(
              children: [
                Expanded(
                    child: IconButton(
                      alignment: Alignment.topRight,
                      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                      color: Colors.red,
                      onPressed: ((){
                        _onFavoriteButtonClicked();
                      }),
                    ),
                ),
              ],
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