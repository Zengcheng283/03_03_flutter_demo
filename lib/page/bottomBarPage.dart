// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_demo/methods/logic.dart';
import 'package:flutter_demo/methods/showDialog.dart';

/// 此文件保存底部dock栏项
/// 由于私有类调用，暂时无法使用

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
          onPressed: () async {
            String response = await saveData(
                electronMuyu.getTimes(), electronMuyu.getGonde());
            showDialog(
                context: context,
                builder: (context) => nomalDialog("保存", response, context));
          },
        ),
        const SizedBox(), // 中间位置空出
        IconButton(
          icon: const Icon(Icons.sync),
          color: Colors.white, // 按钮颜色为白色
          onPressed: () async {
            // List value = await decodeRead();
          },
        ),
      ], //均分底部导航栏横向空间
    ),
  );
}
