import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider(
      {Key? key,
      required this.title,
      required this.unit,
      required this.value,
      required this.min,
      required this.max,
      required this.onCallback})
      : super(key: key);

  final String title;
  final String unit;
  final int value;
  final int min;
  final int max;
  final Function(int) onCallback;

  @override
  State<StatefulWidget> createState() {
    return _CustomSliderState();
  }
}

class _CustomSliderState extends State<CustomSlider> {

  double _value = 0;

  @override
  Widget build(BuildContext context) {
    _value = widget.value.toDouble();
    return Container(
      alignment: Alignment.center,
      color: const Color(0xff1E2139),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: const TextStyle(color: Colors.grey),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _value.toInt().toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.unit,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Slider(
              min: widget.min.toDouble(),
              max: widget.max.toDouble(),
              value: _value.toDouble(),
              inactiveColor: const Color(0xff555868),
              thumbColor: const Color(0xffEF005D),
              activeColor: Colors.white,
              onChanged: (newValue) {
                widget.onCallback(newValue.toInt());
                setState(() {
                  _value = newValue;
                });
              }
          )
        ],
      ),
    );
  }
}
