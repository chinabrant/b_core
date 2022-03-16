import 'package:flutter/material.dart';

class AppColor {
  /// 品牌主色
  final Color primary;

  /// 品牌辅色
  final Color secondary;

  /// 系统底色
  final Color background;

  /// 内容底色
  final Color contentBackground;

  /// 弹窗背景色
  final Color alertBackground;

  /// 文本颜色

  /// 一级文本
  final Color primaryText;

  /// 二级文本
  final Color secondaryText;

  /// 三级文本
  final Color tertiaryText;

  /// 按钮文本
  final Color buttonText;

  /// 强调/高亮文本
  final Color highlightText;

  /// 提示
  final Color tipsText;

  /// 备注文本/弱提示.
  final Color remarksText;

  /// 分割线

  /// 一级分割线
  final Color primaryDivider;

  /// 二级分割线
  final Color secondaryDivider;

  AppColor({
    this.remarksText = const Color(0x4DFFFFFF),
    this.primary = const Color(0xfff54345),
    this.secondary = const Color(0xffbc965f),
    this.background = const Color(0xff14161A),
    this.contentBackground = const Color(0xff1B1D24),
    this.alertBackground = const Color(0xff14161A),
    this.primaryText = const Color(0xd8ffffff),
    this.secondaryText = const Color(0xa5ffffff),
    this.tertiaryText = const Color(0x72ffffff),
    this.buttonText = const Color(0xd8ffffff),
    this.highlightText = const Color(0xfff54345),
    this.tipsText = const Color(0xfff29b41),
    this.primaryDivider = const Color(0xff0d0f11),
    this.secondaryDivider = const Color(0xff35363d),
  });
}
