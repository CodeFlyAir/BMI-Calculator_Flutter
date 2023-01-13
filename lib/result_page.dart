import 'package:bmi_calculator/card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class result_page extends StatelessWidget {
  const result_page(
      {super.key,
      required this.bmi,
      required this.bmiDescription,
      required this.bmiResult});

  final String bmi;
  final String bmiResult;
  final String bmiDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  "Your Result",
                  style: kDataTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: CardLayout(
                color: kCardColour,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiResult,
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmi,
                      style: kBMITextStyle,
                    ),
                    Text(
                      bmiDescription,
                      style: kDescTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                height: 75.0,
                margin: const EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                    color: kBottomContainerColour,
                    borderRadius: BorderRadius.circular(10.0)),
                child: const Center(
                  child: Text(
                    "Re-Calculate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
