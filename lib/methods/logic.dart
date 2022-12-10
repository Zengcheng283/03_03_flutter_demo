import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';

/// 程序逻辑存放文件

Future<String> login(String userid, String pwd) async {
  var dio = Dio();
  dio.options.baseUrl = "http://127.0.0.1:60000";
  dio.options.connectTimeout = 5000; //5s
  dio.options.receiveTimeout = 5000;
  dio.options.headers["Access-Control-Allow-Origin"] = "*";
  dio.options.headers["Access-Control-Allow-Credentials"] = true;
  dio.options.headers["Access-Control-Allow-Headers"] =
      "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale";
  dio.options.headers["Access-Control-Allow-Methods"] =
      "GET, HEAD, POST, OPTIONS";
  Response response =
      await dio.post("/login", data: {"userId": userid, "pwd": pwd});
  return response.data["response"];
}

Future<String> register(String userid, String pwd) async {
  var dio = Dio();
  dio.options.baseUrl = "http://127.0.0.1:60000";
  dio.options.connectTimeout = 5000; //5s
  dio.options.receiveTimeout = 5000;
  dio.options.headers["Access-Control-Allow-Origin"] = "*";
  dio.options.headers["Access-Control-Allow-Credentials"] = true;
  dio.options.headers["Access-Control-Allow-Headers"] =
      "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale";
  dio.options.headers["Access-Control-Allow-Methods"] =
      "GET, HEAD, POST, OPTIONS";
  Response response =
      await dio.post("/register", data: {"userId": userid, "pwd": pwd});
  return response.data["response"];
}

Future<String> saveData(int times, int gongde) async {
  var dio = Dio();
  dio.options.baseUrl = "http://127.0.0.1:60000";
  dio.options.connectTimeout = 5000; //5s
  dio.options.receiveTimeout = 5000;
  dio.options.headers["Access-Control-Allow-Origin"] = "*";
  dio.options.headers["Access-Control-Allow-Credentials"] = true;
  dio.options.headers["Access-Control-Allow-Headers"] =
      "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale";
  dio.options.headers["Access-Control-Allow-Methods"] =
      "GET, HEAD, POST, OPTIONS";
  Response response =
      await dio.post("/save", data: {"times": times, "gongde": gongde});
  return response.data["response"];
}

Future<List> getData() async {
  var dio = Dio();
  dio.options.baseUrl = "http://127.0.0.1:60000";
  dio.options.connectTimeout = 5000; //5s
  dio.options.receiveTimeout = 5000;
  dio.options.headers["Access-Control-Allow-Origin"] = "*";
  dio.options.headers["Access-Control-Allow-Credentials"] = true;
  dio.options.headers["Access-Control-Allow-Headers"] =
      "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale";
  dio.options.headers["Access-Control-Allow-Methods"] =
      "GET, HEAD, POST, OPTIONS";
  Response response = await dio.get("/get");
  List rebackData = [response.data["times"], response.data["gongde"]];
  return rebackData;
}

// Future<List> decodeRead() async {
//   final file = File('db/save.txt');
//   final stream = await file.readAsString();
//   final listValue = stream.split(",");
//   return listValue;
// }

// Future<String> readFile() {
//   final stream = File("./db/learning.txt");
//   return stream.readAsString();
// }

// Future<void> decodeSave(ElectronMuyu electronMuyu) async {
//   var data = '${electronMuyu.getTimes()},${electronMuyu.getGonde()}';
//   // var file = File('./save.json');
//   var path = Directory("./db");
//   var file = File('./db/save.txt');
//   if (!await path.exists()) {
//     path.create();
//   }
//   if (await file.exists()) {
//     file.writeAsString(data);
//   } else {
//     try {
//       file.create();
//       file.writeAsString(data);
//     } catch (e) {
//       file.writeAsString(data);
//     }
//   }
// }

// List saveFile(ElectronMuyu electronMuyu, BuildContext context) {
//   decodeSave(electronMuyu);
//   List saveData = [electronMuyu.getTimes(), electronMuyu.getGonde()];
//   return saveData;
//   // Directory dir = Directory.current;
//   // print(dir);
// }

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

  void setTimes(int times) {
    counterTimes = times;
  }

  void setGonde(int gonde) {
    counterGongde = gonde;
  }
}

class Audio {
  AudioPlayer audioPlayer = AudioPlayer();

  Audio(PlayerMode playerMode, ReleaseMode releaseMode) {
    audioPlayer.setPlayerMode(playerMode);
    audioPlayer.setReleaseMode(releaseMode);
  }

  void audioPlay(String path) {
    audioPlayer.play(AssetSource(path));
  }

  void audioPause() {
    audioPlayer.pause();
  }
}

class LoginState {
  late bool loginState;
  late String loginName = "未登录";

  LoginState(this.loginState);

  void setLoginState(bool state) {
    loginState = state;
  }

  bool getLoginState() {
    return loginState;
  }

  void setLoginName(String name) {
    loginName = name;
  }

  String getLoginName() {
    if (loginName.length > 3) {
      return loginName.substring(0, 2);
    } else {
      return loginName;
    }
  }
}
