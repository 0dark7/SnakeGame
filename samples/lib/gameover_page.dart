import 'package:flutter/material.dart';
import 'package:ornekler/gameplay_page.dart';

class GameOverPage extends StatelessWidget {
  const GameOverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Snake Game ( Game Over ! )'),
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
                Padding(padding: EdgeInsets.only(top: 250, left: 70)),
                const Text(
                  'GAME OVER !',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 7,
                top: 17,
                right: 7,
              ),
              child: Text(
                "Nickname ──── ? Point",
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  left: 250,
                  top: 150,
                  right: 10,
                ),
                child: GestureDetector(
                  child: Text(
                    "↻",
                    style: TextStyle(
                      fontSize: 55.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => GamePlayPage()));
                  },
                )),
            Padding(
                padding: const EdgeInsets.only(
                  left: 250,
                  right: 10,
                ),
                child: InkWell(
                  child: Text(
                    "Try Again",
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => GamePlayPage()));
                  },
                )
            ),
          ],
        ),
      ),
      backgroundColor: Colors.yellow[700],
    );
  }
}
