import 'package:flutter/material.dart';
import 'screens/home_page.dart';
void main(){
  return runApp(MyApp());  
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(backgroundColor: Colors.black,
      textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.amber)),
      appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(255, 63, 62, 58),
      centerTitle: true)
      ),
      home: HomePage(),
    );
  }
}


