// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_liked.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveLikedAdapter extends TypeAdapter<HiveLiked> {
  @override
  final int typeId = 1;

  @override
  HiveLiked read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveLiked(
      localId: fields[0] as String?,
      likedAt: fields[1] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveLiked obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.localId)
      ..writeByte(1)
      ..write(obj.likedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveLikedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
