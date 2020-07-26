import 'package:flutter/material.dart';
import 'imageViewPage.dart';
import 'palnDetial.dart';

class design_row extends StatelessWidget {
  final String title;
  final List<design_map> list;
  design_row(this.title,this.list);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return Text("1");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        SizedBox(height: 20,),
        Container(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length*2,
            itemBuilder: _listitemBuilder,
          ),
        ),
      ],
    );

  }

  Widget _listitemBuilder(BuildContext context, int index) {
    int i=index ~/2;
    if(index.isEven){
      return Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                imageViewPage(list[i].imgurl,width: 230,height: 160,),
                SizedBox(height: 10,),
                Text(list[i].title,style: TextStyle(fontSize: 18,),),
                SizedBox(height: 5,),
                Row(
                  children: <Widget>[
                    imageViewPage(list[i].userImg,width: 25,height: 25,radius: 10,),
                    SizedBox(width: 10,),
                    Text(list[i].name,style: TextStyle(fontStyle: FontStyle.normal,),),
                  ],
                ),
              ],
            ),
            Positioned.fill(child: Material(
                color: Colors.transparent,
                child: InkWell(
                    splashColor: Colors.amber.withOpacity(0.3),
                    highlightColor: Colors.amber.withOpacity(0.1),
                    onTap: () { Navigator.of(context).push(
                        MaterialPageRoute(builder:(context)=> planDetial(list[i].title,list[i].name,list[i].userImg,list[i].contentUrl,list[i].design_id)));}
                ))),
          ]
      );
    }else {
      return SizedBox(width: 30,);}


  }
}


class design_map {
   String title;
   String name;
   String imgurl;
   String userImg;
   int design_id;
   String contentUrl;
  //const post(this.brand,this.name,this.price,this.imgurl);
   design_map(
      this.title,
      this.name,
      this.imgurl,
      {this.design_id=0,this.userImg="asset/creater.jpg",
        this.contentUrl="asset/demo.md"}
      );
}
//ListView.builder(scrollDirection: Axis.horizontal, itemCount: list.length, itemBuilder: _listitemBuilder,);
