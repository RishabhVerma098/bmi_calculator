import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cardAsserts/resuableContainer.dart';
import 'cardAsserts/cardInput.dart';

int inActiveColor = 0xFF8E8E99;
int activeColor = 0xFFFFFFFF;

enum Gender { male, female }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int maleColor = activeColor;
  int femaleColor = inActiveColor;

  void changecolor(Gender selectedgender) {
    if (selectedgender == Gender.male) {
      if (maleColor == inActiveColor) {
        maleColor = activeColor;
        femaleColor = inActiveColor;
      } else {
        maleColor = inActiveColor;
        femaleColor = activeColor;
      }
    } else {
      if (femaleColor == inActiveColor) {
        femaleColor = activeColor;
        maleColor = inActiveColor;
      } else {
        femaleColor = inActiveColor;
        maleColor = activeColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    changecolor(Gender.male);
                  });
                },
                child: ResusableContainer(
                  cardChild: CardInput(
                    fontAwesomeIcon: FontAwesomeIcons.mars,
                    text: 'Male',
                    color: Color(maleColor),
                  ),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    changecolor(Gender.female);
                  });
                },
                child: ResusableContainer(
                    cardChild: CardInput(
                  fontAwesomeIcon: FontAwesomeIcons.venus,
                  text: 'Female',
                  color: Color(femaleColor),
                )),
              )),
            ],
          ),
        ),
        Expanded(
          child: ResusableContainer(),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(child: ResusableContainer()),
              Expanded(child: ResusableContainer()),
            ],
          ),
        ),
        Container(
          color: Color(0xFFEA1556),
          height: 80.0,
          width: double.infinity,
          margin: EdgeInsets.only(top: 10),
          child: Center(
            child: Text(
              'Calculate',
              style: TextStyle(fontSize: 30),
            ),
          ),
        )
      ],
    );
  }
}
