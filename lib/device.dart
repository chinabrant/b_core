import 'dart:ui' as ui;

import 'package:flutter/material.dart';


class Device {
  static var screenWidth = MediaQueryData.fromWindow(ui.window).size.width;
  static var screenHeight = MediaQueryData.fromWindow(ui.window).size.height;
  static double bottomPadding = MediaQueryData.fromWindow(ui.window).padding.bottom;
  static double topPadding = MediaQueryData.fromWindow(ui.window).padding.top;
  static double navigationBarHeight = 44.0;

  static double pixelRatio = MediaQueryData.fromWindow(ui.window).devicePixelRatio;
  
  static double statusAndNavigationBarHeight = topPadding + navigationBarHeight;
}