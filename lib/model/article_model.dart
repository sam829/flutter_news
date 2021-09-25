class Article {
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
  String author;

  Article(
      {this.author,
      this.title,
      this.content,
      this.description,
      this.publishedAt,
      this.url,
      this.urlToImage});

  factory Article.fromJson(Map<String, dynamic> article) {
    return Article(
        author: article['author'],
        title: article['title'],
        content: article['content'],
        description: article['description'],
        publishedAt: article['publishedAt'],
        url: article['url'],
        urlToImage: article['urlToImage']);
  }
}
