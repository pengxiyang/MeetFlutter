import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("组件"),
      ),
      body: Center(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Young",
              maxLines: 1,
              textScaleFactor: 1.5,
              //字体大小的缩放
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "Hello Test",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  height: 1.2,
                  fontFamily: "Courier",
                  background: new Paint()..color = Colors.yellow,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            Text.rich(TextSpan(
              children: [
                TextSpan(text: "Home:"),
                TextSpan(
                  text: "https://www.zhihu.com",
                  style: TextStyle(color: Colors.blue),
                  //  recognizer: 点击链接后的处理器
                ),
              ],
            )),
            RaisedButton(
              child: Text("RaiseButton"),
              onPressed: () {
                ScaffoldMessengerState _state = ScaffoldMessenger.of(context);
                _state.showSnackBar(SnackBar(content: Text("RaiseButton"),duration: Duration(seconds: 2),));
              },
            ),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessengerState messenger =
                      context.findAncestorStateOfType();
                  messenger
                      .showSnackBar(SnackBar(content: Text("ElevatedButton"),duration: Duration(seconds: 2),));
                },
                child: Text("ElevatedButton")),
            FlatButton(
                onPressed: () {
                 ScaffoldMessengerState s=context.findAncestorStateOfType();
                 s.showSnackBar(SnackBar(content: Text("FlatButton"),duration: Duration(seconds: 1),));
                },
                child: Text("FlatButton")
            ),
            FlatButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text("Test Icon")
            ),
            TextButton(
                onPressed: () {
                  ScaffoldMessengerState state = ScaffoldMessenger.of(context);
                  state.showSnackBar(SnackBar(content: Text("TextButton"),duration: Duration(seconds: 2),));
                },
                child: Text("TextButton")
            ),
            TextButton.icon(onPressed: (){
              Navigator.pushNamed(context, "btwidget");
            }, icon: Icon(Icons.arrow_right), label: Text("To BtWidget")),
            OutlineButton(onPressed: (){},child: Text("OutlineButton"),
            ),
            OutlinedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("OutlinedButton")));
            }, child: Text("OutlinedButton")
            ),
            OutlinedButton.icon(onPressed: (){}, icon: Icon(Icons.save), label: Text("Save")),
            IconButton(icon: Icon(Icons.open_in_new), onPressed: (){

            })
          ],
        ),
      ),
    );
  }
}

class TestWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      //1.设置文本默认样式
      style: TextStyle(
        color: Colors.red,
        fontSize: 20.0,
      ),
      textAlign: TextAlign.start,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("hello world"),
          Text("I am Jack"),
          Text(
            "I am Jack",
            style: TextStyle(
                inherit: false, //2.不继承默认样式
                color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
