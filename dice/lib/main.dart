// ignore_for_file: use_key_in_widget_constructors

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int player1Choice = 1;
  int player2Choice = 1;
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Oooh Baby"),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(196, 0, 64, 128),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Dice Game",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )),
          backgroundColor: const Color.fromARGB(196, 0, 64, 128),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "please roll the dice",
                style: TextStyle(
                    fontFamily: "Oooh Baby",
                    fontSize: 30.0,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(196, 153, 255, 235)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage("assets/$player1Choice.png")),
                    const SizedBox(
                      width: 0,
                    ),
                    Image(image: AssetImage("assets/$player2Choice.png")),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("player 1 score:",
                          style: TextStyle(
                              fontSize: 25.0,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(196, 153, 255, 235))),
                      Text(
                        "$player1Score",
                        style: const TextStyle(
                            fontSize: 25.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(196, 153, 255, 235)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("player 2 score:",
                          style: TextStyle(
                              fontSize: 25.0,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(196, 153, 255, 235))),
                      Text(
                        "$player2Score",
                        style: const TextStyle(
                            fontSize: 25.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(196, 153, 255, 235)),
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    player1Choice = 1;
                    player2Choice = 1;
                    player1Score = 0;
                    player2Score = 0;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(
                      196, 153, 255, 235), // Background color
                ),
                child: const Text(
                  "RESET",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(196, 153, 255, 235),
          foregroundColor: Colors.black,
          onPressed: () {
            setState(() {
              player1Choice = Random().nextInt(5) + 1;
              player2Choice = Random().nextInt(5) + 1;
            });
            if (player1Choice > player2Choice) {
              setState(() {
                player1Score++;
              });
            } else if (player1Choice < player2Choice) {
              setState(() {
                player2Score++;
              });
            } else {
              player1Score++;
              player2Score++;
            }
          },
          splashColor: Colors.amberAccent,
          child: const Icon(Icons.casino),
        ),
      ),
    );
  }
}
