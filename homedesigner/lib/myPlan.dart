import 'package:flutter/material.dart';
import 'package:homedesigner/palnDetial.dart';
import 'cart_page.dart';
import 'drawerPage.dart';
import 'goods_row.dart';
import 'goodsdetial.dart';
import 'imageViewPage.dart';
import 'model/cartInfo.dart';
class myPlan extends StatelessWidget{
  static List<myPlanEntity> list = [];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("购物计划",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18),),
          centerTitle: false,
          elevation: 0,
        ),
        drawer: drawerPage(),
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            SizedBox(height: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20,),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: list.length*2,
                    itemBuilder: _listitemBuilder,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _listitemBuilder(BuildContext context, int index) {
    int i=index ~/2;
    if(index.isEven){
      return Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.network(list[i].imgurl,width: 200,height: 120,),
                Column(
                  children: <Widget>[
                    Text(list[i].title,style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text(list[i].goodsNumber.toString()+"个商品"),
                  ],
                ),
              ],
            ),
            Positioned.fill(child: Material(
                color: Colors.transparent,
                child: InkWell(
                    splashColor: Colors.amber.withOpacity(0.3),
                    highlightColor: Colors.amber.withOpacity(0.1),
                    onTap: () {showCommonDialog(context);}
                ))),
          ]
      );
    }else {
      return SizedBox(width: 20,);}


  }
  showCommonDialog(BuildContext context){
    Future.delayed(Duration(milliseconds: 0)).then((e){
      showModalBottomSheet(
          context: context,
          builder: (context){
            return Container(
              color: Colors.white,
              height: 400,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 90,
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1,color:Colors.black12)
                            ),
                            //child: Image.network(item.images),
                            child: Image.asset("asset/chair.PNG"),
                          ),
                          Container(
                            width: 150,
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: <Widget>[
                                Text("单人座椅"),
                              ],
                            ),
                          ),
                          Container(
                            width:60,
                            alignment: Alignment.centerRight,
                            child: Text('￥${500}'),
                          )
                        ],
                      ),
                      Positioned.fill(child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                              splashColor: Colors.amber.withOpacity(0.0),
                              highlightColor: Colors.amber.withOpacity(0.0),
                              onTap: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder:(context)=> goodsdetial(post("55","Sophie","单人座椅",500.0,"asset/chair.PNG","chair"))));
                              }
                          ))),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 90,
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1,color:Colors.black12)
                            ),
                            //child: Image.network(item.images),
                            child: Image.asset("asset/table.PNG"),
                          ),
                          Container(
                            width: 150,
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: <Widget>[
                                Text("黑色茶几"),
                              ],
                            ),
                          ),
                          Container(
                            width:60,
                            alignment: Alignment.centerRight,
                            child: Text('￥${1000}'),
                          )
                        ],
                      ),
                      Positioned.fill(child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                              splashColor: Colors.amber.withOpacity(0.0),
                              highlightColor: Colors.amber.withOpacity(0.0),
                              onTap: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder:(context)=> goodsdetial(post("56","Sophie","黑色茶几",3000.0,"asset/table.PNG","table"))));
                              }
                          ))),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 90,
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1,color:Colors.black12)
                            ),
                            //child: Image.network(item.images),
                            child: Image.asset("asset/tv.png"),
                          ),
                          Container(
                            width: 150,
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: <Widget>[
                                Text("4K电视"),
                              ],
                            ),
                          ),
                          Container(
                            width:60,
                            alignment: Alignment.centerRight,
                            child: Text('￥${4000}'),
                          )
                        ],
                      ),
                      Positioned.fill(child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                              splashColor: Colors.amber.withOpacity(0.0),
                              highlightColor: Colors.amber.withOpacity(0.0),
                              onTap: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder:(context)=> goodsdetial(post("57","小米","4K电视",4000.0,"asset/tv.png","tv"))));
                              }
                          ))),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 90,
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1,color:Colors.black12)
                            ),
                            //child: Image.network(item.images),
                            child: Image.asset("asset/sofa.PNG"),
                          ),
                          Container(
                            width: 150,
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: <Widget>[
                                Text("黑色沙发"),
                              ],
                            ),
                          ),
                          Container(
                            width:60,
                            alignment: Alignment.centerRight,
                            child: Text('￥${2000}'),
                          )
                        ],
                      ),
                      Positioned.fill(child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                              splashColor: Colors.amber.withOpacity(0.0),
                              highlightColor: Colors.amber.withOpacity(0.0),
                              onTap: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder:(context)=> goodsdetial(post("58","Sophie","黑色沙发",2000.0,"asset/sofa.PNG","sofa"))));
                              }
                          ))),
                    ],
                  ),
                  SizedBox(height: 10,),
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
                        color: Colors.white,
                        elevation: 0,
                        child: Text("预览",style: TextStyle(color: Colors.black),),
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder:(context)=> planDetial("来点异域风情","小剑","asset/creater.jpg","asset/demo.md",5)));
                        },
                      ),
                      RaisedButton(
                        color: Colors.black,
                        child: Text("加入购物车",style: TextStyle(color: Colors.white),),
                        onPressed: (){
                          cartList.add(CartInfoMode(goodsId:"20315",goodsName: "单人座椅",count:1,price:500.0,images:"asset/chair.PNG",isCheck: false));
                          cartList.add(CartInfoMode(goodsId:"20315",goodsName: "黑色茶几",count:1,price:1000.0,images:"asset/table.PNG",isCheck: false));
                          cartList.add(CartInfoMode(goodsId:"20315",goodsName: "4K电视",count:1,price:4000.0,images:"asset/tv.png",isCheck: false));
                          cartList.add(CartInfoMode(goodsId:"20315",goodsName: "黑色沙发",count:1,price:2000.0,images:"asset/sofa.PNG",isCheck: false));
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
class myPlanEntity {
  String imgurl;
  String title;
  int goodsNumber;
  String contentUrl;
  myPlanEntity(
      this.imgurl,
      this.title,
      {this.goodsNumber=4,this.contentUrl="asset/demo.md"}
      );
}