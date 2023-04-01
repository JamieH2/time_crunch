import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;


@HiveType(typeId: 0)   //these numbers may have to be unique
class User extends HiveObject {
  @HiveField(0)
  int userID;

  @HiveField(1)
  String email;

  @HiveField(2)
  String password;

  User({required this.userID, required this.email, required this.password});
}