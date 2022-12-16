import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:flutter/cupertino.dart';

class AddAlarm extends StatefulWidget {
  const AddAlarm({super.key});

  @override
  State<AddAlarm> createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  int _myVal = 0;
  bool currentValue = false;

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        centerTitle: true,
        title: const Text(
          "Add Alarm",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: TextButton(
          child: const Text(
            "Cancel",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 17.5,
            ),
          ),
          onPressed: () {
            navigator.pop();
          },
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Save",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 17.5,
                ),
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 250,
                child: TimePickerSpinner(
                  is24HourMode: false,
                  normalTextStyle:
                      const TextStyle(fontSize: 24, color: Colors.grey),
                  highlightedTextStyle:
                      const TextStyle(fontSize: 24, color: Colors.white),
                  spacing: 20,
                  itemHeight: 40,
                  isForce2Digits: true,
                  onTimeChange: (time) {
                    setState(() {});
                  },
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 0),
              color: const Color.fromARGB(255, 28, 27, 27),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Repeat',
                          style:
                              TextStyle(color: Colors.grey[200], fontSize: 20),
                        ),
                        DropdownButton(
                            dropdownColor:
                                const Color.fromARGB(255, 31, 31, 31),
                            value: _myVal,
                            items: [
                              DropdownMenuItem(
                                value: 0,
                                child: Text(
                                  'Never',
                                  style: TextStyle(color: Colors.grey[200]),
                                ),
                                onTap: () {},
                              ),
                              DropdownMenuItem(
                                value: 1,
                                child: Text(
                                  'Every Saturday',
                                  style: TextStyle(color: Colors.grey[200]),
                                ),
                                onTap: () {},
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text(
                                  'Every Saturday',
                                  style: TextStyle(color: Colors.grey[200]),
                                ),
                                onTap: () {},
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Text(
                                  'Every Saturday',
                                  style: TextStyle(color: Colors.grey[200]),
                                ),
                                onTap: () {},
                              ),
                              DropdownMenuItem(
                                value: 4,
                                child: Text(
                                  'Every Sunday',
                                  style: TextStyle(color: Colors.grey[200]),
                                ),
                                onTap: () {},
                              ),
                            ],
                            onChanged: (val) {
                              setState(() {
                                _myVal = val as int;
                              });
                            })
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 54, 54, 54),
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Label',
                          style:
                              TextStyle(color: Colors.grey[200], fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 54, 54, 54),
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sound',
                          style:
                              TextStyle(color: Colors.grey[200], fontSize: 20),
                        ),
                        DropdownButton(
                            dropdownColor:
                                const Color.fromARGB(255, 31, 31, 31),
                            value: _myVal,
                            items: [
                              DropdownMenuItem(
                                value: 0,
                                child: Text(
                                  'American Girl',
                                  style: TextStyle(color: Colors.grey[200]),
                                ),
                                onTap: () {},
                              ),
                              DropdownMenuItem(
                                value: 1,
                                child: Text(
                                  'Amongst The Waves',
                                  style: TextStyle(color: Colors.grey[200]),
                                ),
                                onTap: () {},
                              ),
                            ],
                            onChanged: (val) {
                              setState(() {
                                _myVal = val as int;
                              });
                            })
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 54, 54, 54),
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Snooze',
                          style:
                              TextStyle(color: Colors.grey[200], fontSize: 20),
                        ),
                        CupertinoSwitch(
                          trackColor: Colors.grey,
                          activeColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              currentValue = !currentValue;
                            });
                          },
                          value: currentValue,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
