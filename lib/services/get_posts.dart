import 'dart:convert';
import 'package:users_comments/models/post.dart';
import 'package:http/http.dart' as http;

class GetPosts {
  static const String postsUrl = 'https://jsonplaceholder.typicode.com/posts';
  List<Posts> listPosts = [];

  Future<List<Posts>> getAllPosts() async {
    final response = await http.get(postsUrl);
    if (response.statusCode == 200) {
      final List listJson = json.decode(response.body);
      listJson.forEach((element) {
        if (Posts.fromJson(element) != null)
        listPosts.add(Posts.fromJson(element),);
      });
    }
    return listPosts;
  }
}
