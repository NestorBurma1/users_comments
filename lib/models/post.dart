import 'package:hive/hive.dart';
part 'post.g.dart';

@HiveType(typeId: 0)
class Posts {
  @HiveField(0)
  int userId;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String body;

  Posts(this.userId, this.id, this.title, this.body);

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(json['userId'], json['id'], json['title'], json['body']);
  }
}
