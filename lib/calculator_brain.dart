import 'dart:math';

class CalculatorBrain{

  CalculatorBrain({this.height, this.weight});
  final int ?height;
  final int ?weight;
  double _bmi = 0;
  String calculateBMI() {
    if (height != null && weight != null) {
      // Perform the BMI calculation only if height and weight are non-null
      _bmi = weight! / pow(height! / 100, 2);
      return _bmi.toStringAsFixed(1);
    } else {
      return 'Invalid Input'; // Handle case where height or weight is null
    }
  }
  String getResult(){
    if (_bmi>= 25){
      return 'Overweight';
    }else if(_bmi>18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }
  String getInterpretation(){
    if (_bmi>= 25){
      return 'You have a heigher than a normal body weight. Try to exercise more.';
    }else if(_bmi>18.5){
      return 'You have a normal body weight. Good job!';
    }else{
      return 'You have a lower than a normal body weight. You can eat a bit more.';
    }
  }
}