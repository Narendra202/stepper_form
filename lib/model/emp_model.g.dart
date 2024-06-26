// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emp_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeModelAdapter extends TypeAdapter<EmployeeModel> {
  @override
  final int typeId = 0;

  @override
  EmployeeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmployeeModel(
      name: fields[0] as String,
      email: fields[1] as String,
      mobile: fields[2] as String,
      dob: fields[3] as String,
      values: fields[4] as String,
      gender: fields[5] as String,
      maxage: fields[6] as double,
      hobbies: (fields[7] as List).cast<dynamic>(),
      country: fields[8] as String,
      city: fields[9] as String,
      commune: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EmployeeModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.mobile)
      ..writeByte(3)
      ..write(obj.dob)
      ..writeByte(4)
      ..write(obj.values)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.maxage)
      ..writeByte(7)
      ..write(obj.hobbies)
      ..writeByte(8)
      ..write(obj.country)
      ..writeByte(9)
      ..write(obj.city)
      ..writeByte(10)
      ..write(obj.commune);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
