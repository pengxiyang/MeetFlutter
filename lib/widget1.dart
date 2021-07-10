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
                child: Text("显示SnackBar")),
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
      child: CupertinoButton(
        color: CupertinoColors.activeBlue,
        child: Text("Press"),
        onPressed: () {},
      ),
    );
    throw UnimplementedError();
  }
}
