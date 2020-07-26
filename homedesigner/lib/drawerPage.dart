import 'imageViewPage.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'main.dart';
import 'cart_page.dart';
import 'myPlan.dart';
import 'orderList.dart';
class drawerPage extends StatelessWidget{
  String name;
  @override
  Widget build(BuildContext context) {
    if(isEntry){
      name=account_name;
    }else name="未登录";
    // TODO: implement build
    return ListView(
      children: <Widget>[
        SizedBox(height: 20,),
        Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(width: 10,),
                imageViewPage(account_img,width: 60,height: 60,radius: 30,),
                SizedBox(width: 10,),
                Text(name,style: TextStyle(fontStyle: FontStyle.normal,fontSize: 25,color: Colors.white),),
              ],
            ),
            Positioned.fill(child: Material(
                color: Colors.transparent,
                child: InkWell(
                    splashColor: Colors.amber.withOpacity(0.0),
                    highlightColor: Colors.amber.withOpacity(0.0),
                    onTap: (){
                      if(!isEntry){
                        Navigator.pop(context);
                        Navigator.of(context).push(
                            MaterialPageRoute(builder:(context)=> login()));
                      }
                    }
                ))),
          ],
        ),
        SizedBox(height: 100,),
        Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(width: 10,),
                Text("个人信息",style: TextStyle(fontStyle: FontStyle.normal,fontSize: 18,color: Colors.white),),
                SizedBox(width: 120,),
                Stack(
                  children: <Widget>[
                    Icon(Icons.arrow_forward_ios,size: 15,color: Colors.white,),
                    Positioned.fill(child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                            splashColor: Colors.amber.withOpacity(0.0),
                            highlightColor: Colors.amber.withOpacity(0.0),
                            onTap: null
                        ))),
                  ],
                ),
              ],
            ),
            Positioned.fill(child: Material(
                color: Colors.transparent,
                child: InkWell(
                    splashColor: Colors.amber.withOpacity(0.0),
                    highlightColor: Colors.amber.withOpacity(0.0),
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder:(context)=> CartPage()));
                    }
                ))),
          ],
        ),
        SizedBox(height: 20,),
        Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(width: 10,),
                Text("我的订单",style: TextStyle(fontStyle: FontStyle.normal,fontSize: 18,color: Colors.white),),
                SizedBox(width: 120,),
                Icon(Icons.arrow_forward_ios,size: 15,color: Colors.white,)
              ],
            ),
            Positioned.fill(child: Material(
                color: Colors.transparent,
                child: InkWell(
                    splashColor: Colors.amber.withOpacity(0.0),
                    highlightColor: Colors.amber.withOpacity(0.0),
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder:(context)=> orderList()));
                    }
                ))),
          ],
        ),
        SizedBox(height: 20,),
        Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(width: 10,),
                Text("购物计划",style: TextStyle(fontStyle: FontStyle.normal,fontSize: 18,color: Colors.white),),
                SizedBox(width: 120,),
                Icon(Icons.arrow_forward_ios,size: 15,color: Colors.white,)
              ],
            ),
            Positioned.fill(child: Material(
                color: Colors.transparent,
                child: InkWell(
                    splashColor: Colors.amber.withOpacity(0.0),
                    highlightColor: Colors.amber.withOpacity(0.0),
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder:(context)=> myPlan()));
                    }
                ))),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: <Widget>[
            SizedBox(width: 10,),
            Text("重置密码",style: TextStyle(fontStyle: FontStyle.normal,fontSize: 18,color: Colors.white),),
            SizedBox(width: 120,),
            Icon(Icons.arrow_forward_ios,size: 15,color: Colors.white,)
          ],
        ),
      ],
    );
  }

}