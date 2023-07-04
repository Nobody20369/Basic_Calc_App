import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  var color;
  var textcolor;
  String text;

  MyButton({
    Key? key,
    required this.color,
    required this.textcolor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.only(top: 3, bottom: 20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: textcolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
