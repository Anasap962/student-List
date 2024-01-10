// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentmodelAdapter extends TypeAdapter<Studentmodel> {
  @override
  final int typeId = 1;

  @override
  Studentmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Studentmodel(
      image: fields[5] as String,
      name: fields[0] as String,
      age: fields[1] as String,
      address: fields[2] as String,
      place: fields[3] as String,
      phone: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Studentmodel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.place)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}