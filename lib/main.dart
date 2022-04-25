import 'package:bmi_calculator/result.dart';
import 'package:bmi_calculator/widget/custom_multiple_button.dart';
import 'package:bmi_calculator/widget/custom_toggle_btn.dart';
import 'package:flutter/material.dart';

import 'widget/custom_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BMI CALCULATOR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _height = 180;
  int _weight = 60;
  int _age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff151833),
      appBar: AppBar(
          title: Text(widget.title), backgroundColor: const Color(0xff151833)),
      body: _buildBody(),
      bottomNavigationBar: SizedBox(
        // color: const Color(0xffEF005D),
        height: Theme.of(context).buttonTheme.height,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            child: const Text(
              'CALCULATE',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ResultPage(title: 'BMI CALCULATOR', height: _height, age: _age, weight: _weight)),
              );
            },
            style: ElevatedButton.styleFrom(primary: const Color(0xffEF005D))),
      ),
    );
  }

  double getBMI() {
    double heightM = _height.toDouble() / 100.0;
    double result = (_weight.toDouble() / (heightM * heightM));
    String resultStr = result.toStringAsFixed(2);
    return double.parse(resultStr);
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _genderWidget(),
        _heightWidget(),
        _weightAndAgeWidget(),
      ],
    );
  }

  Widget _genderWidget() {
    return Expanded(
      child: CustomToggleBtn(
          title1: 'MALE',
          iconData1: Icons.male,
          title2: 'FEMALE',
          iconData2: Icons.female,
          onSelectItem: (index) {

          }),
    );
  }

  Widget _heightWidget() {
    return Expanded(
      child: Container(
          margin: const EdgeInsets.all(10),
          child: CustomSlider(
            title: 'HEIGHT',
            unit: 'cm',
            value: _height,
            min: 0,
            max: 250,
            onCallback: (result) {
              setState(() {
                _height = result;
              });
            },
          )),
    );
  }

  Widget _weightAndAgeWidget() {
    return Expanded(
        child: Row(
      children: [
        Expanded(
          child: Container(
              margin: const EdgeInsets.all(10),
              child: CustomMultipleButton(
                title: 'WEIGHT',
                value: _weight,
                min: 1,
                max: 120,
                onCallback: (weight) {
                  setState(() {
                    _weight = weight;
                  });
                },
              )),
        ),
        Expanded(
          child: Container(
              margin: const EdgeInsets.all(10),
              child: CustomMultipleButton(
                title: 'AGE',
                value: _age,
                min: 0,
                max: 120,
                onCallback: (age) {
                  setState(() {
                    _age = age;
                  });
                },
              )),
        )
      ],
    ));
  }
}
