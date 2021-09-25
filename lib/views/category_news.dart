//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';

import 'article_view.dart';
class CategoryNews extends StatefulWidget {
  //const CategoryNews({Key? key}) : super(key: key);
  final String category;
  CategoryNews({this.category});


  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<ArticleModel> articles = new List<ArticleModel>();
  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async{
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
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
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.save)),
          )
        ],
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
          child:Column(
            children: [
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
          )],
          ) ,
        ),
    ) ,
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
