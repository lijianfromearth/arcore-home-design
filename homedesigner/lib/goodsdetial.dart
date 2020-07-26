import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'goods_row.dart';
import 'imageViewPage.dart';
import 'model/cartInfo.dart';
import 'mySlider.dart';
import 'priceViewPage.dart';
import 'designTextPage.dart';
import 'cart_page.dart';
import 'mySlider.dart';
 post goods;
 String destial = "17世纪为欧洲的巴洛克样式盛行的时代，是对文艺复兴样式的变型时期。其艺术特征为打破文艺复兴时代整体的造型形式而进行变态，在运用直线的同时也强调线型流动变化的造型特点，具有过多的装饰和华美厚重的效果。在室内，将绘画、雕塑、工艺集中于装饰和陈设艺术上。";
class goodsdetial  extends StatefulWidget {
  goodsdetial(post good){
    goods=good;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _goodsdetial();
  }
}

class _goodsdetial extends State<goodsdetial>{
  static const MethodChannel methodChannel = MethodChannel('flutter.ar');
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,size: 32,), onPressed: (){Navigator.pop(context);}),
          backgroundColor: Color.fromARGB(210, 242, 242, 242) ,
          elevation: 0,
        ),
        body: ListView(
          children: <Widget>[
            imageViewPage(goods.imgurl,height: 200,),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Row(
                children: <Widget>[
                  Text(goods.brand,style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.w300)),
                  SizedBox(width: 10,),
                  Text(goods.name,style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.w300)),
                ],
              ),
            ),
            priceViewPage(goods.price,size: 30,fontsiz: 30,margin_lift: 25,margin_right: 25,margin_top: 10,margin_bottom: 5,),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: 120,
                    height: 35,
                    margin: EdgeInsets.only(left: 20),
                    padding: EdgeInsets.all(0),
                    color: Colors.black,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child:Row(
                            children: <Widget>[
                              SizedBox(width: 13,),
                              Icon(Icons.threed_rotation,color: Colors.white,size: 20,),
                              SizedBox(width: 8,),
                              Text("AR预览",style: TextStyle(fontSize: 20,color: Colors.white),),
                            ],
                          ) ,
                        ),

                        Positioned.fill(child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.amber.withOpacity(0.3),
                              highlightColor: Colors.amber.withOpacity(0.1),
                              onTap: callAr,
                            ))
                        )
                      ],
                    )
                )
              ],
            ),
            designTextPage(destial,margin_bottom: 30,),
            Container(
              margin: EdgeInsets.only(left: 30,right: 30),
              child: Image(
                image: AssetImage('asset/brand_loag.JPG'),
                //image: NetworkImage('https://wx1.sinaimg.cn/mw690/005FCw6zly1g45ctw7rocj309e02uaa1.jpg'),
              ),
            ),
            SizedBox(height: 80,)

          ],
        ),
        bottomSheet: Container(
          margin: EdgeInsets.only(right: 15),
          color: Colors.white,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              MaterialButton(
                height: 50,
                color: Colors.black,
                child: Text("加入购物车",style: TextStyle(color: Colors.white,fontSize: 18),),
                onPressed: (){showCommonDialog(context);}
              )
            ],
          ),
        ),
      ),
    );;
  }
  void callAr() async {
    Map partm = {'ar':0};
    String result = await methodChannel.invokeMethod(goods.model,partm);
    print("ar 成功");
    print(result);
  }
  showCommonDialog(BuildContext context){
    Future.delayed(Duration(milliseconds: 0)).then((e){
      showModalBottomSheet(
          context: context,
          builder: (context){
            return Container(
              color: Colors.white,
              height: 145,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10,),
                  mySlider(),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.white,
                        elevation: 0,
                        child: Text("取消",style: TextStyle(color: Colors.black),),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      ),
                      RaisedButton(
                        color: Colors.black,
                        child: Text("确认",style: TextStyle(color: Colors.white),),
                        onPressed: (){
                          cartList.add(CartInfoMode(goodsId:goods.goodid,goodsName: goods.name,count:MySlider.duelCommandment,price:500.0,images:"asset/chair.PNG",isCheck: false));
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(width: 10,),
                    ],
                  ),
                ],
              ),
            );
          }
      );
    });

  }
}


