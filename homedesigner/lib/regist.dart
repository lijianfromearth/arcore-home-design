import 'package:flutter/material.dart';

import 'main.dart';

class regist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("注册",style: TextStyle(color: Colors.black),),
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
                    hintText: '输入用户名',)
              ),
              SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    hintText: '输入手机号',
                  )
              ),
              SizedBox(height: 20,),
              TextField(
                  obscureText: true,
                  decoration: new InputDecoration(
                    hintText: '输入密码',
                  )
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: RaisedButton(
                  color: Colors.black,
                  child: Text("注册",style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    isEntry=true;
                    account_name="JIan";
                    Navigator.pop(context);
                  },
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

}