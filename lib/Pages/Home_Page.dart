import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyectopersonal/Pages/Mi_Sitios_Tutristicos.dart';
import 'package:proyectopersonal/Pages/Sites_Page.dart';
import 'Favoritos_Page.dart';
import 'Login_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var currentPage = 0;
  late List<Widget> pages;

  @override
  void initState() {
    _loadPages();
    super.initState();
  }

  void _loadPages(){
    pages = [];
    pages.add(MiSitiosTuristico());
    pages.add(FavoritosPage());
    pages.add(SitesPage());
  }

  void _onItemTapped(int page){
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geminis Tours"),
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
      body: IndexedStack(
        index: currentPage,
        /*Cuando el ButtonNavigatorBar Tiene mas de 4 items
            type: BottomNavigationBarType.fixed,
        */
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (page){
          _onItemTapped(page);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.house, size:20),
              label: "Mis Sitios"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.heart, size:20),
              label: "Mis Favoritos"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.location, size:20),
              label: "Localizacion"),
        ],
      ),
    );
  }
}
