import 'package:flutter/material.dart';

class imageViewPage extends StatelessWidget{
  final String imgurl;
  final double width;
  final double height;
  imageViewPage(this.imgurl,{this.width=180,this.height=120});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color.fromARGB(210, 242, 242, 242),
      width: width,
      height: height,
      child: Image(
        image: AssetImage(imgurl),
        width: height,
        height: height,
      ),
    );
  }

}