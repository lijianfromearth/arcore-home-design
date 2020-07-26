import 'package:flutter/material.dart';
import 'package:homedesigner/regist.dart';

import 'data.dart';
import 'main.dart';

class login extends StatelessWidget {
  final TextEditingController username = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  String username_t;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("登录",style: TextStyle(color: Colors.black),),
        ),
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.only(left: 100,top: 100),
          width: 200,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              TextField(
                  decoration: new InputDecoration(
                    hintText: '输入用户名登录',)
              ),
              SizedBox(height: 20,),
              TextField(
                  decoration: new InputDecoration(
                    hintText: '输入密码登录',
                  )
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.white,
                      child: Text("注册"),
                      onPressed: (){
                        Navigator.pop(context);
                        Navigator.of(context).push(
                            MaterialPageRoute(builder:(context)=> regist()));
                      },
                    ),
                    RaisedButton(
                      color: Colors.black,
                      child: Text("登录",style: TextStyle(color: Colors.white),),
                      onPressed: (){
                          isEntry=true;
                          Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}