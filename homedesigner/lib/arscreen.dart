import 'package:flutter/material.dart';

class arscreen extends StatefulWidget{
  final String modelname;
  arscreen(this.modelname);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PageState(modelname);
  }

}

class PageState extends State<arscreen>{
  final String modelname;
  PageState(this.modelname);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: AndroidView(viewType: 'plugins.nightfarmer.top/arview'),
    );
  }
}