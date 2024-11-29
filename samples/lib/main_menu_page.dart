import 'package:flutter/material.dart';
import 'package:ornekler/gameplay_page.dart';
import 'package:ornekler/high_scores_page.dart';
import 'package:ornekler/how_to_play_page.dart';
import 'settings_page.dart';
import 'package:ornekler/snake.dart';

class MainMenuPage extends StatefulWidget {

  final double value;
  String name;
  MainMenuPage({required this.name,required this.value});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  TextEditingController _name = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Snake Game ( Main Menu )'),
        titleTextStyle: TextStyle(
          fontSize: 24.0,
          color: Colors.black,
        ),
        elevation: 5.0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(top: 190, left: 110,)),
                  const Text(
                    'Yılan Oyunu',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                ),
                child: TextField(
                  controller: _name,
                  maxLines: 1,
                  maxLength: 15,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "Nickname",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SnakeGame(name: _name.text, value: widget.value,)));
                  },
                  icon: const Icon(Icons.play_arrow),
                  iconSize: 35,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HighScoresPage()));
                },
                splashColor: Colors.limeAccent,
                icon: const Icon(
                  Icons.emoji_events,
                  size: 45.0,
                ),
                iconSize: 100.0,
                tooltip: "High Scores",
                padding: const EdgeInsets.only(
                  left: 350,
                  right: 4,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HowToPlayPage()));
                },
                splashColor: Colors.limeAccent,
                icon: const Icon(
                  Icons.question_mark,
                  size: 45.0,
                ),
                iconSize: 100.0,
                tooltip: "How to Play",
                padding: const EdgeInsets.only(
                  left: 350,
                  right: 4,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                },
                splashColor: Colors.limeAccent,
                icon: const Icon(
                  Icons.settings,
                  size: 45.0,
                ),
                iconSize: 100.0,
                tooltip: "Settings",
                padding: const EdgeInsets.only(
                  left: 350,
                  right: 4,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.yellow[700],
    );
  }
}