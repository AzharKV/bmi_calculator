import 'package:flutter/material.dart';

import '../ConstantFile.dart';

class RoundIcon extends StatelessWidget {
  final IconData? iconData;
  final Function()? onPress;

  RoundIcon({this.iconData, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(iconData),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(height: 50.0, width: 50.0),
      shape: CircleBorder(),
      fillColor: roundIconFillColor,
    );
  }
}
