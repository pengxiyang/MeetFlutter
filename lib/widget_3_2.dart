import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "组件",
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Center(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Young",
              maxLines: 1,
              textScaleFactor: 1.5,//字体大小的缩放
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16.0),
            ),
            Text("Hello Test",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              height: 1.2,
              fontFamily: "Courier",
              background: new Paint()..color =Colors.yellow,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed
            ),
            ),
            Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: "Home:"
                ),
                TextSpan(
                  text: "https://www.zhihu.com",
                  style: TextStyle(
                    color: Colors.blue
                  ),
                //  recognizer: 点击链接后的处理器
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

class TestWidget1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return  DefaultTextStyle(
      //1.设置文本默认样式
      style: TextStyle(
        color:Colors.red,
        fontSize: 20.0,
      ),
      textAlign: TextAlign.start,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("hello world"),
          Text("I am Jack"),
          Text("I am Jack",
            style: TextStyle(
                inherit: false, //2.不继承默认样式
                color: Colors.grey
            ),
          ),
        ],
      ),
    );
  }
}
