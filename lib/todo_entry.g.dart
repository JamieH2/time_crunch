// GENERATED CODE - DO NOT MODIFY BY HAND


// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoEntryAdapter extends TypeAdapter<TodoEntry> {
  @override
  final int typeId = 0;

  @override
  TodoEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoEntry(
      todoID: fields[0] as int,
      userID: fields[1] as int,
      text: fields[2] as String,
      time: fields[3] as DateTime,
      completed: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TodoEntry obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.todoID)
      ..writeByte(1)
      ..write(obj.userID)
      ..writeByte(2)
      ..write(obj.text)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.completed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
