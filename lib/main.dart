import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MaterialApp(
      title: 'Splashify',
      home: new Splashify(),
    ),
  );
}

class Splashify extends StatefulWidget {
  @override
  _SplashifyState createState() => _SplashifyState();
}

class _SplashifyState extends State<Splashify> {
  void getImages() async {
    var link = 'https://api.unsplash.com/photos';
    var res = await http.get(link, headers: {'accept': 'application/json'});
    var data = json.decode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 19, 33, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(29, 45, 68, 1.0),
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print('Menu is opened!');
            }),
        title: Text(
          'Splashify',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
      ),
      body: GridView.builder(
          itemCount: 50,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int position) {
            return Container(
              padding: EdgeInsets.all(8.0),
              child: GridTile(
                footer: Text(
                  'Item',
                  style: TextStyle(color: Colors.white, fontSize: 17.0),
                  textAlign: TextAlign.start,
                ),
                child: Image.network(
                  'http://images.ctfassets.net/yadj1kx9rmg0/wtrHxeu3zEoEce2MokCSi/cf6f68efdcf625fdc060607df0f3baef/quwowooybuqbl6ntboz3.jpg',
                  fit: BoxFit.scaleDown,
                ),
              ),
              color: Color.fromRGBO(101, 97, 118, 1.0),
              margin: EdgeInsets.all(12.0),
            );
          }),
    );
  }
}
