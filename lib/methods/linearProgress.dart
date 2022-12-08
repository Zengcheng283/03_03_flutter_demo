// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_demo/methods/logic.dart';

/// 此文件保存进度条内容

LinearProgressIndicator myLinearProgressIndicatorTimes(
    // 创建进度条
    ElectronMuyu electronMuyu) {
  return LinearProgressIndicator(
    backgroundColor: Colors.grey[200], // 定义白色底
    valueColor: const AlwaysStoppedAnimation(Colors.grey), // 定义进度灰色
    value: electronMuyu.getTimes() / 100, // 获取次数并除100(进度条允许值最大为1)
  );
}

LinearProgressIndicator myLinearProgressIndicatorGongde(
    // 创建进度条
    ElectronMuyu electronMuyu) {
  return LinearProgressIndicator(
    backgroundColor: Colors.grey[200], // 定义白色底
    valueColor: const AlwaysStoppedAnimation(Colors.grey), // 定义进度灰色
    value: electronMuyu.getGonde() / 100, // 获取功德值并除100(进度条允许值最大为1)
  );
}

Row textLinearProgressIndicatorTimes(ElectronMuyu electronMuyu) {
  // 与文字进行合并
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text('次数进度条:', style: TextStyle(color: Colors.white)), // 定义白底文字
      Container(
        // 进度条会撑满父窗口，因此将进度条放在Container中
        margin: const EdgeInsets.all(20),
        height: 10, // 定义高度10
        width: 500, // 定义宽度500
        child: myLinearProgressIndicatorTimes(electronMuyu), // 调用进度条创建
      ),
    ],
  );
}

Row textLinearProgressIndicatorGongde(ElectronMuyu electronMuyu) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text('功德进度条:', style: TextStyle(color: Colors.white)),
      Container(
        // 进度条会撑满父窗口，因此将进度条放在Container中
        margin: const EdgeInsets.all(20),
        height: 10, // 定义高度10
        width: 500, // 定义宽度500
        child: myLinearProgressIndicatorGongde(electronMuyu), // 调用进度条创建
      ),
    ],
  );
}
