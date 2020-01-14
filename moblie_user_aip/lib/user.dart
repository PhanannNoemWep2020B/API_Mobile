import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  List users;
 Future setUser() async {
    String url = "https://jsonplaceholder.typicode.com/users";
    http.Response response = await http.get(url);
    setState(() {
        users = json.decode(response.body);
    });
 
  }

  @override
  void initState() {
    super.initState();
    setUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("User Information"),
        ),
        body: ListView.builder(
          //itemCount for provide array array to itemBuilder from API to loop
          itemCount: users == null ? 0 : users.length,
          //if itemCount 10 time. itemBuilder will diplay 10 time. if 30 time. it will display 30 time
          itemBuilder: (BuildContext context, int i){
            return Card(
              child: Text("Welcome"),
            );
          }
        ),
      ),
    );
  }
}