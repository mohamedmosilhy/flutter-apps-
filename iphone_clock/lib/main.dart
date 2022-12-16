import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 46, 45, 45),
              centerTitle: true)),
      home: const HomePage(),
    );
  }
}
