// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_entry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalendarEntryAdapter extends TypeAdapter<CalendarEntry> {
  @override
  final int typeId = 0;

  @override
  CalendarEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalendarEntry(
      date: fields[0] as DateTime,
      location: fields[1] as String,
      text: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CalendarEntry obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.location)
      ..writeByte(2)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
