import 'dart:math';
class CalculatorBrain {

  int userHeightFt;
  int userHeightIn;
  int userWeight;
  String bmiResult;
  String interpretation;

  CalculatorBrain({this.userWeight, this.userHeightFt, this.userHeightIn});

  String calcBMI(){
    int totalHeightInInches = ((userHeightFt * 12) + userHeightIn);
    double heightInMetres = totalHeightInInches * 0.0254;
    return bmiResult = (userWeight / (pow(heightInMetres, 2))).toStringAsFixed(1);
  }

  String getInterpretation(){
    if(double.parse(bmiResult) < 18.5){
      interpretation = 'Underweight';
    }else if(double.parse(bmiResult) >= 18.5 && double.parse(bmiResult) <= 24.9){
      interpretation = 'Normal Weight';
    }else if(double.parse(bmiResult) >= 25.0 && double.parse(bmiResult) <= 29.9){
      interpretation = 'Overweight';
    }else if(double.parse(bmiResult) >= 3.0){
      interpretation = 'Obese';
    }
    return interpretation;
  }

}