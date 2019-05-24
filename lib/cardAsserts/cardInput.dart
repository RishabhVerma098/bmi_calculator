import 'package:flutter/material.dart';
import 'commonContents.dart';

class CardInput extends StatelessWidget {
  final Color color;
  final String text;
  final IconData fontAwesomeIcon;

  CardInput(
      {@required this.fontAwesomeIcon,
      @required this.text,
      @required this.color});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          fontAwesomeIcon,
          color: color,
          size: 90,
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          text,
          style: bottomText,
        ),
      ],
    );
  }
}
