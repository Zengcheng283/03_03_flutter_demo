import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

/// 程序逻辑存放文件

void decodeSave(ElectronMuyu electronMuyu) {
  var data =
      '{"counterTimes":${electronMuyu.getTimes()}, "counterGongde":${electronMuyu.getGonde()}}';
  Map<String, dynamic> userData = json.decode(data);
  var file = File('./save.txt');
  try {
    file.create();
    file.writeAsString(jsonEncode(userData));
  } catch (e) {
    file.writeAsString(jsonEncode(userData));
  }
}

List saveFile(ElectronMuyu electronMuyu, BuildContext context) {
  decodeSave(electronMuyu);
  List saveData = [electronMuyu.getTimes(), electronMuyu.getGonde()];
  return saveData;
  // Directory dir = Directory.current;
  // print(dir);
}

class ElectronMuyu {
  // 定义电子木鱼所使用到的变量：功德值和敲次数
  int counterTimes; // 定义敲次数
  int counterGongde; // 定义功德值

  ElectronMuyu(this.counterTimes, this.counterGongde); // 类构造函数

  int addTimes() {
    // 次数增加，若敲次数小于100则加1并返回次数，否则不加，返回-1
    if (counterTimes < 100) {
      counterTimes += 1;
      return counterTimes;
    } else {
      return -1;
    }
  }

  List addGonde() {
    // 功德增加，若敲次数等于100且功德值小于100则加1并使用List返回敲次数和功德值，否则直接返回原数值
    if (counterTimes == 100 && counterGongde < 100) {
      counterTimes -= 100;
      counterGongde += 1;
      return [counterTimes, counterGongde];
    } else {
      return [counterTimes, counterGongde];
    }
  }

  int deleteGonde() {
    // 功德减少，若功德值等于100则减100并返回当前功德值，否则返回-1
    if (counterGongde == 100) {
      counterGongde -= 100;
      return counterGongde;
    } else {
      return -1;
    }
  }

  int getGonde() {
    // 获取当前功德值，在进度条使用
    return counterGongde;
  }

  int getTimes() {
    // 获取当前次数，在进度条使用
    return counterTimes;
  }
}
