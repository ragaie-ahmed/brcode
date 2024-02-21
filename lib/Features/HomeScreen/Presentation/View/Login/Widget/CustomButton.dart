
import 'package:flutter/material.dart';

class DefultButton extends StatelessWidget {
  DefultButton({super.key, required this.onPressed, required this.text});
  void Function()?  onPressed;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 38,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.blueAccent),
        child: MaterialButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat meduim',
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            )));
  }
}
