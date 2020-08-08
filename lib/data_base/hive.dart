import 'package:hive/hive.dart';
import 'package:users_comments/models/comment.dart';
import 'package:users_comments/models/post.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveDb {
  Future<void> hiveInit() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    Hive.registerAdapter<Posts>(PostsAdapter());
    Hive.registerAdapter<Comment>(CommentAdapter());
  }

  void hiveOpenBoxPosts() {
    final postsHive = Hive.box<Posts>('posts');
  }

  void addPosts(Posts post) {
    final contactBox = Hive.box('posts');
    contactBox.add(post);
  }
}
