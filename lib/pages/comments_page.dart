import 'package:flutter/material.dart';
import 'package:users_comments/models/comment.dart';
import 'package:users_comments/pages/widgets/comments_list_tile.dart';

class CommentSPage extends StatefulWidget {

  const CommentSPage({this.postTitle, this.listComments});

  final String postTitle;
  final List<Comment> listComments;

  _CommentSPageState createState() => _CommentSPageState();
}

class _CommentSPageState extends State<CommentSPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.postTitle),
      ),
      body: Center(
        child: widget.listComments.length > 0
            ? ListView.builder(
          itemCount: widget.listComments.length,
          itemBuilder: (context, index) {
            return CommentsListTile(listComments: widget.listComments, index: index);
          },
        )
            : Center(
          child: Container(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    ); // This trailing comma makes a
  }
}
