import 'package:flutter/material.dart';

import 'goodsListPage.dart';

List<catalogue> list;

class cataloguePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
//数据
    list = [
      catalogue('客厅设施',Icons.crop_free,1),
      catalogue('厨房用品',Icons.crop_free,1),
      catalogue('卧室家具',Icons.crop_free,1),
      catalogue('浴室用品',Icons.crop_free,1),
      catalogue('学习办公',Icons.crop_free,1),
      catalogue('其他',Icons.crop_free,1),
    ];
    // TODO: implement build

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20,),
        Container(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length*2,
            itemBuilder: catalogue_item,
          ),
        ),
      ],
    );
  }
  Widget catalogue_item (BuildContext context, int index){
    int i=index ~/2;
    if(index.isEven){
      return Container(
        color: Color.fromARGB(100, 245, 245, 247),
        width: 90,
        height: 70,
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(list[i].icon,size: 35,),
                Text(list[i].title,style: new TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600,)),
              ],
            ),
            Positioned.fill(child: Material(
                color: Colors.transparent,
                child: InkWell(
                    splashColor: Colors.amber.withOpacity(0.3),
                    highlightColor: Colors.amber.withOpacity(0.1),
                    onTap: () {Navigator.of(context).push(MaterialPageRoute(builder:(context)=>goodsListPage(0,i)));}
                ))),
          ],
        )
      );
    }else {
      return SizedBox(width: 20.0,);}


  }
}


  class catalogue {
     IconData icon;
     String title;
     int catalogue_id;
     catalogue(this.title,this.icon,this.catalogue_id,);
  }