// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsAdapter extends TypeAdapter<Settings> {
  @override
  final int typeId = 0;

  @override
  Settings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Settings(
      settingsProfile: fields[0] as int,
      userID: fields[1] as int,
      language: fields[2] as String,
      colourblind: fields[3] as String,
      audio: fields[4] as bool,
      notifications: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Settings obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.settingsProfile)
      ..writeByte(1)
      ..write(obj.userID)
      ..writeByte(2)
      ..write(obj.language)
      ..writeByte(3)
      ..write(obj.colourblind)
      ..writeByte(4)
      ..write(obj.audio)
      ..writeByte(5)
      ..write(obj.notifications);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
