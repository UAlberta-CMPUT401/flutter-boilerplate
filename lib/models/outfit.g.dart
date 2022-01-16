// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outfit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class outfitAdapter extends TypeAdapter<outfit> {
  @override
  outfit read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return outfit(
      (fields[0] as List)?.cast<clothing>(),
      fields[1] as String,
      (fields[2] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, outfit obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.clothes)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.tags);
  }
}
