import 'package:flutter/material.dart';

extension GestureExtensions on Widget {
  Widget addTapGesture({VoidCallback? onTap}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: this,
    );
  }
}
