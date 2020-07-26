import 'package:flutter/material.dart';

class mySlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MySlider();
  }
  
}

class MySlider extends State<mySlider>{
  static int duelCommandment=1;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("购买数量：",style: TextStyle(fontWeight: FontWeight.bold),),
            Text(duelCommandment.toString())
          ],
        ),
        SizedBox(height: 10,),
        Slider(
          activeColor: Colors.black,
          value: duelCommandment.toDouble(),
          onChanged: (double newValue){
            setState((){
              duelCommandment = newValue.round();
            });
          },
          divisions: 10,min: 1,max: 10,)
      ],
    );
  }
}