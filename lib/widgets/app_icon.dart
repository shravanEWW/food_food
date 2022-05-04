import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final double size;
  final Color iconColor;

  const AppIcon(
      {Key? key,
      required this.icon,
      this.backgroundColor = const Color(0xFFff0040),
      this.iconColor = const Color(0xffffffff),
      this.size = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: backgroundColor),
      child: Icon(
        icon,
        color: iconColor,
        size: Dimensions.ratio *25,
      ),
    );
  }
}
