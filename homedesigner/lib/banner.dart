import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homedesigner/palnDetial.dart';
import 'data.dart';
import 'dart:math';

import 'goods_row.dart';
import 'goodsdetial.dart';
//这个文档实现了轮播图功能

var cardAspectRatio = 12.0/16.0;// 12:16  后面会用到的轮播图图片比例
var widgetAspectRatio = cardAspectRatio * 1.2;

class Mybanner extends StatefulWidget {

  @override
  _MyBannerState createState() => new _MyBannerState();

}

class _MyBannerState extends State<Mybanner> {

  var currentPage = data.length-1.0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    PageController controller = PageController(initialPage: data.length-1 );
    controller.addListener((){
      setState(() {
        currentPage = controller.page;
        //返回当前页面的位置信息，浮点数型
      });
    });
    return Stack(
      children: <Widget>[
        CardScrollwidget(currentPage),
        // 通过pageView 改变state 改变currentpage
        Positioned.fill(
          child: PageView.builder(
              itemCount: data.length,//页面个数
              controller: controller,
              reverse: true,//手势与滑动方向相同
              itemBuilder: (context,index){
                return Container();
              }),
        )
      ],
    );
  }
}
class CardScrollwidget extends StatelessWidget{
  static const MethodChannel methodChannel = MethodChannel('flutter.ar');
  //这个类负责绘制轮播图的内容
  var currentPage;
  var padding =20.0;
  var vericalInset = 20.0;
  CardScrollwidget( this.currentPage);//this.currentPage = currentPage
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return  Stack(
      children: <Widget>[
        AspectRatio(//将子部件调成特定宽高比
          aspectRatio: widgetAspectRatio,
          child: LayoutBuilder(
              builder: (context,contraints){
                var width = contraints.maxWidth;
                var height = contraints.maxHeight;

                var safeWidth = width - 2 * padding;
                var safeHeigh = height- 2 * padding;

                var heightOfPrimaryCard = safeHeigh;
                var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;// 高 * 宽/高 = 宽

                var primaryCardLeft = safeWidth - widthOfPrimaryCard;
                var horizontalInset = primaryCardLeft / 2;

                List<Widget> cardList = new List();
                for(var i = 0;i<data.length;i++){
                  var delta = i - currentPage;
                  bool isOnRight = delta>0;

                  var start = padding + max(primaryCardLeft-horizontalInset* -delta*(isOnRight ? 15 : 1), 0.0);

                  var cardItem = Positioned.directional(
                    //这是轮播图的主要内容
                      top: padding + vericalInset * max(-delta,0.0),
                      bottom: padding + vericalInset * max(-delta,0.0),
                      start: start,
                      textDirection: TextDirection.rtl,
                      child: ClipRRect(
                        borderRadius:  BorderRadius.circular(16.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white,boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(3.0, 6.0),
                                blurRadius: 10.0
                            )]),
                          child: AspectRatio(
                            aspectRatio: cardAspectRatio,
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
// 加载图片的位置在这里
//在这里可以做更改，改变轮播图的样式和内容，
                                Image.asset(data[i].images,fit: BoxFit.cover),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 10.0),
                                      child: Text(data[i].title,style: TextStyle(color: Colors.white,fontSize: 22.0,fontFamily: "SF-Pro-Text-Regular"),),
                                    ),

                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      )
                  );

                  cardList.add(cardItem);
                }
                return Stack(
                  children: cardList,
                );
              }
          ),
        ),
        Positioned.fill(child: Material(
            color: Colors.transparent,
            child: InkWell(
                splashColor: Colors.amber.withOpacity(0.3),
                highlightColor: Colors.amber.withOpacity(0.3),
                onTap: (){

                }
            ))),
      ],
    );
  }
  void callAr(int c,String model) async {
    Map partm = {'ar':c};
    String result = await methodChannel.invokeMethod(model,partm);
    print("ar 成功");
    print(result);
  }
}