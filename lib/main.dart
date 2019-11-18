import 'package:flutter/material.dart';
import 'result_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: calc(),
    );
  }
}

class calc extends StatefulWidget {
  @override
  _calcState createState() => _calcState();
}

class _calcState extends State<calc> {
  int heightFt = 5;
  int heightInch = 6;
  int weight = 80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0b1529),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  'Feet: $heightFt',
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'ft',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: RawMaterialButton(
                                    padding: EdgeInsets.all(20),
                                    onPressed: () {
                                      setState(() {
                                        heightFt++;
                                      });
                                    },
                                    fillColor: Color(0xFF0d264f),
                                    shape: CircleBorder(),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: RawMaterialButton(
                                    padding: EdgeInsets.all(20),
                                    onPressed: () {
                                      setState(() {
                                        if(heightFt <= 1){
                                          return;
                                        }
                                        heightFt--;
                                      });
                                    },
                                    fillColor: Color(0xFF0d264f),
                                    shape: CircleBorder(),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                'Inch: $heightInch',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'in',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: RawMaterialButton(
                                  padding: EdgeInsets.all(20),
                                  onPressed: () {
                                    setState(() {
                                      if(heightInch >= 11){
                                        return;
                                      }
                                      heightInch++;
                                    });
                                  },
                                  fillColor: Color(0xFF0d264f),
                                  shape: CircleBorder(),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: RawMaterialButton(
                                  padding: EdgeInsets.all(20),
                                  onPressed: () {
                                    setState(() {
                                      if(heightInch <= 0){
                                        return;
                                      }
                                      heightInch--;
                                    });
                                  },
                                  fillColor: Color(0xFF0d264f),
                                  shape: CircleBorder(),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            'Weight: $weight',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'kg',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SliderTheme(

                        data: SliderTheme.of(context).copyWith(
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.grey,


                        ),
                        child: Slider(
                          value: weight.toDouble(),
                          max: 250,
                          min: 30,
                          onChanged: (double newValue) {
                            setState(() {
                              weight = newValue.toInt();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ResultScreen(userWeight: weight, userHeightFt: heightFt, userHeightIn: heightInch,);
                  }),
                );
              },
              child: Container(
                color: Colors.red,
                height: 70.0,
                child: Center(
                  child: Text(
                    'CALCULATE BMI',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ReusableCard extends StatelessWidget {
  final Widget childWidget;

  ReusableCard(this.childWidget);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
      decoration: BoxDecoration(
        color: Color(0xFF26385c),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(15.0),
    );
  }
}
