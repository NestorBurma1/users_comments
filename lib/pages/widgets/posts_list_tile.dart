import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:users_comments/models/comment.dart';
import 'package:users_comments/models/post.dart';
import 'package:users_comments/pages/comments_page.dart';
import 'package:users_comments/services/get_comments.dart';

class PostListTile extends StatefulWidget {
  const PostListTile({@required this.posts, @required this.index});

  final List<Posts> posts;
  final int index;

  @override
  _PostListTileState createState() => _PostListTileState();
}

class _PostListTileState extends State<PostListTile> {
  List<Comment> comments = [];

  Future<void> openBoxComments() async {
    final hiveComments = await Hive.openBox<Comment>('comments');
    setState(() {
      hiveComments;
    });
  }

  Future<void> getComments() async {
    final commentsHive = Hive.box<Comment>('comments');
    for (int i = 0; i < commentsHive.length; i++) {
      if (widget.posts[widget.index].id ==
          commentsHive.getAt(i).postId)
        comments.add(commentsHive.getAt(i));
    }
    if (comments.isEmpty) {
      try {
        comments = await GetComments()
            .getAllComments(widget.posts[widget.index].id);
      } catch (e) {
        comments = [];
      }
      comments.forEach((element) {
        commentsHive.add(element);
      });
    }
    Navigator.push(
      context,
      MaterialPageRoute<CommentSPage>(
        builder: (context) => CommentSPage(
          postTitle: comments.isNotEmpty
              ? widget.posts[widget.index].title
              : 'Check internet connection',
          listComments: comments,
        ),
      ),
    );
  }

  @override
  void initState() {
    openBoxComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  title: Text(
                    widget.posts[widget.index].title,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(widget.posts[widget.index].body),
                  onTap: (){getComments();}
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
