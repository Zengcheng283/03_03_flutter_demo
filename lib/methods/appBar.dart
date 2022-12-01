import 'package:flutter/material.dart';

/// 此文件保存顶部导航条，显示文字根据传入文字确定

AppBar appBar(String title) {
  // 传入文字
  return AppBar(
    title: Text(title), // title显示
    backgroundColor: Colors.grey, // 底色显示为灰色
  );
}
