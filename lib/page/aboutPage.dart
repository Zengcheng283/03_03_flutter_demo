// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_demo/methods/appBar.dart';

/// 此文件保存关于页内容

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final String title = "关于"; // 定义顶部文字

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title),
      body: Center(
        child: Wrap(
          spacing: 8.0, // 主轴(水平)方向间距
          runSpacing: 4.0, // 纵轴（垂直）方向间距
          alignment: WrapAlignment.center, //沿主轴方向居中
          children: const <Widget>[
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text('王', style: TextStyle(color: Colors.black))),
              label: Text('王子易', style: TextStyle(color: Colors.black)),
            ),
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text('秦', style: TextStyle(color: Colors.black))),
              label: Text('秦皎杰', style: TextStyle(color: Colors.black)),
            ),
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text('曾', style: TextStyle(color: Colors.black))),
              label: Text('曾程', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black, // 底色为黑色
    );
  }
}
