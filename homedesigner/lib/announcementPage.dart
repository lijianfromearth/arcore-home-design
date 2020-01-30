import 'package:flutter/material.dart';

class announcementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 30,bottom: 30),
      height: 200,
      child: Image(
        //image:  AssetImage('asset/ann.PNG'),
        image: NetworkImage('https://tjufemap.oss-cn-beijing.aliyuncs.com/ann.PNG'),
        fit: BoxFit.fill,
      ),
    );
  }

}