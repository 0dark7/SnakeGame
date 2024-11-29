import 'package:flutter/material.dart';

class HowToPlayPage extends StatelessWidget {
  const HowToPlayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Snake Game ( How to Play )'),
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
                Padding(padding: EdgeInsets.only(top: 130, left: 75)),
                const Text(
                  '❓ How to Play',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30, right: 230,
              ),
              child: Text(
                "How to Play: ",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 35, top: 1, right: 50,
              ),
              child: Text(
                "Use the arrow keys on the screen to move the snake and try to eat bait which is the appears on the screen randomly.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30, top: 10, right: 160,
              ),
              child: Text(
                "Game Description: ",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 35, top: 1, right: 50,
              ),
              child: Text(
                "You can adjust your snake speed and choose big bait option. ( Normal bait earns you 10 points & Big bait earns you 50 points ). You can pass through the wall and come out the opposite side but if you crash into your snake 💥 the game ends.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10, top: 10, right: 260,
              ),
              child: Text(
                "Credits: ",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 35, top: 15, right: 30,
              ),
              child: Text(
                "Muhammet Emir Cayir",
                style: TextStyle(
                  fontSize: 23.0,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.yellow[700],
    );
  }
}
