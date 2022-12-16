import 'package:flutter/material.dart';
import 'package:iphone_clock/screens/alarm_screen.dart';
import 'package:iphone_clock/widgets/add_alarm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.orange,
        currentIndex: index,
        type: BottomNavigationBarType.shifting,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.circle_notifications_outlined),
              label: 'World Clock',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              label: 'alarm',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              label: 'StopWatch',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_rounded),
              backgroundColor: Colors.transparent,
              label: 'Timer'),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.blueGrey,
        title: const Text(
          "Alarm",
          style: TextStyle(color: Colors.white),
        ),
        leading: TextButton(
            onPressed: () {},
            child: const Text(
              "Edit",
              style: TextStyle(color: Colors.orange, fontSize: 20),
            )),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet<dynamic>(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.94,
                      child: const AddAlarm(),
                    );
                  },
                  isScrollControlled: true,
                );
              },
              icon: const Icon(
                Icons.add,
                color: Colors.orange,
                size: 30,
              ))
        ],
      ),
      body: const AlarmScreen(),
    );
  }
}
