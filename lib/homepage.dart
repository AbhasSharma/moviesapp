// ignore_for_file: prefer_const_constructors
import 'Loginpage.dart';
import 'package:flutter/material.dart';
import 'Secondpage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

var Movies = []; //database

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    getMovies();
    // TODO: implement initState
    super.initState();
  }

  getMovies() async {
    var apikey = "ab9864fcfbmshc52b7c75287510fp1e4b27jsn213e0da2b8b0";
    var baseurl = "https://imdb8.p.rapidapi.com/title/find?q='game of thr'";

    Map<String, String> headers = {
      'x-rapidapi-host': 'imdb8.p.rapidapi.com',
      'x-rapidapi-key': 'ab9864fcfbmshc52b7c75287510fp1e4b27jsn213e0da2b8b0'
    };

    var url = Uri.parse("$baseurl?q&apikey=$apikey");

    var response = await http.get(url, headers: headers);
    // ignore: avoid_print
    print(response.body);
    // ignore: avoid_print
    print(response.body.runtimeType);
    var jsonResponse = convert.jsonDecode(response.body);
    // ignore: avoid_print
    print(jsonResponse.length);

    setState(() {
      Movies = jsonResponse["results"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.orange[700],
            title: Center(
                child: Text(
              "Movies Review",
              style: TextStyle(
                color: Colors.cyanAccent,
                fontSize: 30.0,
                fontStyle: FontStyle.italic,
              ),
            ))),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Abhas Sharma"),
                accountEmail: Text("abhasshharma.03@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  child: Text("A"),
                ),
              ),
              ListTile(
                  title: Text("Read More", style: TextStyle(fontSize: 15)),
                  trailing: Icon(Icons.arrow_forward_ios)),
              ListTile(
                  title: Text("", style: TextStyle(fontSize: 15)),
                  trailing: Icon(Icons.arrow_forward_ios)),
              ListTile(
                  title: Text("Settings", style: TextStyle(fontSize: 15)),
                  trailing: Icon(Icons.settings)),
              ListTile(
                  title: Text("Languages", style: TextStyle(fontSize: 15)),
                  trailing: Icon(Icons.language_sharp)),
              ListTile(
                title: Text(
                  "Logout",
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Loginpage()));
                },
                trailing: Icon(Icons.logout),
              ),
            ],
          ),
        ),
        body: Movies.length > 0
            ? ListView.builder(
                // padding: const EdgeInsets.all(5),
                itemCount: Movies.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Movies[index]["image"] != null
                              ? Container(
                                  margin: const EdgeInsets.all(5.0),
                                  //   width: 250,
                                  child: InkWell(
                                    child: Image.network(
                                      Movies[index]["image"]['url'],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SecondPage()));
                                    },
                                  )

                                  // ignore: prefer_const_constructors

                                  )
                              : Icon(Icons.error),
                          Container(
                            margin: const EdgeInsets.all(5.0),
                            //   width: 250,
                            child: Text(Movies[index]["title"],
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrangeAccent)),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5.0),
                            //   width: 250,
                            child: Text(
                                "Episodes ${Movies[index]["numberOfEpisodes"]}",
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                )),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Icon(Icons.thumb_up, color: Colors.black),
                                    Icon(Icons.message, color: Colors.black),
                                    Icon(Icons.share, color: Colors.black),
                                  ],
                                ),
                                Icon(
                                  Icons.bookmark,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ));
                })
            : Center(child: Text("No data found")));
  }
}
