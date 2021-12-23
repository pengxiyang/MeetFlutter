import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() =>
      _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态
  //定义一个controller
  TextEditingController _controller = TextEditingController();
  TextEditingController _testController = TextEditingController();


  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();

  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    super.initState();
    //获取输入内容
    print(_controller.text);
    _controller.addListener(() {
      //监听输入的改变
      print(_controller.text);
    });
    _testController.text = "Hello World";
    _testController.selection =
        TextSelection(baseOffset: 2, extentOffset: _testController.text.length);

    focusNode1.addListener(() {
      print(focusNode1.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("开关和单选"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child:SingleChildScrollView(
          child: Column(

            children: <Widget>[
              Switch(
                value: _switchSelected, //当前状态
                activeColor: Colors.green,
                onChanged: (value) {
                  //重新构建页面
                  setState(() {
                    _switchSelected = value;
                  });
                },
              ),
              Checkbox(
                value: _checkboxSelected,

                activeColor: Colors.red, //选中时的颜色
                onChanged: (value) {
                  setState(() {
                    _checkboxSelected = value;
                  });
                },
              ),
              TextField(
                //       autofocus: true,
                onChanged: (v) {
                  //监听文本变化
                  print("onChange:$v");
                },
                decoration: InputDecoration(
                    labelText: '用户名',
                    hintText: '用户名或邮箱',
                    prefixIcon: Icon(Icons.person),
                  hintStyle: TextStyle(color: Colors.green,fontSize: 13.0)
                ),
              ),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '请您输入密码',
                    prefixIcon: Icon(Icons.lock)
                ),
                //是否隐藏正在编辑的文本，如用于输入密码的场景等，文本内容会用“•”替换。
                obscureText: true,
              ),
              TextField(
                controller: _testController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.save),
                  hintText: '请输入测试内容',
                ),
              ),

              TextField(
                autofocus: true,
                //focusNode绑定输入框
                focusNode: focusNode1,
                decoration: InputDecoration(
                  labelText: "input1",
                ),
              ),
              TextField(
                focusNode: focusNode2,
                decoration: InputDecoration(
                  labelText: "input2",
                ),),
              Builder(builder: (ctx) {
                return Column(
                  children: [
                    ElevatedButton(onPressed: () {
                      if (null == focusScopeNode) {
                        focusScopeNode = FocusScope.of(context);
                      }
                      focusScopeNode.requestFocus(focusNode2);
                    }, child: Text("移动焦点"),),
                    ElevatedButton(onPressed: () {
                      focusNode1.unfocus();
                      focusNode2.unfocus();
                    }, child: Text("隐藏键盘"))
                  ],
                );
              }),
//自定义样式
              TextField(decoration: InputDecoration(
                labelText: "请输入用户名",
                prefixIcon: Icon(Icons.person),
                //未获得焦点下划线设为灰色
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.5)
                ),
                //获取焦点下划线设置为蓝色
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)
                ),
              ),),
              Container(
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "电子邮箱地址",
                    prefixIcon: Icon(Icons.email),
                    border: InputBorder.none//隐藏下划线
                  ),
                ),
                decoration: BoxDecoration(
                  //下划线浅灰色，宽度1像素
                  border: Border(bottom: BorderSide(color: Colors.grey[200],width: 1.0))
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}

