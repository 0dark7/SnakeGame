import 'package:flutter/material.dart';
import 'package:ornekler/gameover_page.dart';

class GamePlayPage extends StatefulWidget {
  const GamePlayPage({Key? key}) : super(key: key);

  @override
  State<GamePlayPage> createState() => _GamePlayPageState();
}

class _GamePlayPageState extends State<GamePlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Snake Game ( Gameplay )'),
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
                Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 10,
                      right: 10,
                    )),
                const Text(
                  'Nickname:              ',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  '                Score:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.green[600],
              height: 370,
              width: 370,
              padding: (EdgeInsets.only(
                top: 235,
                left: 160,
                right: 10,
              )),
              child: Text(
                "• ﹋﹋",
                style: TextStyle(
                  fontSize: 50.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 110,
                top: 1,
                right: 130,
              ),
              child: IconButton(
                onPressed: () {},
                splashColor: Colors.black,
                icon: const Icon(
                  Icons.arrow_circle_up_outlined,
                  size: 70.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  splashColor: Colors.black,
                  icon: Icon(
                    Icons.arrow_circle_left_outlined,
                    size: 70.0,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>GameOverPage()));
                  },
                  splashColor: Colors.black,
                  icon: Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 70.0,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 110,
                top: 1,
                right: 130,
              ),
              child: IconButton(
                onPressed: () {},
                splashColor: Colors.black,
                icon: const Icon(
                  Icons.arrow_circle_down_outlined,
                  size: 70.0,
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

