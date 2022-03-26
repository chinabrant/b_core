import 'package:flutter/material.dart';

import 'normal_item.dart';

class SliverNormalListItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final double marginTop;
  final double marginBottom;
  final Color backColor;
  final TextStyle titleStyle;
  final TextStyle subTitleStyle;
  final Widget? indicatorWidget;

  const SliverNormalListItem({
    Key? key,
    required this.title,
    this.onTap,
    this.subtitle,
    this.marginBottom = 0,
    this.marginTop = 0,
    this.indicatorWidget,
    this.backColor = const Color(0xffffffff),
    this.titleStyle = const TextStyle(
      fontSize: 18,
      color: Color(0xff666666),
    ),
    this.subTitleStyle = const TextStyle(
      fontSize: 18,
      color: Color(0xff666666),
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
          // height: 49,
          child: NormalListItem(
        title: title,
        onTap: onTap,
        marginBottom: marginBottom,
        marginTop: marginTop,
        subtitle: subtitle,
        backColor: backColor,
        indicatorWidget: indicatorWidget,
        titleStyle: titleStyle,
        subTitleStyle: subTitleStyle,
      )),
    );
  }
}
