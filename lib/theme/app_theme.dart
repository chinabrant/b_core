import 'package:b_core/theme/app_color.dart';
import 'package:b_core/theme/dark_color.dart';
import 'package:b_core/theme/theme_type.dart';
import 'package:b_core/theme/white_color.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AppTheme extends ChangeNotifier {
  late ThemeData _themeData;
  late AppColor _appColor;
  late ThemeType _themeType;

  ThemeData get themeData => _themeData;
  ThemeType get themeType => _themeType;

  AppTheme() {
    _themeType = ThemeType.dark;
    _themeData = _darkThemeData;
    _appColor = darkColor;
  }

  ThemeData get _darkThemeData => ThemeData.dark().copyWith(
        backgroundColor: darkColor.background,
        primaryColor: darkColor.primary,
        scaffoldBackgroundColor: darkColor.background,
        dialogBackgroundColor: darkColor.alertBackground,
        appBarTheme: ThemeData.dark().appBarTheme.copyWith(
            elevation: 0,
            backgroundColor: darkColor.contentBackground,
            actionsIconTheme: IconThemeData(color: darkColor.primaryText),
            iconTheme: IconThemeData(color: darkColor.primaryText),
            titleTextStyle: TextStyle(
              fontSize: 25,
              color: darkColor.primaryText,
              fontWeight: FontWeight.w400,
            )),
      );

  ThemeData get _whiteThemeData => ThemeData.light().copyWith(
        backgroundColor: whiteColor.background,
        primaryColor: whiteColor.primary,
        scaffoldBackgroundColor: whiteColor.background,
        dialogBackgroundColor: whiteColor.alertBackground,
        appBarTheme: ThemeData.dark().appBarTheme.copyWith(
            elevation: 0,
            backgroundColor: whiteColor.contentBackground,
            actionsIconTheme: IconThemeData(color: whiteColor.primaryText),
            iconTheme: IconThemeData(color: whiteColor.primaryText),
            titleTextStyle: TextStyle(
              fontSize: 25,
              color: whiteColor.primaryText,
              fontWeight: FontWeight.w400,
            )),
      );

  /// 设置深浅主题类型
  void setThemeType(ThemeType type) {
    if (_themeType == type) {
      return;
    }

    _themeType = type;
    if (type == ThemeType.dark) {
      _themeData = _darkThemeData;
      _appColor = darkColor;
    } else {
      _themeData = _whiteThemeData;
      _appColor = whiteColor;
    }

    notifyListeners();
  }

  static ThemeData appThemeData(BuildContext context) {
    return Provider.of<AppTheme>(context).themeData;
  }

  static AppColor color(BuildContext context) {
    return Provider.of<AppTheme>(context)._appColor;
  }
}
