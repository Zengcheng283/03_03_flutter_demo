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
      title: '电子木鱼',
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
      home: const MyHomePage(title: '电子木鱼V1.0'),
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
  int _counter_times = 0;
  int _counter_gongde = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      if (_counter_times < 100) {
        _counter_times++;
      }
    });
  }

  void _timeCounter() {
    setState(() {
      if (_counter_times >= 100) {
        _counter_times -= 100;
        if (_counter_gongde < 100) {
          _counter_gongde++;
        }
      }
    });
  }

  void _smileCounter() {
    setState(() {
      if (_counter_gongde == 100) {
        _counter_gongde -= 100;
      }
    });
  }

  _myLinearProgressIndicator_times() {
    return LinearProgressIndicator(
      backgroundColor: Colors.grey[200],
      valueColor: const AlwaysStoppedAnimation(Colors.grey),
      value: _counter_times / 100,
    );
  }

  _myLinearProgressIndicator_gongde() {
    return LinearProgressIndicator(
      backgroundColor: Colors.grey[200],
      valueColor: const AlwaysStoppedAnimation(Colors.grey),
      value: _counter_gongde / 100,
    );
  }

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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            //   Text(
            //     '学院:信息学院',
            //     style: TextStyle(
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.white),
            //   ),
            //   Text("    "),
            //   Text(
            //     '姓名:曾程',
            //     style: TextStyle(
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.white),
            //   ),
            //   Text("    "),
            //   Text(
            //     '学号:20191060222',
            //     style: TextStyle(
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.white),
            //   ),
            // ]),
            // const Text(""),
            // const Text(""),
            // const Text(""),
            // const Text(""),
            // const Text(""),
            // const Text(""),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('次数进度条:', style: TextStyle(color: Colors.white)),
                Container(
                  margin: const EdgeInsets.all(20),
                  height: 10,
                  width: 500,
                  child: _myLinearProgressIndicator_times(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('功德进度条:', style: TextStyle(color: Colors.white)),
                Container(
                  margin: const EdgeInsets.all(20),
                  height: 10,
                  width: 500,
                  child: _myLinearProgressIndicator_gongde(),
                ),
              ],
            ),
            const Text(""),
            const Text(""),
            const Text(""),
            const Text(""),
            const Text(""),
            const Text(""),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _timeCounter,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey),
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                  child: const Text(
                    '次数-100',
                  ),
                ),
                const Text("       "),
                TextButton(
                  onPressed: _smileCounter,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey),
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
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
      bottomNavigationBar: _bottomNavigationBar(),
      drawer: Drawer(
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
      ),
    );
  }

  BottomAppBar _bottomNavigationBar() {
    return BottomAppBar(
      color: Colors.grey,
      // shape: const CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
      notchMargin: 6.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home),
            color: Colors.white,
            onPressed: () {},
          ),
          const SizedBox(), //中间位置空出
          IconButton(
            icon: const Icon(Icons.business),
            color: Colors.white,
            onPressed: () {},
          ),
        ], //均分底部导航栏横向空间
      ),
    );
  }
}
