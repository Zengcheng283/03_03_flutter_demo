import 'package:flutter/material.dart';

AlertDialog alertDialog(String data, BuildContext context) {
  return AlertDialog(
    title: const Text('保存成功'),
    content: Text(data),
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
