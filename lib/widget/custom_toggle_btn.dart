import 'package:flutter/material.dart';

class CustomToggleBtn extends StatefulWidget {
  const CustomToggleBtn(
      {Key? key,
      required this.title1,
      required this.iconData1,
      required this.title2,
      required this.iconData2,
      required this.onSelectItem})
      : super(key: key);

  final String title1;
  final IconData iconData1;
  final String title2;
  final IconData iconData2;
  final Function(int) onSelectItem;

  @override
  State<StatefulWidget> createState() {
    return _CustomToggleState();
  }
}

class _CustomToggleState extends State<CustomToggleBtn> {
  final Color _deselectedColor = const Color(0xff1E2139);
  bool isFirstBtnSelected = true;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Container(
              margin: const EdgeInsets.all(10), child: _firstButton())),
      Expanded(
          child: Container(
              margin: const EdgeInsets.all(10), child: _secondButton())),
    ]);
  }

  Widget _firstButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: _deselectedColor),
      onPressed: isFirstBtnSelected
          ? null
          : () {
              setState(() {
                isFirstBtnSelected = true;
              });

              widget.onSelectItem(0);
            },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            child: Icon(
              widget.iconData1,
              color: Colors.white,
              size: 50,
            ),
          ),
          Text(
            widget.title1,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }

  Widget _secondButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: _deselectedColor),
      onPressed: !isFirstBtnSelected
          ? null
          : () {
              setState(() {
                isFirstBtnSelected = false;
              });

              widget.onSelectItem(1);
            },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            child: Icon(
              widget.iconData2,
              color: Colors.white,
              size: 50,
            ),
          ),
          Text(
            widget.title2,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
