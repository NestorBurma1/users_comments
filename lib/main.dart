import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users_comments/pages/posts_page.dart';
void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

