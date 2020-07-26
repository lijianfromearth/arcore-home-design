import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'search.dart';
import 'cataloguePage.dart';
import 'goods_row.dart';
import 'design_row.dart';
import 'banner.dart';
import 'explort.dart';
import 'cart_page.dart';
import 'imageViewPage.dart';
import 'drawerPage.dart';
void main() => runApp(MyApp());
String account_name="小剑";
String account_img = "asset/creater.jpg";
bool isEntry = false;
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyAppState();
}

class MyAppState extends State<MyApp>{
  static int selectedIndex = 0 ;

  void onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  var _load = 0;
  int _page = 0;
  Future<void> _onRefresh() async {
    setState(() {
      _page = 1;
      _load = 1;
    });
    // await _initData(_page);
    print("_onRefresh");
  }
  List<post> setNewgoods(){
    return [
      post('2020042501','Sophie',  '单人座椅', 3000.0, 'asset/chair.PNG','chair'),
      post('2020012502','Sophie','北欧高木床',3000.0,'asset/bed.PNG','bed'),
      post('2020042503','Sophie','红衫实木桌',3000.0,'asset/table.PNG','centertable'),
    ];
  }
  List<design_map> setDesigner(){
    return [
      design_map("客厅布置2020","小剑","asset/home01.jpg"),
      design_map("温馨卧室2020","小剑","asset/home01.jpg"),
      design_map("现代风客厅","小剑","asset/home01.jpg"),
    ];
  }
  var _scrollController = new ScrollController(initialScrollOffset: 0);
  final TextEditingController _controller = new TextEditingController();
  static var PlanList = [
    PlanEntity("来点异域风情","小剑","https://pic3.zhimg.com/80/v2-2704ac39703d71bfa880a0588986b592_720w.jpg"),
    PlanEntity("好收纳的小格子 特别适合小玩物","小剑","https://pic1.zhimg.com/80/v2-7be6c18e18af02bc54bc2bf6ea71316d_720w.jpg"),
    PlanEntity("暗色调","XIaoJIan","https://pic1.zhimg.com/80/v2-57c986e6f7c950119832cccd6ec91286_720w.jpg"),
    PlanEntity("喜欢画片的你看过来 这样排列很不错","小剑","https://pic2.zhimg.com/v2-169587e9c2ab17fe3081b6e3b29100ba_1200x500.jpg"),
    PlanEntity("用实木装点生活","小剑","https://pic2.zhimg.com/v2-169587e9c2ab17fe3081b6e3b29100ba_1200x500.jpg"),
    PlanEntity("来点异域风情","XIaoJIan","https://cn.bing.com/th?id=OIP.KL0Gpksfz1rLG3nWDo_U1QHaE3&pid=Api&rs=1"),
    PlanEntity("你可能喜欢这个","小剑","https://cn.bing.com/th?id=OIP.jRN8lYImmpHyuq9AViY_TQAAAA&pid=Api&rs=1"),
    PlanEntity("来点异域风情","XIaoJIan","http://img6.cache.netease.com/home/2015/3/27/20150327173509dee68_550.jpg"),
    PlanEntity("科技感","XIaoJIan","http://img.mp.itc.cn/upload/20170621/3d6f5bec24044d43960b62e0e47d1478_th.jpg"),
    PlanEntity("来点异域风情","XIaoJIan","https://pic3.zhimg.com/80/v2-2704ac39703d71bfa880a0588986b592_720w.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if(selectedIndex==0) return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white

      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("主页",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          centerTitle: true,
          elevation: 0,
        ),
        drawer: drawerPage(),
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.fromLTRB(20, 7, 20, 7),
          child: ListView(
            children: <Widget>[
              search(0),
//              Mybanner(),
              cataloguePage(),
              SizedBox(height: 20,),
              goods_row('折扣优惠',setNewgoods()),
              design_row('精品设计',setDesigner()),
              Image.asset('asset/hdlogo.PNG',),
              SizedBox(height: 30,)
            ],
          ),

        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.black,),
              title: Text('主页',style: TextStyle(color:Colors.black ),),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore,color: Colors.black,),
              title: Text('探索',style: TextStyle(color:Colors.black ),),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,color: Colors.black,),
              title: Text('购物车',style: TextStyle(color:Colors.black ),),
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: onItemTapped,
        ),
      ),


    );
    if(selectedIndex==1) return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("探索",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          centerTitle: true,
          elevation: 0,
        ),
        body:Column(
          children: <Widget>[
            TextField(
                controller: _controller,
                onSubmitted: (search){
                  setState(() {
                    if(_controller.text==''){
                      PlanList=[
                        PlanEntity("来点异域风情","小剑","https://pic3.zhimg.com/80/v2-2704ac39703d71bfa880a0588986b592_720w.jpg"),
                        PlanEntity("好收纳的小格子 特别适合小玩物","小剑","https://pic1.zhimg.com/80/v2-7be6c18e18af02bc54bc2bf6ea71316d_720w.jpg"),
                        PlanEntity("暗色调","XIaoJIan","https://pic1.zhimg.com/80/v2-57c986e6f7c950119832cccd6ec91286_720w.jpg"),
                        PlanEntity("喜欢画片的你看过来 这样排列很不错","小剑","https://pic2.zhimg.com/v2-169587e9c2ab17fe3081b6e3b29100ba_1200x500.jpg"),
                        PlanEntity("用实木装点生活","小剑","https://pic2.zhimg.com/v2-169587e9c2ab17fe3081b6e3b29100ba_1200x500.jpg"),
                        PlanEntity("来点异域风情","XIaoJIan","https://cn.bing.com/th?id=OIP.KL0Gpksfz1rLG3nWDo_U1QHaE3&pid=Api&rs=1"),
                        PlanEntity("你可能喜欢这个","小剑","https://cn.bing.com/th?id=OIP.jRN8lYImmpHyuq9AViY_TQAAAA&pid=Api&rs=1"),
                        PlanEntity("来点异域风情","XIaoJIan","http://img6.cache.netease.com/home/2015/3/27/20150327173509dee68_550.jpg"),
                        PlanEntity("科技感","XIaoJIan","http://img.mp.itc.cn/upload/20170621/3d6f5bec24044d43960b62e0e47d1478_th.jpg"),
                        PlanEntity("来点异域风情","XIaoJIan","https://pic3.zhimg.com/80/v2-2704ac39703d71bfa880a0588986b592_720w.jpg"),
                      ];

                    }
                    else PlanList=[
                      PlanEntity("来点异域风情","小剑","https://pic3.zhimg.com/80/v2-2704ac39703d71bfa880a0588986b592_720w.jpg"),
                      PlanEntity("来点异域风情","XIaoJIan","https://cn.bing.com/th?id=OIP.KL0Gpksfz1rLG3nWDo_U1QHaE3&pid=Api&rs=1"),
                      PlanEntity("来点异域风情","XIaoJIan","http://img6.cache.netease.com/home/2015/3/27/20150327173509dee68_550.jpg"),
                      PlanEntity("来点异域风情","XIaoJIan","https://pic3.zhimg.com/80/v2-2704ac39703d71bfa880a0588986b592_720w.jpg"),
                    ];
                  });
                },
                decoration: new InputDecoration(
                  icon: Icon(Icons.search,color: Colors.black,),
                  hintText: '输入关键词搜索',
                )
            ),
            Expanded(child: RefreshIndicator(
              onRefresh: _onRefresh,
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                padding: EdgeInsets.all(8),
                itemCount: PlanList.length,
                itemBuilder: (BuildContext context, int index) {
                  PlanEntity item = PlanList[index];
                  return PlanItem(item);},
                staggeredTileBuilder: (int index) => new StaggeredTile.count(2, index == 0 ? 2.5 : 3),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,),
            ))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.black,),
              title: Text('主页',style: TextStyle(color:Colors.black ),),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore,color: Colors.black,),
              title: Text('探索',style: TextStyle(color:Colors.black ),),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,color: Colors.black,),
              title: Text('购物车',style: TextStyle(color:Colors.black ),),
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: onItemTapped,
        ),
      ),
    );
     return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white

      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("购物车",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          centerTitle: true,
          elevation: 0,
        ),

        backgroundColor: Colors.white,
        body: CartPage(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.black,),
              title: Text('主页',style: TextStyle(color:Colors.black ),),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore,color: Colors.black,),
              title: Text('探索',style: TextStyle(color:Colors.black ),),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,color: Colors.black,),
              title: Text('购物车',style: TextStyle(color:Colors.black ),),
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: onItemTapped,
        ),
      ),


    );
  }

}


