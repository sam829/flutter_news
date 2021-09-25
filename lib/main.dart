import 'package:flutter/material.dart';
import 'package:flutter_news/component/custom_tile.dart';
import 'package:flutter_news/service/api_service.dart';
import 'package:flutter_news/model/article_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService newsService = ApiService();
  String appBarTitle = "News";
  String category;
  bool isHomeSelected = true;
  bool isBusinessSelected = false;
  bool isEntertainmentSelected = false;
  bool isHealthSelected = false;
  bool isScienceSelected = false;
  bool isSportsSelected = false;
  bool isTechnologySelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_active_outlined),
            onPressed: () {},
          )
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text(" "),
                decoration: BoxDecoration(color: Colors.blueGrey),
              ),
              ListTile(
                title: Text(
                  "Categories",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 50.0),
                title: Text("Home"),
                selectedTileColor: Colors.blueGrey.withAlpha(30),
                selected: isHomeSelected,
                onTap: () {
                  setState(() {
                    category = 'general';
                    isHomeSelected = true;
                    isBusinessSelected = false;
                    isEntertainmentSelected = false;
                    isHealthSelected = false;
                    isScienceSelected = false;
                    isSportsSelected = false;
                    isTechnologySelected = false;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 50.0),
                title: Text("Business"),
                selectedTileColor: Colors.blueGrey.withAlpha(30),
                selected: isBusinessSelected,
                onTap: () {
                  setState(() {
                    category = 'business';
                    isHomeSelected = false;
                    isBusinessSelected = true;
                    isEntertainmentSelected = false;
                    isHealthSelected = false;
                    isScienceSelected = false;
                    isSportsSelected = false;
                    isTechnologySelected = false;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 50.0),
                title: Text("Entertainment"),
                selectedTileColor: Colors.blueGrey.withAlpha(30),
                selected: isEntertainmentSelected,
                onTap: () {
                  setState(() {
                    category = 'entertainment';
                    isHomeSelected = false;
                    isBusinessSelected = false;
                    isEntertainmentSelected = true;
                    isHealthSelected = false;
                    isScienceSelected = false;
                    isSportsSelected = false;
                    isTechnologySelected = false;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 50.0),
                title: Text("Health"),
                selectedTileColor: Colors.blueGrey.withAlpha(30),
                selected: isHealthSelected,
                onTap: () {
                  setState(() {
                    category = 'health';
                    isHomeSelected = false;
                    isBusinessSelected = false;
                    isEntertainmentSelected = false;
                    isHealthSelected = true;
                    isScienceSelected = false;
                    isSportsSelected = false;
                    isTechnologySelected = false;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 50.0),
                title: Text("Science"),
                selectedTileColor: Colors.blueGrey.withAlpha(30),
                selected: isScienceSelected,
                onTap: () {
                  setState(() {
                    category = 'science';
                    isHomeSelected = false;
                    isBusinessSelected = false;
                    isEntertainmentSelected = false;
                    isHealthSelected = false;
                    isScienceSelected = true;
                    isSportsSelected = false;
                    isTechnologySelected = false;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 50.0),
                title: Text("Sports"),
                selectedTileColor: Colors.blueGrey.withAlpha(30),
                selected: isSportsSelected,
                onTap: () {
                  setState(() {
                    category = 'sports';
                    isHomeSelected = false;
                    isBusinessSelected = false;
                    isEntertainmentSelected = false;
                    isHealthSelected = false;
                    isScienceSelected = false;
                    isSportsSelected = true;
                    isTechnologySelected = false;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 50.0),
                title: Text("Technology"),
                selectedTileColor: Colors.blueGrey.withAlpha(30),
                selected: isTechnologySelected,
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    category = 'technology';
                    isHomeSelected = false;
                    isBusinessSelected = false;
                    isEntertainmentSelected = false;
                    isHealthSelected = false;
                    isScienceSelected = false;
                    isSportsSelected = false;
                    isTechnologySelected = true;
                  });
                },
              )
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: newsService.getArticle(category),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) =>
                    customTile(snapshot.data[index], context));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
