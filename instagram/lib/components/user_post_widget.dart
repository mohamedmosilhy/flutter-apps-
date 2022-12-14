import 'package:flutter/material.dart';
import 'package:myapp/models/post.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  String peopleName(String fullName) {
    List<String> names = fullName.split(" ");
    return names[0][0] + names[1][0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 16, 48, 189),
              child: Text(
                peopleName(widget.post.name),
                style: const TextStyle(color: Color.fromARGB(255, 9, 198, 144)),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.post.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  widget.post.location,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
      ),
      Container(
        height: 350,
        color: Colors.grey,
        child: Image.asset(
          widget.post.image,
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.post.numberOfLikes++;
                    });
                  },
                  child: const Icon(
                    Icons.favorite_outline,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.message_outlined,
                  color: Colors.black54,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.share_outlined,
                  color: Colors.black54,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Spacer(),
                const Icon(
                  Icons.bookmark_outlined,
                  color: Colors.black54,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    const TextSpan(
                        text: "Liked by:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: " ${widget.post.numberOfLikes} people")
                  ]),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                        text: widget.post.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: " ${widget.post.caption}")
                  ]),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      )
    ]);
  }
}
