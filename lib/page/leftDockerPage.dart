// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter_demo/page/loginPage.dart';

/// 此文件保存左侧dock栏内容

Drawer drawer(bool loginState, BuildContext context) {
  if (loginState) {
    return buildDrawer("曾程", "曾程", "信息学院", "20191060222", context);
  } else {
    return buildDrawer("未登录", "未登录", "未登录", "未登录", context);
  }
}

Drawer buildDrawer(String header, String name, String school, String number,
    BuildContext context) {
  return Drawer(
    backgroundColor: Colors.black,
    child: Column(
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          child: Center(
            child: SizedBox(
              width: 60.0,
              height: 60.0,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const LoginPage())));
                  },
                  child: Text(
                    header,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),

        /// 以下为dock栏项，暂时无法点击动作
        ListTile(
          leading: const Icon(Icons.abc),
          title: Text(
            buildText("姓名", name),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.abc),
          title: Text(
            buildText("学院", school),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.abc),
          title: Text(
            buildText("学号", number),
            style: const TextStyle(color: Colors.white),
          ),
        )
      ],
    ),
  );
}

String buildText(String symbool, String text) {
  return "${symbool}:${text}";
}
