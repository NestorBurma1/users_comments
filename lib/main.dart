import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users_comments/pages/posts_page.dart';
import 'package:hive/hive.dart';

void main()  {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User posts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostsPage(title: 'Users posts'),
    );
  }
}

