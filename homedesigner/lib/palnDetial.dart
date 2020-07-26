import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/material.dart';
import 'imageViewPage.dart';
import 'myPlan.dart';

class planDetial extends StatelessWidget{
  String markdownSource;
  String title;
  String name;
  String userImg;
  String imgurl;
  int design_id;
  planDetial(this.title,this.name,this.userImg,this.markdownSource,this.design_id);
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
          title: Text(title,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20,color: Colors.black),),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          child: FutureBuilder(
            future: rootBundle.loadString(markdownSource),
            builder: (BuildContext context,AsyncSnapshot snapshot){
              if(snapshot.hasData){
                return Markdown(data: snapshot.data);
              }else{
                return Center(
                  child: Text("加载中..."),
                );
              }
            },
          ),
        ),
        bottomSheet: Container(
          margin: EdgeInsets.only(right: 15),
          color: Colors.white,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width: 10,),
                  imageViewPage(userImg,width: 25,height: 25,radius: 10,),
                  SizedBox(width: 10,),
                  Text(name,style: TextStyle(fontStyle: FontStyle.normal,),),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                      width: 80,
                      height: 60,
                      margin: EdgeInsets.only(left: 20),
                      padding: EdgeInsets.all(0),
                      color: Colors.white,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 18,left: 10),
                            child:Row(
                              children: <Widget>[
                                SizedBox(width: 8,),
                                Text("AR预览",style: TextStyle(fontSize: 15,color: Colors.black),),
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
                  ),
                  RaisedButton(
                      child: Text("添加到购物计划",style: TextStyle(color: Colors.white,fontSize: 18),),
                      color: Colors.black,
                      onPressed: (){
                        myPlan.list.add(myPlanEntity("https://pic3.zhimg.com/80/v2-2704ac39703d71bfa880a0588986b592_720w.jpg", title));
                        showCommonDialog(context);
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void callAr() async {
    Map partm = {'ar':1};
    String result = await methodChannel.invokeMethod("chair",partm);
    print("ar 成功");
    print(result);
  }

  showCommonDialog(BuildContext context){
    Future.delayed(Duration(milliseconds: 0)).then((e){
      showModalBottomSheet(
          context: context,
          builder: (context){
            return Container(
              padding: EdgeInsets.only(left: 165,top: 30),
              color: Colors.white,
              height: 80,
              child: Text("添加成功"),
            );
          }
      );
    });

  }

}