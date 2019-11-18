import 'dart:math';

import 'package:flutter/material.dart';
import 'calculatorBrain.dart';
class ResultScreen extends StatefulWidget {
  int userHeightFt;
  int userHeightIn;
  int userWeight;

  ResultScreen({this.userWeight, this.userHeightFt, this.userHeightIn});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
//  int totalHeightInInches;
//  double heightInMetres;
  String bmiResult;
  String interpretation;
  @override
  void initState() {
    super.initState();
//    totalHeightInInches = ((widget.userHeightFt * 12) + widget.userHeightIn);
//    heightInMetres = totalHeightInInches * 0.0254;
//    bmiResult =
//        (widget.userWeight / (pow(heightInMetres, 2))).toStringAsFixed(1);
      CalculatorBrain brain = CalculatorBrain(userWeight: widget.userWeight, userHeightFt: widget.userHeightFt, userHeightIn: widget.userHeightIn);
      bmiResult = brain.calcBMI();
      interpretation = brain.getInterpretation();
      print(bmiResult);
      print(interpretation);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0b1529),
        appBar: AppBar(
          backgroundColor: Color(0xFF0b1529),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Your Result:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    bmiResult,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                  Text(
                    interpretation,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Table(
                      border: TableBorder.all(width: 1.0, color: Colors.white),
                      children: <TableRow>[
                        TableRow(
                          children: <Widget>[
                            RowData('BMI'),
                            RowData('Interpretation')
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            RowData('Below 18.5'),
                            RowData('Underweight'),
                          ],
                        ),
                        TableRow(children: <Widget>[
                          RowData('18.5 - 24.9'),
                          RowData('Normal or Healthy Weight'),
                        ]),
                        TableRow(
                          children: <Widget>[
                            RowData('25.0 - 29.9'),
                            RowData('Overweight'),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            RowData('30.0 and Above'),
                            RowData('Obese'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 80),
                  color: Colors.red,
                  height: 70,
                  child: Center(
                    child: Text(
                      'RECALCULATE',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
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

class RowData extends StatelessWidget {
  final String text;
  RowData(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
