import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectopersonal/Pages/Detalle_Poi_Page.dart';
import 'package:proyectopersonal/Pages/Login_Page.dart';
import 'package:proyectopersonal/Pages/MiLista.dart';

class MiSitiosTuristico extends StatefulWidget {
  const MiSitiosTuristico({Key? key}) : super(key: key);

  @override
  State<MiSitiosTuristico> createState() => _MiSitiosTuristicoState();
}

enum Menu{logOut}

class _MiSitiosTuristicoState extends State<MiSitiosTuristico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis Sitios"),
        actions: [
          PopupMenuButton(
            onSelected:(Menu item){
              setState(() {
                if (item == Menu.logOut){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                }
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem(
                  value: Menu.logOut,
                  child: Text("Cerrar Sesión")
              ),
            ],
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Sitios_Turisticos")
                .snapshots(),
            builder: (context, snapshot){
              if(!snapshot.hasData) return const Text("Loading");
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index){
                  QueryDocumentSnapshot sitio = snapshot.data!.docs[index];
                  return Card(
                    child: ListTile(
                        title: Text(sitio["nombre"]),
                        subtitle: Text(sitio["ciudad"] +", "+ sitio["departamento"]),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => DetaillPoiPage(sitio))
                          );
                        }
                    ),
                  );
                },
              );
            },
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ListadeSitios()));
        },
        tooltip: "Nuevo Sitio",
        child: const Icon(Icons.add),
      ),
    );
  }
}
