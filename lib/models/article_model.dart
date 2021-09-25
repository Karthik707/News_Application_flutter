class ArticleModel{
  String title;
  String author;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;
  String articleUrl;

  ArticleModel({this.title,this.description,this.author,this.content,this.publishedAt,
    this.urlToImage, this.articleUrl,this.url});
}