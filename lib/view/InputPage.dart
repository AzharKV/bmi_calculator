import 'package:bmi_calculator/widgets/roundIcon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../ConstantFile.dart';
import '../widgets/ContainerWidget.dart';
import '../widgets/IconTextWidget.dart';
import 'Result.dart';
import '../ResultCalculate.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectGender;
  int sliderValue = 170;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Gender Row
          Expanded(
            child: Row(
              children: [
                //MaleContainer
                Expanded(
                  child: RepeatContainerCode(
                    onPressed: () => setState(() => selectGender = Gender.male),
                    colors: selectGender == Gender.male
                        ? activeColor
                        : deActiveColor,
                    cardWidget: RepeatTextAndIcon(
                        iconData: FontAwesomeIcons.male, label: "MALE"),
                  ),
                ),
                //FemaleContainer
                Expanded(
                  child: RepeatContainerCode(
                    onPressed: () =>
                        setState(() => selectGender = Gender.female),
                    colors: selectGender == Gender.female
                        ? activeColor
                        : deActiveColor,
                    cardWidget: RepeatTextAndIcon(
                        iconData: FontAwesomeIcons.female, label: "FEMALE"),
                  ),
                ),
              ],
            ),
          ),
          //Slider
          Expanded(
            child: RepeatContainerCode(
              colors: activeColor,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: LabelStyle),
                  SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(sliderValue.toString(), style: LabelNumberStyle),
                      Text("cm", style: LabelStyle),
                    ],
                  ),
                  Slider(
                    onChanged: (double value) =>
                        setState(() => sliderValue = value.round()),
                    value: sliderValue.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: sliderActiveColor,
                    inactiveColor: sliderInActiveColor,
                  ),
                ],
              ),
            ),
          ),
          //WeightAge Row
          Expanded(
            child: Row(children: [
              //Weight
              Expanded(
                child: RepeatContainerCode(
                  colors: activeColor,
                  cardWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WEIGHT", style: LabelStyle),
                      SizedBox(height: 5.0),
                      Text(weight.toString(), style: LabelNumberStyle),
                      SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIcon(
                            iconData: FontAwesomeIcons.minus,
                            onPress: () => setState(() {
                              if (weight > 1) weight--;
                            }),
                          ),
                          SizedBox(width: 10.0),
                          RoundIcon(
                            iconData: FontAwesomeIcons.plus,
                            onPress: () => setState(() => weight++),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //Age
              Expanded(
                child: RepeatContainerCode(
                  colors: activeColor,
                  cardWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("AGE", style: LabelStyle),
                      SizedBox(height: 5.0),
                      Text(age.toString(), style: LabelNumberStyle),
                      SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIcon(
                            iconData: FontAwesomeIcons.minus,
                            onPress: () => setState(() {
                              if (age > 1) age--;
                            }),
                          ),
                          SizedBox(width: 10.0),
                          RoundIcon(
                            iconData: FontAwesomeIcons.plus,
                            onPress: () => setState(() => age++),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          //button
          InkWell(
            onTap: () {
              Calculator calc = Calculator(height: sliderValue, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(
                    bmiResult: calc.calculateBMI(),
                    interpretation: calc.getInterpretations(),
                    resultText: calc.getResult(),
                  ),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 60.0,
              color: sliderActiveColor,
              child: Center(
                child: Text("CALCULATE", style: buttonText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
