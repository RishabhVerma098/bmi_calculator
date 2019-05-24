import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cardAsserts/resuableContainer.dart';
import 'cardAsserts/cardInput.dart';

Color inActiveColor = Color(0xFF8E8E99);
Color activeColor = Color(0xFFFFFFFF);

enum Gender { male, female }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender selectedGender;
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
                    selectedGender = Gender.male;
                  });
                },
                child: ResusableContainer(
                  cardChild: CardInput(
                      fontAwesomeIcon: FontAwesomeIcons.mars,
                      text: 'Male',
                      color: selectedGender == Gender.male
                          ? activeColor
                          : inActiveColor),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                child: ResusableContainer(
                    cardChild: CardInput(
                        fontAwesomeIcon: FontAwesomeIcons.venus,
                        text: 'Female',
                        color: selectedGender == Gender.female
                            ? activeColor
                            : inActiveColor)),
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
