import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users_comments/services/get_posts.dart';
import 'models/post.dart';

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
      home: MyHomePage(title: 'Users posts'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Posts> posts = [];

  Future<void> getPosts() async {
    posts = await GetPosts().getAllPosts();
    setState(() {
      posts;
      print(posts.length);
    });
  }

  @override
  void initState() {
    getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: posts.length > 0
            ? ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(posts[index].body),
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            : Center(child: Container(child: CircularProgressIndicator())),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
