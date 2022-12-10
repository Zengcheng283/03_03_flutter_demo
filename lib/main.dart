import 'package:flutter/material.dart';
import 'package:flutter_demo/methods/actionButton.dart';
import 'package:flutter_demo/methods/appBar.dart';
import 'package:flutter_demo/methods/showDialog.dart';
import 'package:flutter_demo/page/leftDockerPage.dart';
import 'package:flutter_demo/methods/logic.dart';
import 'package:flutter_demo/methods/linearProgress.dart';
import 'package:flutter_demo/methods/textButton.dart';
import 'package:audioplayers/audioplayers.dart';

/// 主函数入口，由此开始运行程序

LoginState loginState = LoginState(false);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '电子木鱼V1.0',
      theme: ThemeData(),
      home: const MyHomePage(
        title: '电子木鱼V1.0',
      ), // 关闭debug标签的显示
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ElectronMuyu electronMuyu = ElectronMuyu(0, 0);
  int counterTimes = 0;
  int counterGongde = 0;
  bool _isPlaying = false;
  String text = "播放";
  Audio audio = Audio(PlayerMode.lowLatency, ReleaseMode.loop);

  void _incrementCounter() {
    setState(() {
      int res = electronMuyu.addTimes();
      if (res != -1) {
        counterTimes = res;
      }
    });
  }

  void _timeCounter() {
    setState(() {
      List res = electronMuyu.addGonde();
      counterTimes = res[0];
      counterGongde = res[1];
    });
  }

  void _smileCounter() {
    setState(() {
      int res = electronMuyu.deleteGonde();
      if (res != -1) {
        counterGongde = res;
      }
    });
  }

  void _readSave(int times, int gongde) {
    setState(() {
      counterTimes = times;
      counterGongde = gongde;
      electronMuyu.setGonde(gongde);
      electronMuyu.setTimes(times);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // 页面主体开始
        appBar: appBar(widget.title), // 定义顶部栏
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // 定义上下在开始位置，即顶部
              crossAxisAlignment: CrossAxisAlignment.center, // 定义左右在中间位置
              children: [
                textLinearProgressIndicatorTimes(electronMuyu),
                Container(
                  // 设定进度条与进度条之间隔开20px
                  height: 20,
                ),
                textLinearProgressIndicatorGongde(electronMuyu),
                Container(
                  // 设定进度条与按钮隔开50px
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textButton(_timeCounter, '次数-100'),
                    const Text("       "),
                    textButton(_smileCounter, '功德-100'),
                  ],
                ),
                const Spacer(), // 将播放和暂停按钮放置于底部末尾位置
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(5.0),
                      onPressed: (() {
                        _isPlaying = !_isPlaying;
                        setState(() {
                          if (_isPlaying) {
                            audio.audioPlay("background.mp3");
                          } else {
                            audio.audioPause();
                          }
                        });
                      }),
                      color: Colors.white,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      icon: _isPlaying
                          ? const Icon(Icons.pause)
                          : const Icon(Icons.play_arrow),
                    ),
                    const Text("    ")
                  ],
                ),
                const Text("")
              ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: floatingActionButton(_incrementCounter),
        backgroundColor: Colors.black,
        bottomNavigationBar: BottomAppBar(
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
                      builder: (context) =>
                          nomalDialog("保存", response, context));
                },
              ),
              const SizedBox(), // 中间位置空出
              IconButton(
                icon: const Icon(Icons.sync),
                color: Colors.white, // 按钮颜色为白色
                onPressed: () async {
                  List value = await getData();
                  _readSave(value[0], value[1]);
                },
              ),
            ], //均分底部导航栏横向空间
          ),
        ),
        drawer: drawer(loginState, context));
  }
}
