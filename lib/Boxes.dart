import 'package:hive/hive.dart';
import 'package:proyectopersonal/Modelos/Local_Sitio.dart';

class Boxes {
  static Box<LocalSitio> getFavoritesBox() => Hive.box<LocalSitio>("Favorites");
}