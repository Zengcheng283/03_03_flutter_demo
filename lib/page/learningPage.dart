// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_demo/methods/appBar.dart';

/// 此文件保存学习页内容

class LearningPage extends StatefulWidget {
  const LearningPage({super.key});

  @override
  State<LearningPage> createState() => _LearningPage();
}

class _LearningPage extends State<LearningPage> {
  final String title = "设计与使用"; // 定义顶部文字

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title),
      body: Center(
          // 定义主体内容
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // 定义上下在开始位置，即顶部
          crossAxisAlignment: CrossAxisAlignment.start, // 定义左右在开始位置
          children: const [
            Text("1.概要：", style: TextStyle(color: Colors.white)),
            Text("    本软件是电子木鱼V1.0，该软件在设计时，设计了主页、抽屉、底部栏、关于等几个页面，",
                style: TextStyle(color: Colors.white)),
            Text("    主页的功能设计有：", style: TextStyle(color: Colors.white)),
            Text("        1.播放音乐", style: TextStyle(color: Colors.white)),
            Text("        2.敲击木鱼", style: TextStyle(color: Colors.white)),
            Text("        3.增加条", style: TextStyle(color: Colors.white)),
            Text("    抽屉的功能设计有：", style: TextStyle(color: Colors.white)),
            Text("        1.其他页面（如关于、学习等页面的导航）",
                style: TextStyle(color: Colors.white)),
            Text("    底部栏的功能设计有：", style: TextStyle(color: Colors.white)),
            Text("        1.保存当前进度", style: TextStyle(color: Colors.white)),
            Text("        2.读取当前进度", style: TextStyle(color: Colors.white)),
            Text("2.使用方法：", style: TextStyle(color: Colors.white)),
            Text("    1.进入本应用即进入主要功能页", style: TextStyle(color: Colors.white)),
            Text("    2.底部栏左侧按钮为保存进度，右侧按钮为读取进度",
                style: TextStyle(color: Colors.white)),
            Text("    3.左上角为抽屉界面，内部为其他页面导航栏",
                style: TextStyle(color: Colors.white)),
            Text("    4.进入其他页面后，点击左上角箭头即可返回主页",
                style: TextStyle(color: Colors.white)),
          ],
        ),
      )),
      backgroundColor: Colors.black, // 底色为黑色
    );
  }
}
