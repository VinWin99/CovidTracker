import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  String url = 'https://covid19.mathdro.id/api';
  int confirmed = 0;
  int recovered = 0;
  int deaths = 0;

  Future<String> getData() async {
    var response = await http.get(Uri.encodeFull(url));
    setState(() {
      Map<String, dynamic> map = jsonDecode(response.body);
      confirmed = map.entries.elementAt(0).value["value"];
      recovered = map.entries.elementAt(1).value["value"];
      deaths = map.entries.elementAt(2).value["value"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Column(
              children: <Widget>[
                Text(
                  "Confirmed",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "$confirmed",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  "Recovered",
                  style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "$recovered",
                  style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  "Deaths",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "$deaths",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
              ],
            ),
            Container(
              height: 50.0,
              child: GestureDetector(
                onTap: getData,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Refresh",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        padding: EdgeInsets.all(16.0),
      ),
    );
  }
}
