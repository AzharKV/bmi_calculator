import 'package:flutter/material.dart';

class RepeatContainerCode extends StatelessWidget {
  final Color colors;
  final Widget? cardWidget;
  final Function? onPressed;
  RepeatContainerCode({required this.colors, this.cardWidget, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed as void Function()?,
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: cardWidget,
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}