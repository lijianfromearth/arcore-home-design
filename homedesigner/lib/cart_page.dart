import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import './provide/cart.dart';
import './cart_page/cart_bottom.dart';
import './model/cartInfo.dart';
import 'orderList.dart';
List cartList=[
  CartInfoMode(goodsId: "001",goodsName: "单人座椅",count:2,price:500.0,images:"asset/chair.PNG",isCheck: false),
  CartInfoMode(goodsId: "002",goodsName: "北欧高木床",count:1,price:3000.0,images:"asset/bed.PNG",isCheck: false) ,
];
class CartPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CartPageState();
  }
}

class CartPageState extends State<CartPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: FutureBuilder(
        future:_getCartInfo(context),
        builder: (context,snapshot){
          //List cartList=Provide.value<CartProvide>(context).cartList;
          //if(snapshot.hasData && cartList!=null){
          if( cartList!=null){
            return Stack(
              children: <Widget>[
                ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: (context,index){
                    return CartItem(cartList[index]);
                  },
                ),
//              Provide<CartProvide>(
//                  builder: (context,child,childCategory){
//                    //cartList= Provide.value<CartProvide>(context).cartList;
//                    print(cartList);
//                    return ListView.builder(
//                      itemCount: cartList.length,
//                      itemBuilder: (context,index){
//                        return CartItem(cartList[index]);
//                      },
//                    );
//                  }
//              )
              ],
            );
          }else{
            return Text('正在加载');
          }
        },
      ),
      bottomSheet:Container(
        color: Colors.white,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(width: 10,),
            RaisedButton(
              color: Colors.black,
              child: Text("购买", style: TextStyle(fontSize: 22,color: Colors.white),),
              onPressed: (){
                double finalPrice=0;
                List<orderGoods> myGoods=[];
                for(int i=0;i<cartList.length;i++){
                  if(cartList[i].isCheck){
                    finalPrice+=cartList[i].price;
                    myGoods.add(orderGoods(cartList[i].goodsName,cartList[i].price));
                    cartList.removeAt(i);
                    i--;
                  }
                }
                myorder.add(orderlist(DateTime.now().millisecondsSinceEpoch.toString(), finalPrice, myGoods));
                Future.delayed(Duration(milliseconds: 1500)).then((e){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder:(context)=> orderList()));
                });
              },
            )
          ],
        ),
      ),
    );
  }
  Widget CartItem(CartInfoMode item){
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

  Future<String> _getCartInfo(BuildContext context) async{
    // await Provide.value<CartProvide>(context).getCartInfo();
    return 'end';
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