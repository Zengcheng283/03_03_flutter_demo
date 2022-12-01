import 'package:flutter/material.dart';

/// 此文件保存左侧dock栏内容

Drawer drawer() {
  return Drawer(
    backgroundColor: Colors.black,
    child: Column(
      children: const [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
          child: Center(
            child: SizedBox(
              width: 60.0,
              height: 60.0,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: Text(
                  '曾程',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),

        /// 以下为dock栏项，暂时无法点击动作
        ListTile(
          leading: Icon(Icons.abc),
          title: Text(
            '作者：曾程',
            style: TextStyle(color: Colors.white),
          ),
        ),
        ListTile(
          leading: Icon(Icons.abc),
          title: Text(
            '学院：信息学院',
            style: TextStyle(color: Colors.white),
          ),
        ),
        ListTile(
          leading: Icon(Icons.abc),
          title: Text(
            '学号：20191060222',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    ),
  );
}
