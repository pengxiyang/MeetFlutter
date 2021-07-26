import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BtWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("BtWidget"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("To ImageWidget"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {
                Navigator.pushNamed(context, "image");
              },
            ),
            TextButton(
              child: Text(
                "Submit1",
                style: TextStyle(color: Colors.white),
              ),
              //设置按钮是否自动获取焦点
              autofocus: true,
              //定义一下文本样式
              style: ButtonStyle(
                //定义文本样式，这里设置的颜色不起作用
                textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 18, color: Colors.white)),
                //按钮上字体与图标颜色？
                foregroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.focused) &&
                      !states.contains(MaterialState.pressed)) {
                    //获取焦点时的颜色
                    return Colors.blue;
                  } else if (states.contains(MaterialState.pressed)) {
                    return Colors.deepPurple;
                  }
                  //默认使用灰色
                  return Colors.grey;
                }),
                //背景颜色
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    //按下时的颜色
                    return Colors.blue[200];
                  }
                  return Colors.grey;
                }),
                //设置水波纹颜色
                overlayColor: MaterialStateProperty.all(Colors.yellow),
                //设置阴影
                elevation: MaterialStateProperty.all(0),
                //设置按钮内边距
                padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                //设置按钮大小
                //  minimumSize: MaterialStateProperty.all(Size(100,50)),
                //设置边框
                side: MaterialStateProperty.all(
                    BorderSide(color: Colors.grey, width: 1)),
                //外边框装饰，会覆盖side配置的样式
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
              onPressed: () {},
            ),
            Image(
              image: AssetImage("images/avatar.png"),
              width: 100.0,
              //该属性用于在图片的显示空间和图片本身大小不同时指定图片的适应模式
              fit: BoxFit.fitHeight,
            ),
            Image.asset(
              "images/avar.jpg",
              width: 100.0,
              fit: BoxFit.contain,
            ),
            Image(
              image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 100.0,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
              fit: BoxFit.fill,
            ),
            Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: 100.0,
              height: 50,
              repeat: ImageRepeat.repeatY,
            )
          ],
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var img = AssetImage("images/avatar.png");
    return SingleChildScrollView(
      child: Column(
          children: <Image>[
            Image(
              image: img,
              height: 50.0,
              width: 100.0,
              fit: BoxFit.fill,
            ),
            Image(
              image: img,
              height: 50,
              width: 50.0,
              fit: BoxFit.contain,
            ),
            Image(
              image: img,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.cover,
            ),
            Image(
              image: img,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.fitWidth,
            ),
            Image(
              image: img,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.fitHeight,
            ),
            Image(
              image: img,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.scaleDown,
            ),
            Image(
              image: img,
              height: 50.0,
              width: 100.0,
              fit: BoxFit.none,
            ),
            Image(
              image: img,
              width: 100.0,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
              fit: BoxFit.fill,
            ),
            Image(
              image: img,
              width: 100.0,
              height: 200.0,
              repeat: ImageRepeat.repeatY ,
            )
          ].map((e){
            return Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 100,
                    child: e,
                  ),
                ),
                Text(e.fit.toString(),style: TextStyle(fontSize: 12.0,color: Colors.white),)
              ],
            );
          }).toList()
      ),
    );
  }
}
