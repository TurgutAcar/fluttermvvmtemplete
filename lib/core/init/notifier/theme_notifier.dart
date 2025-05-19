import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplete/core/constants/enums/ap_theme_enum.dart';
import 'package:fluttermvvmtemplete/core/init/theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier
{
  ThemeData _currentTheme =AppThemeLight.instance.theme;
  ThemeData get currentTheme=>_currentTheme;

  void changeValue(AppThems theme)
  {
    if(theme==AppThems.LIGHT)
      {
        _currentTheme=ThemeData.light();

      }else{
      _currentTheme=ThemeData.dark();

    }
    notifyListeners();
  }
}