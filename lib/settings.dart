import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

part 'settings.g.dart';

@HiveType(typeId: 0)   //these numbers may have to be unique
class Settings extends HiveObject {
  @HiveField(0)
  int settingsProfile;

  @HiveField(1)
  int userID;

  @HiveField(2)
  String language;

  @HiveField(3)
  String colourblind;

  @HiveField(4)
  bool audio;

  @HiveField(5)
  bool notifications;

  Settings({required this.settingsProfile, required this.userID, required this.language, required this.colourblind, required this.audio, required this.notifications});
}