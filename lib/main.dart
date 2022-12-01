import 'package:flutter/material.dart';
import 'package:flutter_demo/appBar.dart';
import 'package:flutter_demo/bottomBar.dart';
import 'package:flutter_demo/leftDocker.dart';
import 'package:flutter_demo/logic.dart';
import 'package:flutter_demo/linearProgress.dart';

/// 主函数入口，由此开始运行程序

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '电子木鱼',
      theme: ThemeData(),
      home: const MyHomePage(title: '电子木鱼V1.0'), // 关闭debug标签的显示
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
                  TextButton(
                    onPressed: _timeCounter,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: const Text(
                      '次数-100',
                    ),
                  ),
                  const Text("       "),
                  TextButton(
                    onPressed: _smileCounter,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: const Text(
                      '功德-100',
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _incrementCounter,
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
          label: const Text("敲木鱼"),
        ), // This trailing comma makes auto-formatting nicer for build methods.
        backgroundColor: Colors.black,
        bottomNavigationBar: bottomNavigationBar(context, electronMuyu),
        drawer: drawer());
  }
}
