import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/conponents/icon_content.dart';
import 'package:bmi_calculator/conponents/resuable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'result_page.dart';
import 'package:bmi_calculator/conponents/round_icon_button.dart';
import 'package:bmi_calculator/conponents/bottom_button.dart';
import 'result_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';


enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        // brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          //color: Colors.red,
          backgroundColor: Color(0xFF0A0E21),
        ),

        buttonTheme: const ButtonThemeData(),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI CALCULATOR',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.Male;
                        });
                      },
                      colour: selectedGender == Gender.Male
                          ? kactiveCardColor
                          : kinActiveCardColor,
                      cardChild: const IconContent(
                          icon: FontAwesomeIcons.mars, label: "MALE"),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.Female;
                        });
                      },
                      colour: selectedGender == Gender.Female
                          ? kactiveCardColor
                          : kinActiveCardColor,
                      cardChild: const IconContent(
                          icon: FontAwesomeIcons.venus, label: "FEMALE"),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('HEIGHTT', style: klableTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: knumberTextStyle),
                        const Text(
                          'cm',
                          style: klableTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        activeTrackColor: Colors.white,
                        inactiveTickMarkColor: Color(0xff8D8E98),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220, //Color(0xFFEB1555)
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
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'WEIGHT',
                            style: klableTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: knumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                          // IconButton(
                          //     onPressed: (){},
                          //     icon: Icon(Icons.add),
                          // )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: ReusableCard(
                            colour: kactiveCardColor,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'AGE',
                                  style: klableTextStyle,
                                ),
                                Text(
                                  age.toString(),
                                  style: knumberTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPressed: () {
                                        setState(() {
                                          age--;
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            BottonButton(
              ButtonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Color maleCardColour = inActiveCardColor;
// Color femaleCardColour = activeCardColor;
//1 = male 2 =female
// void updateColour(Gender selectedGender){
//   if(selectedGender == Gender.Male){
//     if(maleCardColour == inActiveCardColor){
//       maleCardColour = activeCardColor;
//       femaleCardColour = inActiveCardColor;
//     }else{
//       maleCardColour = inActiveCardColor;
//     }
//   }
//   //female card pressed
//   if (selectedGender == Gender.Female){
//     if(femaleCardColour == inActiveCardColor){
//       femaleCardColour = activeCardColor;
//       maleCardColour = inActiveCardColor;
//     }else{
//       femaleCardColour = inActiveCardColor;
//     }
//
//   }
// }
