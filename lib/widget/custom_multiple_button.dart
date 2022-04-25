import 'package:flutter/material.dart';

class CustomMultipleButton extends StatefulWidget {

  CustomMultipleButton(
      {Key? key,
      required this.title,
      required this.value,
      required this.min,
      required this.max,
      required this.onCallback})
      : super(key: key);

  final String title;
  int value;
  final int min;
  final int max;
  final Function(int) onCallback;

  @override
  State<StatefulWidget> createState() {
    return _CustomMultipleButtonState();
  }
}

class _CustomMultipleButtonState extends State<CustomMultipleButton> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    // final String jsonString = jsonEncode(widget.value);
    // String newStr = const JsonDecoder().convert(jsonString);
    // int newValue = int.parse(newStr);
    _value = widget.value;

    return Container(
      color: const Color(0xff1E2139),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: const TextStyle(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _value.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      int newValue = _value - 1;
                      if (newValue >= widget.min) {
                        _value = _value - 1;
                      }

                      widget.onCallback(_value);
                    });
                  },
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                    primary: const Color(0xff555868), // <-- Button color
                    onPrimary: const Color(0xffEF005D), // <-- Splash color
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      int newValue = _value + 1;
                      if (newValue <= widget.max) {
                        _value = _value + 1;
                      }
                    });

                    widget.onCallback(_value);
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                    primary: const Color(0xff555868), // <-- Button color
                    onPrimary: const Color(0xffEF005D), // <-- Splash color
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
