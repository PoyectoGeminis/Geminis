import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:proyectopersonal/Modelos/Local_Sitio.dart';
import '../Boxes.dart';

class FavoritosPage extends StatefulWidget {
  const FavoritosPage({Key? key}) : super(key: key);

  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: _buildListView(),
        ),
      ),
    );
  }

  Widget _buildListView(){
    return ValueListenableBuilder<Box<LocalSitio>>(
        valueListenable: Boxes.getFavoritesBox().listenable(),
        builder: (context, box, _){
          final sitioBox = box.values.toList().cast<LocalSitio>();
          return ListView.builder(
            itemCount: sitioBox.length,
              itemBuilder: (BuildContext context, int index){
              final sitio = sitioBox[index];
              return Card(
                child: ListTile(
                  leading: Image.network(
                    sitio.photo ?? "",
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                      return const Image(image: AssetImage("Assets/Imagenes/logo-1.png"),
                      );
                    },
                  ),
                  title: Text(sitio.nombre ?? "Desconocido"),
                  subtitle: Text(sitio.ciudad ?? "Desconocido"),
                  onLongPress: (){
                    setState(() {
                      sitio.delete();
                    });
                  },
                ),
              );
              },
          );
        }
    );
  }
}
