import 'package:flutter/material.dart';
import 'search.dart';
import 'announcementPage.dart';
import 'cataloguePage.dart';
import 'goods_row.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  List<post> setNewgoods(){
    return [
      post('Sophie',  '单人座椅', 3000.0, 'asset/chair.PNG','chair'),
      post('Sophie','北欧高木床',3000.0,'asset/bed.PNG','bed'),
      post('Sophie','红衫实木桌',3000.0,'asset/table.PNG','chaird'),
    ];
  }
  List<post> setDesigner(){
    return [
      post('NAPA','巴黎床头桌',1280.0,'asset/centertable.PNG','centertable'),
      post('Nantez','牛皮美式沙发',7000.0,'asset/sofa.PNG','sofa'),
      post('Sophie','北欧高木床',3000.0,'asset/bed.PNG','bed'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white

      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(98, 0, 238, 100),
          title: Text("主页",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          centerTitle: true,
          elevation: 0,
        ),
        drawer: Text("MADE BY 李健",style: TextStyle(fontSize: 40,color: Colors.amber,),),
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.all(20),
          child: ListView(
              children: <Widget>[
                search(),
                announcementPage(),
                cataloguePage(),
                SizedBox(height: 20,),
                goods_row('今日上新',setNewgoods()),
                goods_row('设计师推荐',setDesigner()),
                Image.asset('asset/hdlogo.PNG',),
                SizedBox(height: 30,)
              ],
          ),

        ),
      ),


    );
  }
}


