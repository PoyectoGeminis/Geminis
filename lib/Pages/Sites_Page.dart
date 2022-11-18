import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Detaill_Sites_Page.dart';

class SitesPage extends StatefulWidget {
  const SitesPage({Key? key}) : super(key: key);

  @override
  State<SitesPage> createState() => _SitesPageState();
}

class _SitesPageState extends State<SitesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Sites")
                .snapshots(),
            builder: (context, snapshot){
              if(!snapshot.hasData) return const Text("Loading");
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index){
                  QueryDocumentSnapshot sites = snapshot.data!.docs[index];
                  return Card(
                    child: ListTile(
                        leading: Image.network(
                          sites["urlPicture"] ?? "",
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                            return const Image(image: AssetImage("Assets/Imagenes/logo-1.png"),
                            );
                          },
                        ),
                        title: Text(sites["nombre"]),
                        subtitle: Text(sites["ciudad"] +", "+ sites["departamento"]),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => DetaillSitesPage(sites)),
                          );
                        },
                    ),
                  );
                },
              );
            },
          )
      ),
    );
  }
}
