import 'package:flutter/material.dart';

import '../ConstantFile.dart';

class RepeatTextAndIcon extends StatelessWidget {
  final IconData? iconData;
  final String? label;

  RepeatTextAndIcon({this.iconData, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData, size: MediaQuery.of(context).size.height * 0.1),
        SizedBox(height: 15),
        Text(label!, style: LabelStyle),
      ],
    );
  }
}
