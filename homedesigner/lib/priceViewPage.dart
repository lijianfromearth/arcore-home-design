import 'package:flutter/material.dart';

class priceViewPage extends StatelessWidget{
  final double price;
  final double fontsiz;
  final double size;
  final double margin_lift;
  final double margin_right;
  final double margin_top;
  final double margin_bottom;
  final Color color;
  priceViewPage(this.price,{this.size=20,this.fontsiz=20,this.margin_lift=0,this.margin_right=0,this.margin_bottom=0,this.margin_top=0,this.color=Colors.black});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
            margin: EdgeInsets.only(left: margin_lift,right: margin_right,top: margin_top,bottom: margin_bottom),
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.attach_money,size: size,color: color,),
                SizedBox(width: 3,),
                Text(price.toString(),style: TextStyle(fontSize: fontsiz,color: color),),
              ],
            ),
    );
  }
  
}