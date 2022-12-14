// ignore_for_file: file_names

import 'package:flutter/material.dart';

AlertDialog alertDialog(List data, BuildContext context) {
  String stream = "次数:${data[0]}\n功德:${data[1]}";
  return AlertDialog(
    title: const Text('保存成功'),
    content: Text(stream),
    actions: <Widget>[
      TextButton(
        child: const Text("确定"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}

AlertDialog nomalDialog(String title, String data, BuildContext context) {
  String stream = data;
  return AlertDialog(
    title: Text(title),
    content: Text(stream),
    actions: <Widget>[
      TextButton(
        child: const Text("确定"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}
