import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'palnDetial.dart';
import 'imageViewPage.dart';
import 'priceViewPage.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'goods_row.dart';
import 'goodsdetial.dart';
Map data;
List goodsList = [{'name':'单人座椅','brand':'Sophie','price':3000.0,'imgurl':'asset/chair.PNG'}];
class goodsListPage extends StatefulWidget{
 static String name='';
 static int scenid;
 static  int categoryid;
  goodsListPage(int scen,int category){
    scenid=scen;
    categoryid=category;
  }

  @override
  State<StatefulWidget> createState() => new _goodsListPage();

}

class _goodsListPage extends State<goodsListPage>{
  var _scrollController = new ScrollController(initialScrollOffset: 0);
  final TextEditingController _controller = new TextEditingController();
  var _load = 0;
  int _page = 0;
  Future<void> _onRefresh() async {
    setState(() {
      get();
      _page = 1;
      _load = 1;
    });
    // await _initData(_page);
    print("_onRefresh");
  }
  @override
  void initState() {
    super.initState();
    get();
    _scrollController.addListener(() {
      var px = _scrollController.position.pixels;
      if (px == _scrollController.position.maxScrollExtent) {
//        LogUtils.log("加载更多！");
        //  _onLoadMore();
      }
    });
//    _initData(_page);
  }
  get() async {
    print("网络开始请求");
    //String url ="http://192.168.18.12:8080/homedesign?sever=1&name="+goodsListPage.name+"&categoryid=0&scenid=0";
    String url = "http://192.168.18.12:8080/homedesign?sever=1&name="+goodsListPage.name+"&scenid="+goodsListPage.scenid.toString()+"&categoryid="+goodsListPage.categoryid.toString();
    print(url);
    var request = await http.get(url);
    var responseBody = request.body;
    data = json.decode(responseBody);
    print(responseBody);
    setState(() {
      goodsList=data['data'];
      print(goodsList);
    });
  }
  @override
  Widget build(BuildContext context) {
    print("绘图");

    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,size: 32,), onPressed: (){Navigator.pop(context);}),
          title:  TextField(
              controller: _controller,
              onSubmitted: (search){
                goodsListPage.name=_controller.text;
                get();
              },
              decoration: new InputDecoration(
                icon: Icon(Icons.search,color: Colors.black,),
                hintText: '输入关键词搜索',
              )
          ),
          backgroundColor: Colors.white ,
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: RefreshIndicator(
              onRefresh: _onRefresh,
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                padding: EdgeInsets.all(8),
                itemCount: goodsList.length,
                itemBuilder: (BuildContext context, int index) {
                  Map item = goodsList[index];
                  return PlanItem(item);},
                staggeredTileBuilder: (int index) => new StaggeredTile.count(2, 2),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,),
            ))
          ],
        ),
      ),
    );
  }

}

class PlanItem extends StatefulWidget {

  PlanItem(this.item);

  final Map item;

  @override
  _PlanItemState createState() {
    return _PlanItemState();
  }
}

class _PlanItemState extends State<PlanItem> {

  _PlanItemState();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Color(0xff999999), blurRadius: 2, offset: Offset(0.5, 0.5))
      ], borderRadius: BorderRadius.circular(4),color: Colors.white),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                imageViewPage(widget.item['imgurl'],width: 190,),
                SizedBox(height: 15,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 10,),
                    Text('Sophie',style: TextStyle(fontStyle: FontStyle.italic,),),
                    SizedBox(width: 10,),
                    Text(widget.item['name']),
                  ],
                ),
                priceViewPage(widget.item['price'],margin_lift: 10,),
              ],
            ),
            Positioned.fill(child: Material(
                color: Colors.transparent,
                child: InkWell(
                    splashColor: Colors.amber.withOpacity(0.3),
                    highlightColor: Colors.amber.withOpacity(0.1),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder:(context)=> goodsdetial(post(widget.item['goodid'],'Sophie',widget.item['name'],widget.item['price'],widget.item['imgurl'],widget.item['model']))));
                    }
                ))),
          ],
        ),
      ),
    );
  }

}
