import 'package:flutter/material.dart';

class designTextPage extends StatelessWidget{
  final double fontsiz;
  final String destial;
  final double margin_lift;
  final double margin_right;
  final double margin_top;
  final double margin_bottom;
  designTextPage(this.destial,{
    this.fontsiz = 15,
    this.margin_lift=30,this.margin_right=30,this.margin_bottom=0,this.margin_top=30,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(left: margin_lift,right: margin_right,top: margin_top,bottom: margin_bottom),
      child: Text(destial,style: TextStyle(fontSize: fontsiz,color: Colors.black),),
    );
  }
  
}