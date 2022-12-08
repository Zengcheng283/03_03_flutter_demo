// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_demo/page/aboutPage.dart';
import 'package:flutter_demo/page/learningPage.dart';
// import 'package:flutter_demo/page/loginPage.dart';

/// 此文件保存左侧dock栏内容

Drawer drawer(bool loginState, BuildContext context) {
  return buildDrawer("未命名", "电子木鱼V1.0", "设计与使用", "关于", context);
}

Drawer buildDrawer(String header, String page1, String page2, String page3,
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
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: ((context) => const LoginPage())));
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
            page1,
            style: const TextStyle(color: Colors.white),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.abc),
          title: Text(
            page2,
            style: const TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const LearningPage())));
          },
        ),
        ListTile(
          leading: const Icon(Icons.abc),
          title: Text(
            page3,
            style: const TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const AboutPage())));
          },
        )
      ],
    ),
  );
}

String buildText(String symbool, String text) {
  return "$symbool:$text";
}
