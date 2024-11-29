import 'package:flutter/material.dart';
import 'package:ornekler/main_menu_page.dart';
import 'package:ornekler/snake.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  double value = 4;
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Snake Game ( Settings )'),
        titleTextStyle: const TextStyle(
          fontSize: 24.0,
          color: Colors.black,
        ),
        elevation: 5.0,
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.only(top: 190, left: 100)),
                const Text(
                  '⚙️ Settings',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 5,
                top: 25,
                right: 15,
              ),
              child: Text(
                "Snake Speed",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
            Slider(
              min: 2,
              max: 10,
              divisions: 4,
              value: value,
              label: "$value",
              onChanged: (double newValue) {
                setState(() {
                  value = newValue;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 5,
                top: 35,
                right: 5,
              ),
              child: Text(
                "Big Bait",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(1.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      click = !click;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      (click == false)
                          ? Icons.check_box_outline_blank
                          : Icons.check_box,
                      size: 30,
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(
                left: 5,
                top: 45,
                right: 5,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainMenuPage(value: value, name: '')));
                },
                child: Text("Apply Changes"),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.yellow[700],
    );
  }
}