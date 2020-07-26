import 'package:flutter/material.dart';

class imageViewPage extends StatelessWidget{
  String imgurl;
  double width;
  double height;
  double radius;
  imageViewPage(this.imgurl,{this.width=180,this.height=120,this.radius=0});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        color: Color.fromARGB(210, 242, 242, 242),
        width: width,
        height: height,
        child: Image(
          image: AssetImage(imgurl),
          width: height,
          height: height,
        ),
      ),
    );
  }

}