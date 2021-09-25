import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:flutter_news/model/article_model.dart';

Widget customTile(Article article, BuildContext context) {
  return Card(
    margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
    elevation: 10.00,
    child: InkWell(
      splashColor: Colors.blueGrey.withAlpha(60),
      onTap: () {
        _launchURL(context, article.url);
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            article.urlToImage != null
                ? Container(
                    height: 200.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(article.urlToImage))),
                  )
                : Container(
                    height: 200.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://source.unsplash.com/weekly?coding'))),
                  ),
            SizedBox(
              height: 8.0,
            ),
            article.title != null
                ? Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      article.title,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ))
                : Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      " ",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    )),
            article.description != null
                ? Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      article.description,
                    ))
                : Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      " ",
                    )),
          ],
        ),
      ),
    ),
  );
}

void _launchURL(BuildContext context, String url) async {
  try {
    await launch(url,
        customTabsOption: CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
        ));
  } catch (e) {
    debugPrint(e.toString());
  }
}
