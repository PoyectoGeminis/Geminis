import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyectopersonal/Modelos/Sitios.dart';
import 'package:proyectopersonal/Modelos/Users.dart' as UserApp;

class FirebaseApi{

  Future<Object?> registerUser(String email, password) async{
    try{
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException ${e.code}");
      return e.code;
    } on FirebaseAuthException catch (e){
      print("FirebaseAuthException ${e.code}");
      return e.code;
    }
  }

  Future<String?> loginUser(String email, password) async{
    try{
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException ${e.code}");
      return e.code;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException ${e.code}");
      return e.code;
    }
  }

  Future <String> createUser(UserApp.User user) async{
    try{
      final document = await FirebaseFirestore.instance.collection("users").doc(user.uid).set(user.toJson());
      return user.uid;
    } on FirebaseException catch (e){
      print("FirebaseException ${e.code}");
      return e.code;
    }
  }

  Future<String> createSitio(Sitio sitio) async{
    try{
      final uid = FirebaseAuth.instance.currentUser?.uid;
      final document = FirebaseFirestore.instance.collection("Sitios_Turisticos").
      doc();
      sitio.id = document.id;

      final result = FirebaseFirestore.instance.collection("Sitios_Turisticos").
      doc(sitio.id).
      set(sitio.toJson());
      return sitio.id;
    } on FirebaseException catch (e){
      print("FirebaseException ${e.code}");
      return e.code;
    }
  }

}