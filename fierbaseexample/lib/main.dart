// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String username = "Ahmed Adel";
  void _handleSendMessage() async {
    if (_textEditingController.text.isNotEmpty) {
      FirebaseFirestore db = FirebaseFirestore.instance;
      final msg = {
        "text": _textEditingController.text,
        "username": username,
        "createdAt": Timestamp.now()
      };
      await db.collection("messages").add(msg);
      _textEditingController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          elevation: 0,
          flexibleSpace: SafeArea(
              child: Container(
            padding: const EdgeInsets.only(right: 18),
            child: Row(children: [
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Chat Room",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    DateTime.now().toString().split(" ")[0],
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  )
                ],
              )),
              GestureDetector(
                onTap: () => showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                          title: const Text("Set user name"),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (newText) {
                                  setState(() {
                                    username = newText;
                                  });
                                },
                                decoration: const InputDecoration(
                                    label: Text("Enter user name")),
                              ),
                            )
                          ],
                        )),
                child: const Icon(
                  Icons.settings,
                  color: Colors.black54,
                ),
              )
            ]),
          )),
        ),
        body: Stack(children: [
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("messages")
                  .orderBy("createdAt", descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView(
                    children: snapshot.data!.docs.map((doc) {
                      Map<String, dynamic> data =
                          doc.data()! as Map<String, dynamic>;
                      bool isCurrentUser = data["username"] == username;
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: Align(
                          alignment: isCurrentUser
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: isCurrentUser
                                    ? Colors.blue
                                    : Colors.grey[300],
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                data["text"],
                                style: TextStyle(
                                    color: isCurrentUser
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(children: <Widget>[
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: TextField(
                  controller: _textEditingController,
                  onSubmitted: (string) => _handleSendMessage(),
                  decoration: const InputDecoration(
                      hintText: "Write message...",
                      hintStyle: TextStyle(
                        color: Colors.black54,
                      ),
                      border: InputBorder.none),
                )),
                const SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  onPressed: _handleSendMessage,
                  backgroundColor: Colors.blue,
                  elevation: 0,
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 18,
                  ),
                )
              ]),
            ),
          ),
        ]));
  }
}
