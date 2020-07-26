import 'package:flutter/material.dart';


List<orderlist> myorder=[];
class orderList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("我的订单",style: TextStyle(color: Colors.black),),
        ),
        body: ListView.builder(
          itemCount: myorder.length,
          itemBuilder: (context,index){
            return orderItem(context,myorder[index]);
          }
        ),
      ),
    );
  }

  Widget orderItem(BuildContext context,orderlist myorder) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(left: 20,top: 15,right: 90),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.list),
              SizedBox(width: 5,),
              Text(myorder.id,style: TextStyle(fontSize: 18),),
            ],
          ),
          SizedBox(height: 10,),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 60),
            child: ListView.builder(
                itemCount: myorder.goodslist.length,
                itemBuilder: (context,index){
                  return Gooodslist(myorder.goodslist[index]);
                }
            ),
          ),
          SizedBox(width: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("总计：",style: TextStyle(fontSize: 16)),
              Text('￥${myorder.price}',style: TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }

  Widget Gooodslist(orderGoods goodslist) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 5,),
        Text(goodslist.goodsname),
        SizedBox(width: 50,),
        Text('￥${goodslist.price}'),
      ],
    );
  }


}

class orderGoods {
  String goodsname;
  double price;
  orderGoods(this.goodsname,this.price);
}

class orderlist {
  String id;
  double price;
  List<orderGoods> goodslist;
  orderlist(this.id,this.price,this.goodslist);
}