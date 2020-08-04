import 'package:flutter/material.dart';
import 'package:users_comments/models/comment.dart';
import 'package:users_comments/models/post.dart';
import 'package:users_comments/pages/comments_page.dart';
import 'package:users_comments/services/get_comments.dart';

class PostListTile extends StatelessWidget {
  const PostListTile({@required this.posts, @required this.index});

  final List<Posts> posts;
  final int index;

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
                    posts[index].title,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(posts[index].body),
                  onTap: () async {
                    final List<Comment> listComment =
                        await GetComments().getAllComments(posts[index].id);
                    Navigator.push(
                      context,
                      MaterialPageRoute<CommentSPage>(
                        builder: (context) => CommentSPage(
                          postTitle: posts[index].title,
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
