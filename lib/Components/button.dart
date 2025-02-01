import 'package:flutter/material.dart';

Widget buildButton(
  String text, {
  Color? buttonColor = Colors.blueGrey,
  double? size = 35,
  void Function()? onPress,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 6.0),
    child: Material(
      borderRadius: BorderRadiusDirectional.circular(300),
      color: buttonColor,
      child: InkWell(
        onTap: onPress,
        borderRadius: BorderRadius.circular(200),
        splashColor: Colors.transparent,
        child: Container(
          width: 81,
          height: 81,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: size,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
