
//自定义你的数据，例如 图片的URL

List<banner_data> data = [
  banner_data("沙发","asset/page_3.jpg",null,null,"sofa",0,"JIan"),
  banner_data("精品实木桌","asset/page_2.jpg",null,null,"table",0,"JIan"),
  banner_data("家具布置方案","asset/page_1.jpg",null,null,"chair",1,"JIan"),
];
class banner_data {
   String images;
   String images_url;
   int Tag;
   String id;
   String title;
   String user_name;
   String model_name;

   banner_data(
       this.title,
       this.images,
       this.id,
       this.images_url,
       this.model_name,
       this.Tag,
       this.user_name
       );
}
Map<String,String> userList= {'小剑':'123456'};