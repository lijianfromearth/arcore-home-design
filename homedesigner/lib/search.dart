import 'package:flutter/material.dart';

import 'goodsListPage.dart';

class search extends StatelessWidget{
  search(this.padding);
  double padding;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(padding),
      color: Color.fromARGB(100, 245, 245, 247),
      height: 40.0,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Row(
                children: <Widget>[
                  Icon(Icons.search,),
                  SizedBox(width: 5,),
                  Text('请输入类别关键字搜索'),
                ]),
          ),
          Positioned.fill(child: Material(
              color: Colors.transparent,
              child: InkWell(
                  splashColor: Colors.amber.withOpacity(0.3),
                  highlightColor: Colors.amber.withOpacity(0.1),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>goodsListPage(0,0)));
                  }
              ))),
        ],
      )
    );
  }

}