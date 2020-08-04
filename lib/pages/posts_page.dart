import 'package:flutter/material.dart';
import 'package:users_comments/models/post.dart';
import 'package:users_comments/pages/widgets/posts_list_tile.dart';
import 'package:users_comments/services/get_posts.dart';

class PostsPage extends StatefulWidget {
  PostsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
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
                  return PostListTile(posts: posts, index: index);
                },
              )
            : Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

