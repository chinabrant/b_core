import 'package:flutter/material.dart';

class NormalListItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final double marginTop;
  final double marginBottom;
  final Color backColor;
  final TextStyle titleStyle;
  final TextStyle subTitleStyle;
  final Widget? indicatorWidget;

  const NormalListItem({
    Key? key,
    required this.title,
    this.subtitle,
    this.onTap,
    this.marginBottom = 0,
    this.marginTop = 0,
    this.backColor = const Color(0xffffffff),
    this.indicatorWidget,
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
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: 49,
        margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
        color: backColor,
        child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 5,
              bottom: 5,
            ),
            child: Row(
              children: [
                Text(title, style: titleStyle),
                Expanded(child: Container()),
                subtitle != null
                    ? Text(
                        subtitle!,
                        style: subTitleStyle,
                      )
                    : Container(),
                Container(
                  child: indicatorWidget,
                )
              ],
            )),
      ),
    );
  }
}
