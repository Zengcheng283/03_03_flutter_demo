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
        // 定义主体内容
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 定义文字在上下居中
          crossAxisAlignment: CrossAxisAlignment.center, // 定义文字在左右居中
          children: const [
            Text(
              '作者：曾程',
              style: TextStyle(
                  fontSize: 20, // 字体大小为20
                  fontWeight: FontWeight.bold, // 加粗
                  color: Colors.white), // 文字颜色为白色
            ),
            Text(
              '学院：信息学院',
              style: TextStyle(
                  fontSize: 20, // 字体大小为20
                  fontWeight: FontWeight.bold, // 加粗
                  color: Colors.white), // 文字颜色为白色
            ),
            Text(
              '学号：20191060222',
              style: TextStyle(
                  fontSize: 20, // 字体大小为20
                  fontWeight: FontWeight.bold, // 加粗
                  color: Colors.white), // 文字颜色为白色
            )
          ],
        ),
      ),
      backgroundColor: Colors.black, // 底色为黑色
    );
  }
}
