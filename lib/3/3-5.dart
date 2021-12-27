import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormRouteState();
}

class _FormRouteState extends State<FormRoute> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body:   Form(
        key: _formKey, //设置globalKey ,用于后面获取FormState
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "手机号码",
                icon: Icon(Icons.person),
              ),
              //校验用户名
              validator: (v) {
                RegExp reg = new RegExp(r'^\d{11}$');
                if(!reg.hasMatch(v)){
                  return "请输入11位手机号";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _pwdController,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "你的登录密码",
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
              //校验密码
              validator: (v) {
              if(v.isEmpty){
                return "请输入6位密码";
              }
              return null;
              },
            ),
            //登录按钮
            Padding(padding: const EdgeInsets.only(top: 28.0,left: 10.0,right: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(child: ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("登录"),
                  ),
                  onPressed: (){
                    //通过_formKey.currentState获取FormState后，
                    //通过validate()方法校验用户名密码是否合法，校验
                    //通过后再提交数据
                    if((_formKey.currentState as FormState).validate()){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("校验成功...")));

                    }
                  },
                ),)
              ],
            ),
            )
          ],
        ),
      ),
    );


  }
}
