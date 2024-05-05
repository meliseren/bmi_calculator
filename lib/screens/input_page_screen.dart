import 'package:bmi_calculator/components/gender_button.dart';
import 'package:bmi_calculator/components/weight_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/infrastructure/constant.dart';
import 'package:bmi_calculator/infrastructure/enums.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPageScreen extends StatefulWidget {
  const InputPageScreen({super.key});

  @override
  State<InputPageScreen> createState() => _InputPageScreenState();
}

class _InputPageScreenState extends State<InputPageScreen> {
  Gender selectedGender = Gender.unselected;
  var height = 90.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GenderButton(
                          isActive: selectedGender == Gender.male,
                          label: 'Male',
                          iconData: FontAwesomeIcons.mars,
                          onPress: () {
                            selectedGender = Gender.male;
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: GenderButton(
                          isActive: selectedGender == Gender.female,
                          label: 'Female',
                          iconData: FontAwesomeIcons.venus,
                          onPress: () {
                            selectedGender = Gender.female;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'HEIGHT',
                          style:
                              TextStyle(color: kLabelTextColor, fontSize: 18.0),
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              height.toStringAsFixed(0),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Column(
                              children: [
                                Text(''),
                                Text(
                                  'cm',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: Color(0xFF8D8E98),
                              activeTrackColor: Color(0xFFEB1555),
                              overlayColor: Color.fromARGB(255, 79, 0, 24),
                              thumbColor: Color(0xFFEB1555),
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 15,
                              ),
                              overlayShape: RoundSliderOverlayShape(
                                overlayRadius: 20.0,
                              )),
                          child: Slider(
                            value: height,
                            min: 90,
                            max: 210,
                            onChanged: (value) {
                              height = value;
                              setState(() {});
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ReusableCard(
                            color: kActiveColor,
                            child: Column(
                              children: [
                                Text(
                                  'WEIGHT',
                                  style: TextStyle(
                                      color: kLabelTextColor, fontSize: 18.0),
                                  textAlign: TextAlign.center,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '65',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'kg',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: WeightButton(
                                        iconData: FontAwesomeIcons.minus,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )),
                      ),
                      Expanded(
                        child: ReusableCard(
                          color: kActiveColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }
}
