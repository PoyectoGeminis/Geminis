import 'package:hive/hive.dart';

part 'Local_Sitio.g.dart';

@HiveType(typeId: 0)
class LocalSitio extends HiveObject{

  @HiveField(0)
  String? id;

  @HiveField(1)
  String? nombre;

  @HiveField(2)
  String? photo;

  @HiveField(3)
  String? ciudad;

  @HiveField(4)
  String? departamento;

  @HiveField(5)
  String? temperatura;

  @HiveField(6)
  String? descripcion;

}