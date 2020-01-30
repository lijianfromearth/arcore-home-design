import 'package:flutter/material.dart';

class cataloguePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        catalogue_item('今日特卖',Icons.crop_free),
        catalogue_item('家具养护',Icons.crop_free),
        catalogue_item('生活馆',Icons.crop_free),
      ],
    );
  }
}
class catalogue_item extends StatelessWidget{
  final IconData icon;
  final String title;
  final double margin;
  catalogue_item(this.title,this.icon,{this.margin=20.0});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color.fromARGB(100, 245, 245, 247),
      width: 100,
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon,size: 30,),
          Text(title,style: new TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600,)),
        ],
      ),
    );
  }

}