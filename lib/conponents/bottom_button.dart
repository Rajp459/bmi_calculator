import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottonButton extends StatelessWidget {
  BottonButton({required this.ButtonTitle, required this.onTap});

  final GestureTapCallback onTap;
  final String ButtonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          ButtonTitle,
          style: kLargeButtonTextStyle,
        )),
        color: kbottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: kbottomContainerHeight,
      ),
    );
  }
}
