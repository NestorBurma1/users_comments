import 'package:hive/hive.dart';
part 'comment.g.dart';

@HiveType(typeId: 1)
class Comment {
  @HiveField(0)
  final int postId;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String body;

  Comment(this.postId, this.id, this.name, this.email, this.body);

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
      json['postId'], json['id'], json['name'], json['email'], json['body']);
}
