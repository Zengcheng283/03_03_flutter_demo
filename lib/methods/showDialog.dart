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
