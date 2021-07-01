import 'package:flutter/material.dart';

import 'ConstantFile.dart';
import 'ContainerWidget.dart';
import 'InputPage.dart';

class Result extends StatelessWidget {
  final String? bmiResult;
  final String? resultText;
  final String? interpretation;

  Result({this.bmiResult, this.resultText, this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  child: Text("YOUR RESULT", style: LabelNumberStyle),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: RepeatContainerCode(
                colors: activeColor,
                cardWidget: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(resultText!.toUpperCase(), style: resultValue),
                      Text(bmiResult!, style: LabelNumberStyle),
                      Text(interpretation!,
                          textAlign: TextAlign.center, style: conclusionStyle),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InputPage())),
              child: Container(
                width: double.infinity,
                height: 60.0,
                color: sliderActiveColor,
                child: Center(
                    child: Text(
                  "RECALCULATE",
                  style: buttonText,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
