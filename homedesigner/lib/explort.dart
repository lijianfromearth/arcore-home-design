import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'palnDetial.dart';


String nameLink='';
class explort extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new exportState();
}

class exportState extends State<explort>{
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
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      var px = _scrollController.position.pixels;
      if (px == _scrollController.position.maxScrollExtent) {
//        LogUtils.log("加载更多！");
      //  _onLoadMore();
      }
    });
//    _initData(_page);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        TextField(
            controller: _controller,
            onSubmitted: (search){
              setState(() {
                if(_controller.text==''){
                  exportState.PlanList=[
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
                else exportState.PlanList=[
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
    );
  }
}

class PlanItem extends StatefulWidget {

  PlanItem(this.item);

  final PlanEntity item;

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
            Container(
              child: Image.network(
                widget.item.imageUrl,
                fit: BoxFit.cover,
              ),
              constraints: BoxConstraints.expand(),
            ),
            Container(
              constraints:
              BoxConstraints.expand(width: double.infinity, height: 38),
              color: Colors.black26,
              child: Center(
                child: Text(
                  widget.item.title,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Positioned.fill(child: Material(
                color: Colors.transparent,
                child: InkWell(
                    splashColor: Colors.amber.withOpacity(0.3),
                    highlightColor: Colors.amber.withOpacity(0.1),
                    onTap: () { Navigator.of(context).push(
                        MaterialPageRoute(builder:(context)=> planDetial(widget.item.title,widget.item.name,widget.item.userImg,widget.item.contentUrl,widget.item.design_id)));}
                ))),
          ],
        ),
      ),
    );
  }

}

class PlanEntity {
  int design_id;
  String title;
  String contentUrl;
  String imageUrl;
  String name;
  String userImg;
  PlanEntity(
        this.title,
        this.name,
        this.imageUrl,
        {this.design_id=0,this.userImg="asset/creater.jpg",
        this.contentUrl="asset/demo.md"}
        );
}