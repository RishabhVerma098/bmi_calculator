import 'package:flutter/material.dart';

class ResusableContainer extends StatelessWidget {
  final Widget cardChild;
  //cardchild = cardInput class
  ResusableContainer({this.cardChild});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Color(0xFF1D1E33), borderRadius: BorderRadius.circular(10)),
    );
  }
}
