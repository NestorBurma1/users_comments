import 'dart:convert';

import 'package:users_comments/models/comment.dart';
import 'package:http/http.dart' as http;

class GetComments {
  static const String postsUrl = 'https://jsonplaceholder.typicode.com/posts';
  List<Comment> listComments = [];

  Future<List<Comment>> getAllComments(int postId) async {
    final response = await http.get(postsUrl+'/'+postId.toString()+'/comments');
    if (response.statusCode == 200) {
      listComments = getListFromJson(response);
    }
    return listComments;
  }

  List<Comment> getListFromJson(dynamic response){
    List<Comment> listComments = [];
    final List listJson = json.decode(response.body);
    listJson.forEach((element) {
      if (Comment.fromJson(element) != null)
        listComments.add(Comment.fromJson(element),);
    });
    return listComments;
  }

}
