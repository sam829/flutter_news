import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news/component/custom_tile.dart';
import 'package:flutter_news/model/article_model.dart';
import 'package:flutter_news/service/api_service.dart';

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
    return WillPopScope(
      onWillPop: () async {
        // You can do some work here.
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Exit?'),
                  content: Text('Click OK to exit the app.'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          SystemNavigator.pop(animated: true);
                        },
                        child: Text('OK'))
                  ],
                ));
        // Returning true allows the pop to happen, returning false prevents it.
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
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
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10.0),
                          child: CircleAvatar(
                            radius: 40.0,
                            backgroundColor: Colors.white,
                            child: Text(
                              "UN",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 3.0),
                          child: Text(
                            "Username",
                            style: TextStyle(
                                fontSize: 15.0,
                                letterSpacing: 2.0,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          child: Text("username@email.com",
                              style: TextStyle(color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(color: Colors.blueGrey),
                ),
                ListTile(
                  title: Text(
                    "Categories",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
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
                  leading: Icon(Icons.business),
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
                  leading: Icon(Icons.theaters),
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
                  leading: Icon(Icons.healing),
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
                  leading: Icon(Icons.science),
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
                  leading: Icon(Icons.sports_soccer),
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
                  leading: Icon(Icons.biotech),
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
                ),
                Divider(
                  color: Colors.blueGrey,
                  height: 1.0,
                ),
                ListTile(
                  trailing: Icon(Icons.logout),
                  title: Text("Sign Out", style: TextStyle(fontSize: 18.0)),
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text(
                                'Exit?',
                                textScaleFactor: 1.1,
                              ),
                              content: Text('Are you sure?'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      SystemNavigator.pop(animated: true);
                                    },
                                    child: Text('OK'))
                              ],
                            ));
                  },
                ),
              ],
            ),
          ),
        ),
        body: FutureBuilder(
          future: newsService.getArticle(category),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
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
      ),
    );
  }
}
