import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users_comments/pages/posts_page.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
void main() async {

  runApp(MyApp());
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  final hivePosts = await Hive.openBox('posts');

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

