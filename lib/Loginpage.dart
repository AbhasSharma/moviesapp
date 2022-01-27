import 'package:flutter/material.dart';
import 'homepage.dart';


class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
 


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        appBar: AppBar(title: Text("Login App")),
        body: Container(
          padding: EdgeInsets.fromLTRB(40, 150, 40, 20),
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              ClipOval(
              child: Image.asset(
                "assets/Abhas.jpg",
                width: 10,
                height: 10,
              ),
              ),
              Text(
                "Login ",
                style: TextStyle(
                    fontSize: 40,
                    fontStyle: FontStyle.normal,
                    color: Colors.cyan,
                    fontWeight: FontWeight.bold), //TextStyle
              ), //Text
               TextField(
                decoration: InputDecoration(
                    labelText: "Enter Username", prefixIcon: Icon(Icons.email)),
                    style: TextStyle(

                    ),
              ), //TextField
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Enter Password",
                    prefixIcon: Icon(Icons.remove_red_eye)),
              ),
             Container(margin: EdgeInsets.all(10)),
             Text(
                "Forget Pasword ?",
                style: TextStyle(color: Colors.blue),
              ),
              Container(margin: EdgeInsets.all(8)),
              TextButton(
                  style: TextButton.styleFrom(
                   elevation: 10,
                    backgroundColor: Colors.green,
                    minimumSize: Size(100, 40),
                    padding: EdgeInsets.symmetric(horizontal: 106.0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Login    ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
             Container(margin: EdgeInsets.all(6)),
              TextButton(
                  style: TextButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.red,
                    minimumSize: Size(100, 40),
                    padding: EdgeInsets.symmetric(horizontal: 106.0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Register    ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
