import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../model/cartInfo.dart';
import './cart_count.dart';
import 'package:provide/provide.dart';
import '../provide/cart.dart';

 CartInfoMode item;
class CartItem extends StatefulWidget {

  CartItem(CartInfoMode items){
    item=items;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CartItemState();
  }
  @override
  Widget build(BuildContext context) {
    print(item);
    return Container(
        margin: EdgeInsets.fromLTRB(5.0,2.0,5.0,2.0),
        padding: EdgeInsets.fromLTRB(5.0,10.0,5.0,10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width:1,color:Colors.black12)
          )
        ),
        child: Row(
          children: <Widget>[
            _cartCheckBt(context,item),
            _cartImage(item),
            _cartGoodsName(item),
          _cartPrice(context,item)
          ],
        ),
      );
  }
  //多选按钮
  Widget _cartCheckBt(context,item){
    return Container(
      child: Checkbox(
        value: item.isCheck,
        activeColor:Colors.black,
        onChanged: (bool val){
          item.isCheck=val;
          Provide.value<CartProvide>(context).changeCheckState(item);
        },
      ),
    );
  }
  //商品图片
  Widget _cartImage(item){

    return Container(
      width: 90,
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1,color:Colors.black12)
      ),
      //child: Image.network(item.images),
      child: Image.asset(item.images),
    );
  }
  //商品名称
  Widget _cartGoodsName(item){
    return Container(
      width: 150,
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Text(item.goodsName),
//          CartCount(item)
        ],
      ),
    );
  }

  //商品价格
  Widget _cartPrice(context,item){

    return Container(
        width:60,
        alignment: Alignment.centerRight,

        child: Column(
          children: <Widget>[
            Text('￥${item.price}'),
            Container(
              child: InkWell(
                onTap: (){
                 Provide.value<CartProvide>(context).deleteOneGoods(item.goodsId);
                },
                child: Icon(
                  Icons.delete_forever,
                  color: Colors.black26,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      );
  }



}

class CartItemState extends State<CartItem>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  //多选按钮
  Widget _cartCheckBt(context,item){
    return Container(
      child: Checkbox(
        value: item.isCheck,
        activeColor:Colors.black,
        onChanged: (bool val){
          setState(() {
            item.isCheck=!item.isCheck;
          });
        },
      ),
    );
  }
  //商品图片
  Widget _cartImage(item){

    return Container(
      width: 90,
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(width: 1,color:Colors.black12)
      ),
      //child: Image.network(item.images),
      child: Image.asset(item.images),
    );
  }
  //商品名称
  Widget _cartGoodsName(item){
    return Container(
      width: 150,
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Text(item.goodsName),
//          CartCount(item)
        ],
      ),
    );
  }

  //商品价格
  Widget _cartPrice(context,item){

    return Container(
      width:60,
      alignment: Alignment.centerRight,

      child: Column(
        children: <Widget>[
          Text('￥${item.price}'),
          Container(
            child: InkWell(
              onTap: (){
                Provide.value<CartProvide>(context).deleteOneGoods(item.goodsId);
              },
              child: Icon(
                Icons.delete_forever,
                color: Colors.black26,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}