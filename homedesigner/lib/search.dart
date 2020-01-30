import 'package:flutter/material.dart';

class search extends StatelessWidget{
  search(){}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color.fromARGB(100, 245, 245, 247),
      height: 40.0,
      child: Row(
        children: <Widget>[
          Icon(Icons.search),
          Text('请输入类别关键字搜索')
           ]),
    );
  }

}