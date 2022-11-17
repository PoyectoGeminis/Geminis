import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Modelos/Sitios.dart';
import '../Repository/firebase_api.dart';

class ListadeSitios extends StatefulWidget {
  const ListadeSitios({Key? key}) : super(key: key);

  @override
  State<ListadeSitios> createState() => _ListadeSitiosState();
}

class _ListadeSitiosState extends State<ListadeSitios> {

  final _name =TextEditingController();
  final _photo = TextEditingController();
  final _ciudad = TextEditingController();
  final _departamento = TextEditingController();
  final _descripcion = TextEditingController();
  final _temperatura = TextEditingController();

  final FirebaseApi _firebaseApi = FirebaseApi();

  double _rating = 3.0;


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

  void _createSitio(Sitio sitio) async{
    var result = await _firebaseApi.createSitio(sitio);
    _showMsg(result);
    Navigator.pop(context);
  }

  void _saveList(){
    var sitio = Sitio("", _name.text, _photo.text, _ciudad.text, _departamento.text, _descripcion.text, _temperatura.text, _rating);
    _createSitio(sitio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo Sitio"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _name,
                decoration:  const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nombre"
                ),
                keyboardType:  TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _photo,
                decoration:  const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Link de la Imagen"
                ),
                keyboardType:  TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _ciudad,
                decoration:  const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Ciudad"
                ),
                keyboardType:  TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _departamento,
                decoration:  const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Departamento"
                ),
                keyboardType:  TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _temperatura,
                decoration:  const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Temperatura"
                ),
                keyboardType:  TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _descripcion,
                decoration:  const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Descripción"
                ),
                keyboardType:  TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) =>  const Icon(
                  Icons.star,
                  color:  Colors.amber,
                ),
                onRatingUpdate: (rating){
                  _rating = rating;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: (){
                  _saveList();
                },
                child: const Text("Guardar Sitio"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}