import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key key, this.initValue: 0});

  final int initValue;

  @override
  State<StatefulWidget> createState() => new _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;
  static GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text("Counter Widget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text('$_counter'),
              onPressed: () => setState(() => ++_counter),
            ),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessengerState messenger =
                      context.findAncestorStateOfType();
                  messenger.showSnackBar(
                    SnackBar(content: Text("我是SnackBar!")),
                  );
                },
                child: Text("显示SnackBar的第一种方式")),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessengerState _state = ScaffoldMessenger.of(context);
                  _state.showSnackBar(SnackBar(content: Text("我是SnackBar2")));
                },
                child: Text("显示SnackBar的第二种方式")),
            ElevatedButton(
                onPressed: () {
                  _globalKey.currentState
                      .showSnackBar(SnackBar(content: Text("我是SnackBar3")));
                },
                child: Text("显示SnackBar的第三种方式")),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "c_page");
                },
                child: Text("CupertinoTestRoute"))
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("dectivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDepencies");
  }
}

class CupertinoTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino Demo"),
      ),
      child: Center(
        child: CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: Text("Press"),
          onPressed: () {},
        ),
      ),
    );
    throw UnimplementedError();
  }
}

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  @override
  Widget build(BuildContext context) {}
}
