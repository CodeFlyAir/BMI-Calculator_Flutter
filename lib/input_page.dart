import 'package:bmi_calculator/calculate.dart';
import 'package:bmi_calculator/card.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'card_data.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kCardColour;
  Color femaleCardColour = kCardColour;
  double kCurrentHeight = 160.0;
  double kCurrentWeight = 60.0;
  int kCurrentAge = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        maleCardColour = kToggleCardColour;
                        femaleCardColour = kCardColour;
                      });
                    },
                    child: CardLayout(
                      color: maleCardColour,
                      cardChild: const cardData(
                        icon: FontAwesomeIcons.mars,
                        text: "MALE",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        femaleCardColour = kToggleCardColour;
                        maleCardColour = kCardColour;
                      });
                    },
                    child: CardLayout(
                      color: femaleCardColour,
                      cardChild: const cardData(
                        icon: FontAwesomeIcons.venus,
                        text: "FEMALE",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardLayout(
              color: kCardColour,
              cardChild: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "HEIGHT",
                      style: kLabelTextStyle,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          kCurrentHeight.toString(),
                          style: kDataTextStyle,
                        ),
                        const Text(
                          "   cm",
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayColor: Color(0x39EB1555),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          value: kCurrentHeight,
                          min: kMinHeight,
                          max: kMaxHeight,
                          onChanged: (double current) {
                            setState(() {
                              kCurrentHeight = current.roundToDouble();
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardLayout(
                    color: kCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              kCurrentWeight.toString(),
                              style: kDataTextStyle,
                            ),
                            const Text(
                              " kg",
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: const Icon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    kCurrentWeight -= 0.5;
                                  });
                                }),
                            const SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(
                                icon: const Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    kCurrentWeight += 0.5;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CardLayout(
                    color: kCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          kCurrentAge.toString(),
                          style: kDataTextStyle,
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: const Icon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    kCurrentAge--;
                                  });
                                }),
                            const SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(
                                icon: const Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    kCurrentAge++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              calculate calc =
                  calculate(weight: kCurrentWeight, height: kCurrentHeight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => result_page(
                    bmi: calc.computeBMI(),
                    bmiResult: calc.getBmiResult(),
                    bmiDescription: calc.getDescription(),
                  ),
                ),
              );
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
                  "Calculate",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {super.key, required this.icon, required this.onPressed});

  final Icon icon;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      onPressed: onPressed,
      fillColor: const Color(0xFF8E8E98),
      constraints: const BoxConstraints.tightFor(
        width: 50.0,
        height: 56.0,
      ),
      elevation: 10.0,
      child: icon,
    );
  }
}
