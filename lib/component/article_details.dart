import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/model/article_model.dart';

class ArticleDetail extends StatelessWidget {
  final Article article;

  ArticleDetail({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(article.urlToImage != null
                      ? article.urlToImage
                      : 'https://source.unsplash.com/weekly?coding'),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                article.title != null
                    ? article.title
                    : " Title is not available ",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                article.description != null
                    ? article.description
                    : " Description is not available ",
                style: TextStyle(height: 1.4),
              ),
            )
          ]),
    );
  }
}
