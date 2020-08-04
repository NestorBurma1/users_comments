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
  Future<void> openHiveComments() async{
    final hiveComments = Hive.openBox('comments');
    setState(() {
      hiveComments;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
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
                  onTap: () async {
                    final List<Comment> listComment =
                        await GetComments().getAllComments(widget.posts[widget.index].id);
                    Navigator.push(
                      context,
                      MaterialPageRoute<CommentSPage>(
                        builder: (context) => CommentSPage(
                          postTitle: widget.posts[widget.index].title,
                          listComments: listComment,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
