import 'package:flutter/material.dart';
import 'homepage.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  firstpage() {
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => Homepage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Page"),
        ),
        body: Center(
            child: Container(
          child: MaterialButton(
            color: Colors.blue,
            onPressed: () {
              firstpage();
            },
            child: Text(
              "Thank you!",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )));
  }
}
