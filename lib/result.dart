import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {

  const ResultPage({Key? key, required this.title, required this.height, required this.weight, required this.age})
      : super(key: key);

  final String title;
  final int height;
  final int weight;
  final int age;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  double getBMI() {
    double heightM = widget.height.toDouble() / 100.0;
    double result = (widget.weight.toDouble() / (heightM * heightM));
    String resultStr = result.toStringAsFixed(2);
    return double.parse(resultStr);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff151833),
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          backgroundColor: const Color(0xff151833),
          title: Container(
              alignment: Alignment.center, child: Text(widget.title))),
      body: _buildBody(),
      bottomNavigationBar: SizedBox(
        // color: const Color(0xffEF005D),
        height: Theme.of(context).buttonTheme.height,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            child: const Text(
              'RE-CALCULATE',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(primary: const Color(0xffEF005D))),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildBody() {
    double bmi = getBMI();

    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(15),
          child: const Text('Your Result',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          color: const Color(0xff1E2139),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                alignment: Alignment.center,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Text(getBmiMeasure(bmi),
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  bmi.toString(),
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                child: Text(
                  getBmiSuggestion(bmi),
                  style: const TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  String getBmiMeasure(double bmi) {
    if(bmi > 18.5) {
      return "UNDERWEIGHT";
    } else if(bmi > 22.9) {
      return "NORMAL";
    } else if(bmi < 24.9) {
      return "NORMAL";
    } else if(bmi < 29.9) {
      return "OVERWEIGHT";
    } else {
      return "OVERWEIGHT";
    }
  }

  String getBmiSuggestion(double bmi) {
    if(bmi > 18.5) {
      return "You have a lower than normal body weight. You can eat a bit more.";
    } else if(bmi > 22.9) {
      return "You have a normal body weight. Good job!";
    } else if(bmi < 24.9) {
      return "You have a normal body weight. Good job!";
    } else if(bmi < 29.9) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else {
      return "You have a higher than normal body weight. Try to exercise more.";
    }
  }
}
