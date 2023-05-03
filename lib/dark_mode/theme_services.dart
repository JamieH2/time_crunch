import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

//this code manages switching between light and dark themes.
// It stores if the dark mode is active and converts it to a boolean value. it then toggles between light and dark mode.
class ThemeService{
  final _box = GetStorage();
  final _key = 'isDarkMode';
  _saveThemeToBox(bool isDarkMode)=>_box.write(_key, isDarkMode);

  bool _loadThemeFromBox() => _box.read(_key)??false;
  ThemeMode get theme=> _loadThemeFromBox()?ThemeMode.dark:ThemeMode.light;
  void switchTheme(){
    Get.changeThemeMode(_loadThemeFromBox()?ThemeMode.light:ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());

  }

}
