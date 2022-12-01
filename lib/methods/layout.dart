import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '布局组件',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '布局组件'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          backgroundColor: Colors.grey,
        ),
        body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
                // Column is also a layout widget. It takes a list of children and
                // arranges them vertically. By default, it sizes itself to fit its
                // children horizontally, and tries to be as tall as its parent.
                //
                // Invoke "debug painting" (press "p" in the console, choose the
                // "Toggle Debug Paint" action from the Flutter Inspector in Android
                // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                // to see the wireframe for each widget.
                //
                // Column has various properties to control how it sizes itself and
                // how it positions its children. Here we use mainAxisAlignment to
                // center the children vertically; the main axis here is the vertical
                // axis because Columns are vertical (the cross axis would be
                // horizontal).
                children: [
              const Text("Wrap布局"),
              Wrap(
                spacing: 8.0, // 主轴(水平)方向间距
                runSpacing: 4.0, // 纵轴（垂直）方向间距
                alignment: WrapAlignment.center, //沿主轴方向居中
                children: const <Widget>[
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue, child: Text('A')),
                    label: Text('云南大学'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue, child: Text('M')),
                    label: Text('信息学院'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue, child: Text('H')),
                    label: Text('20191060222'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue, child: Text('J')),
                    label: Text('曾程'),
                  ),
                ],
              ),
              const Text("Flow布局"),
              Flow(
                delegate: TestFlowDelegate(margin: const EdgeInsets.all(10.0)),
                children: <Widget>[
                  Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.red,
                  ),
                  Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.orange,
                  ),
                  Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.green,
                  ),
                  Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.indigo,
                  ),
                  Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.purple,
                  ),
                ],
              )
            ])));
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin;

  TestFlowDelegate({this.margin = EdgeInsets.zero});

  double width = 0;
  double height = 0;

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 指定Flow的大小，简单起见我们让宽度竟可能大，但高度指定为200，
    // 实际开发中我们需要根据子元素所占用的具体宽高来设置Flow大小
    return const Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
