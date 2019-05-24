import 'package:bmi_calculator/cardAsserts/commonContents.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cardAsserts/resuableContainer.dart';
import 'cardAsserts/cardInput.dart';
import 'cardAsserts/commonContents.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender selectedGender;
  int height = 180;
  int weight = 70;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ResusableContainer(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                cardChild: CardInput(
                    fontAwesomeIcon: FontAwesomeIcons.mars,
                    text: 'MALE',
                    color: selectedGender == Gender.male
                        ? activeColor
                        : inActiveColor),
              )),
              Expanded(
                  child: ResusableContainer(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      cardChild: CardInput(
                          fontAwesomeIcon: FontAwesomeIcons.venus,
                          text: 'FEMALE',
                          color: selectedGender == Gender.female
                              ? activeColor
                              : inActiveColor))),
            ],
          ),
        ),
        Expanded(
          child: ResusableContainer(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT', style: bottomText),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: middleText,
                    ),
                    Text(
                      'cm',
                      style: TextStyle(color: Color(0xFF848794)),
                    ),
                  ],
                ),
                //Slider Widget
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEA1556),
                      activeTrackColor: Colors.white,
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                      overlayColor: Color(0x80EA1556),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 12)),
                  child: Slider(
                    inactiveColor: Color(0xFF848794),
                    min: 120,
                    max: 220,
                    value: height.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: ResusableContainer(
                      cardChild: Params(
                param: 'WEIGHT',
                paramValue: weight,
                onPressedPlus: () {
                  setState(() {
                    weight++;
                  });
                },
                onPressedMinus: () {
                  setState(() {
                    weight--;
                  });
                },
              ))),
              Expanded(
                  child: ResusableContainer(
                      cardChild: Params(
                param: 'AGE',
                paramValue: age,
                onPressedPlus: () {
                  setState(() {
                    age++;
                  });
                },
                onPressedMinus: () {
                  setState(() {
                    age--;
                  });
                },
              ))),
            ],
          ),
        ),
        Container(
          color: bottomContainerColor,
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

class Params extends StatelessWidget {
  final String param;
  final int paramValue;
  final Function onPressedPlus;
  final Function onPressedMinus;
  Params(
      {@required this.param,
      @required this.paramValue,
      this.onPressedPlus,
      this.onPressedMinus});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          param,
          style: bottomText,
        ),
        Text(
          paramValue.toString(),
          style: middleText,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundButton(
              icon: FontAwesomeIcons.plus,
              onPressed: onPressedPlus,
            ),
            SizedBox(
              width: 10,
            ),
            RoundButton(
              icon: FontAwesomeIcons.minus,
              onPressed: onPressedMinus,
            ),
          ],
        ),
      ],
    );
  }
}

class RoundButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  RoundButton({@required this.icon, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
