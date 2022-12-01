import 'package:flutter/material.dart';
import 'package:flutter_demo/methods/actionButton.dart';
import 'package:flutter_demo/methods/appBar.dart';
import 'package:flutter_demo/page/bottomBarPage.dart';
import 'package:flutter_demo/page/leftDockerPage.dart';
import 'package:flutter_demo/methods/logic.dart';
import 'package:flutter_demo/methods/linearProgress.dart';
import 'package:flutter_demo/methods/textButton.dart';

/// 主函数入口，由此开始运行程序

bool loginState = false;

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
        loginState: false,
      ), // 关闭debug标签的显示
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required loginState, required this.title});
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
                  textButton(_timeCounter, '次数-100'),
                  const Text("       "),
                  textButton(_smileCounter, '功德-100'),
                ],
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: floatingActionButton(_incrementCounter),
        backgroundColor: Colors.black,
        bottomNavigationBar: bottomNavigationBar(context, electronMuyu),
        drawer: drawer(loginState, context));
  }
}
