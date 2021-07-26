import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/NewRoute.dart';
import 'package:flutter_app/status.dart';
import 'package:flutter_app/widget1.dart';
import 'package:flutter_app/widget_3_2.dart';
import 'package:flutter_app/widget_bt.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      routes: {
        "new_page": (context) => NewRoute(),
        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        "echo_page": (context) => EchoRoute(),
        "counter_page": (context) => CounterWidget(),
        "c_page":(context)=>CupertinoTestRoute(),
        "tips": (context) {
          return TipRoute(text: ModalRoute.of(context).settings.arguments);
        },
        "tapa":(context)=> TapboxAW(),
        "tapb":(context)=> ParentWidget(),
        "tapc" :(context) => ParentWidgetC(),
        "widget":(context) => TestWidget(),
        "widget1":(context) => TestWidget1(),
        "btwidget":(context)=> BtWidget(),
        "image": (context) => ImageWidget(),
      },
      /*  onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          String routeName = settings.name;
          //如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由
          //引导用户登录，其他情况则正常打开路由
        });
      },*/
      //  home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RandomWordsWidget(),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "new_page");
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context){
                //       return NewRoute();
                //     }));
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ContextRoute();
                }));
              },
              child: Text(
                "Context Route",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "counter_page");
                },
                child: Text("counter_page")),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "tapa");
                },
                child: Text("tapa")),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "tapb");
                },
                child: Text("tapb")),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "tapc");
                },
                child: Text("tapc")),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "widget");
                },
                child: Text("widget")),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "widget1");
                },
                child: Text("widget1")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class EchoRoute extends StatelessWidget {
  const EchoRoute({
    Key key,
    @required this.text,
    this.backgroundColor: Colors.green,
  }) : super(key: key);
  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    //打开路由时传递参数
    Navigator.of(context).pushNamed("echo_page", arguments: "hi");

    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
    throw UnimplementedError();
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(wordPair.toString()),
    );
    throw UnimplementedError();
  }
}

class ContextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Context 测试",
          style: TextStyle(color: Colors.deepOrange),
        ),
      ),
      body: Container(
        child: Builder(builder: (context) {
          Scaffold scaffold = context.findAncestorWidgetOfExactType<Scaffold>();
          return (scaffold.appBar as AppBar).title;
        }),
      ),
    );
    throw UnimplementedError();
  }
}
