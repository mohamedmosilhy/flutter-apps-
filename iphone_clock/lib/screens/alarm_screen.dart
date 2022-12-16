import 'package:flutter/material.dart';
import 'package:iphone_clock/widgets/clock_list_tile.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  List<ClockTile> clocks = const [
    ClockTile(clock: '00:00'),
    ClockTile(clock: '12:42'),
    ClockTile(clock: '12:42'),
    ClockTile(clock: '12:42'),
    ClockTile(clock: '12:42'),
    ClockTile(clock: '12:42'),
    ClockTile(clock: '12:42'),
    ClockTile(clock: '12:42'),
    ClockTile(clock: '11:32'),
    ClockTile(clock: '01:32'),
    ClockTile(clock: '01:02'),
  ];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SizedBox(
      height: mediaQuery.size.height,
      child: ListView.builder(
        itemBuilder: (conext, index) {
          return Dismissible(
            background: Container(color: Colors.red),
            key: UniqueKey(),
            child: clocks[index],
          );
        },
        itemCount: clocks.length,
      ),
    );
  }
}
