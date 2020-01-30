import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'goods_row.dart';
import 'imageViewPage.dart';
import 'priceViewPage.dart';
import 'designTextPage.dart';
import 'arscreen.dart';
class goodsdetial  extends StatelessWidget {
  final post goods;
  final String destial = "17世纪为欧洲的巴洛克样式盛行的时代，是对文艺复兴样式的变型时期。其艺术特征为打破文艺复兴时代整体的造型形式而进行变态，在运用直线的同时也强调线型流动变化的造型特点，具有过多的装饰和华美厚重的效果。在室内，将绘画、雕塑、工艺集中于装饰和陈设艺术上。";
  goodsdetial(this.goods){
    //callAr();
  }
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
              Container(
                color: Colors.black,
                width: 150,
                height: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("购买",style: TextStyle(color: Colors.white,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("合计",style: TextStyle(color: Colors.white,fontSize: 15),),
                        SizedBox(width: 5,),
                        priceViewPage(goods.price,fontsiz: 15,color: Colors.white,size: 15,)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  void callAr() async {
    String result = await methodChannel.invokeMethod(goods.model);
    print(result);
  }
}