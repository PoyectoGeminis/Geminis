// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Local_Sitio.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalSitioAdapter extends TypeAdapter<LocalSitio> {
  @override
  final int typeId = 0;

  @override
  LocalSitio read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalSitio()
      ..id = fields[0] as String?
      ..nombre = fields[1] as String?
      ..photo = fields[2] as String?
      ..ciudad = fields[3] as String?
      ..departamento = fields[4] as String?
      ..temperatura = fields[5] as String?
      ..descripcion = fields[6] as String?;
  }

  @override
  void write(BinaryWriter writer, LocalSitio obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nombre)
      ..writeByte(2)
      ..write(obj.photo)
      ..writeByte(3)
      ..write(obj.ciudad)
      ..writeByte(4)
      ..write(obj.departamento)
      ..writeByte(5)
      ..write(obj.temperatura)
      ..writeByte(6)
      ..write(obj.descripcion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalSitioAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
