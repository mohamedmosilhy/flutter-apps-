import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClockTile extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final clock;
  const ClockTile({super.key, required this.clock});

  @override
  State<ClockTile> createState() => _ClockTileState();
}

class _ClockTileState extends State<ClockTile> {
  bool currentValue = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            widget.clock.toString(),
            style: const TextStyle(color: Colors.grey, fontSize: 70),
          ),
          subtitle: const Text(
            "Alarm",
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          trailing: SizedBox(
              width: 60,
              height: 40,
              child: FittedBox(
                fit: BoxFit.fill,
                child: CupertinoSwitch(
                  trackColor: Colors.grey,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      currentValue = !currentValue;
                    });
                  },
                  value: currentValue,
                ),
              )),
        ),
        const Divider(
          color: Colors.grey,
          height: 3,
        )
      ],
    );
  }
}
