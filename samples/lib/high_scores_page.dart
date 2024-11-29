import 'package:flutter/material.dart';

class HighScoresPage extends StatelessWidget {
  const HighScoresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Snake Game ( High Scores )'),
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
                Padding(padding: EdgeInsets.only(top: 190, left: 80)),
                const Text(
                  '🏆 High Scores',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15, top: 17, right: 15,
              ),
              child: Text(
                "1. ",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15, top: 17, right: 15,
              ),
              child: Text(
                "2. Cristiano Ronaldo ─── 450 P",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15, top: 17, right: 15,
              ),
              child: Text(
                "3. Jeff Bezos ────── 450 P",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15, top: 17, right: 15,
              ),
              child: Text(
                "4. Lionel Messi ───── 450 P",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15, top: 17, right: 15,
              ),
              child: Text(
                "5. Elon Musk ────── 450 P",
                style: TextStyle(
                  fontSize: 25.0,
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
