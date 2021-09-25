import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/article_view.dart';
import 'package:news_app/views/category_news.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel>articles = new List<ArticleModel>();

  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();

  }
  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
    articles= newsClass.news;
    setState(() {
      loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter"),
            Text("News",style: TextStyle(
              color: Colors.blue
            ),)
          ],
        ),
        centerTitle: true,
        elevation:0.0,
      ),
      body: loading ? Center(
          child: Container(
            child:CircularProgressIndicator() ,
          ),

        ):SingleChildScrollView(

          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [

              ///categories
              Container(
                //padding: EdgeInsets.symmetric(horizontal: 16),
                height: 70,
                child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap:true ,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return CategoryTile(
                        imageUrl:categories[index].imageUrl ,
                        categoryName: categories[index].categoryName,
                      );
                    }),
              ),
              ///blogs
                  ///
              Container(
                padding: EdgeInsets.only(top:16),
                child: ListView.builder(
                  itemCount: articles.length,
                    shrinkWrap: true,
                    physics:ClampingScrollPhysics() ,
                    //scrollDirection: Axis.vertical,
                    itemBuilder: (context, index){
                    return BlogTile(
                      imageUrl: articles[index].urlToImage,
                      title: articles[index].title,
                      desc: articles[index].description,
                      url: articles[index].url,
                    );
                    }
                ),
              )
            ],
          ) ,
        ),
      ),
    );
  }
}
class CategoryTile extends StatelessWidget {
  //const CategoryTile({Key? key}) : super(key: key);
  final String imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => CategoryNews(
              category: categoryName.toLowerCase(),
            )

        ));
      },
      child: Container(
        margin:EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
                child: Image.asset(imageUrl,width: 120,height: 60,fit: BoxFit.cover,)),
            Container(
              alignment: Alignment.center,
              width: 120,height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),

              child: Text(categoryName,style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),),
            )
          ],
        ),
      ),
    );
  }
}
class BlogTile extends StatelessWidget {
  //const BlogTile({Key? key}) : super(key: key);
  final String imageUrl,title,desc,url;
  BlogTile({@required this.imageUrl,@required this.title,@required this.desc,@required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Article(
                blogUrl:url ,
            )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            SizedBox(height: 8,),
            Text(title,style:TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 8,),
            Text(desc,style: TextStyle(
              color: Colors.black54
            ),)

          ],
        ),
      ),
    );
  }
}



