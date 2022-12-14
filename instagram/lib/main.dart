import 'package:flutter/material.dart';
import 'package:myapp/pages/Home.dart';
import 'package:myapp/pages/add_post.dart';
import 'package:myapp/pages/explore.dart';
import 'package:myapp/pages/notifications.dart';
import 'package:myapp/pages/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  void navigateToAnotherTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> pages = const [
    HomePage(),
    Explore(),
    AddPost(),
    Notifications(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Instagram Clone",
      home: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Row(
            children: [
              const Image(
                image: AssetImage("assets/Instagram_logo.png"),
                width: 100,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send),
                color: Colors.black,
              )
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black26,
          onTap: navigateToAnotherTap,
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add Post"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: "Notifications"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
