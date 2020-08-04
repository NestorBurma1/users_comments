import 'package:flutter/material.dart';
import 'package:users_comments/models/comment.dart';

class CommentsListTile extends StatelessWidget {
  const CommentsListTile({
    @required this.listComments, @required this.index
  });

  final List<Comment> listComments;
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
                  subtitle: Text(listComments[index].body),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}