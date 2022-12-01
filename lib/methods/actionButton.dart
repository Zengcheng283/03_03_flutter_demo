import 'package:flutter/material.dart';

FloatingActionButton floatingActionButton(void Function() method) {
  return FloatingActionButton.extended(
    onPressed: method,
    backgroundColor: Colors.grey,
    foregroundColor: Colors.white,
    label: const Text("敲木鱼"),
  );
}
