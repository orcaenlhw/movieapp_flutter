import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var message = "";

  int userID = 0;
  int id = 0;
  var title = "";

  loadAPI() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/albums/1");
    var response = await http.get(url);
    var body = response.body;
    var decodeResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    userID = decodeResponse["userId"];
    id = decodeResponse["id"];
    title = decodeResponse["title"];
    setState(() {});
  }

  @override
  void initState() {}
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Movie App"),
        ),
        body: Column(
          children: [Text("$userID"), Text("$id"), Text(title)],
        ));
  }
}
