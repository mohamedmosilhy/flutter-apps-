import 'package:flutter/material.dart';
import 'package:myapp/components/user_post_widget.dart';
import 'package:myapp/database.dart';
import 'package:myapp/models/post.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Database.userPosts.length,
        itemBuilder: (context, index) {
          Map currentMap = Database.userPosts[index];
          Post currentPost = Post(currentMap);
          return PostWidget(
            post: currentPost,
          );
        });
  }
}
