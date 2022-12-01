import 'package:flutter/material.dart';
import 'package:flutter_demo/logic.dart';
import 'package:flutter_demo/showDialog.dart';
import 'aboutPage.dart';

/// 此文件保存底部dock栏项

BottomAppBar bottomNavigationBar(
    BuildContext context, ElectronMuyu electronMuyu) {
  return BottomAppBar(
    color: Colors.grey, // 底色为灰色
    notchMargin: 6.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(Icons.save),
          color: Colors.white, // 按钮颜色为白色
          onPressed: () {
            String data = saveFile(electronMuyu, context);
            showDialog(
                context: context,
                builder: (context) => alertDialog(data, context));
          },
        ),
        const SizedBox(), // 中间位置空出
        IconButton(
          icon: const Icon(Icons.settings),
          color: Colors.white, // 按钮颜色为白色
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) =>
                        const AboutPage()))); // 路由，连接到关于页，同时将当前页面放入栈保存
          },
        ),
      ], //均分底部导航栏横向空间
    ),
  );
}
