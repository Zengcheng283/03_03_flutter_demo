import 'package:flutter/material.dart';

TextButton textButton(void Function() method, String text) {
  return TextButton(
    onPressed: method,
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey),
        foregroundColor: MaterialStateProperty.all(Colors.white)),
    child: Text(text),
  );
}
