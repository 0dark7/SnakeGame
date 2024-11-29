import 'dart:async';
import 'dart:ffi';
import 'dart:math';
import 'package:ornekler/main_menu_page.dart';
import 'package:flutter/material.dart';


class SnakeGame extends StatefulWidget {

  final double value;
  String name;
  SnakeGame({required this.name,required this.value});

  @override
  State<SnakeGame> createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameField(name: widget.name,value: widget.value),
    );
  }
}

class GameField extends StatefulWidget {

  double value;
  String name;
  GameField({required this.name,required this.value});

  @override
  _GameFieldState createState() => _GameFieldState();
}

enum Direction { up, down, left, right }

class _GameFieldState extends State<GameField> {

// Değerler
  bool _isAlive = true;
  int length = 4;
  Direction _direction = Direction.up;
  List<Offset> _positions = [];
  double? height;
  double? width;
  Timer? timer;
  double speed=4;
  int _score = 0;
  int highscore = 0;
  int best=0;
  Offset? foodPosition;
  Widget food = Container();

  @override
  Widget build(BuildContext context) {
    changeSpeed();
    speed=widget.value;

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.yellow[700],
        body: _isAlive
            ? Stack(
                children: [
                  Stack(
                    children: snakePieces(),
                  ),
                  score(),
                  player(),
                  playern(),
                  hscore(),
                  hscores(),
                  hsdis(),
                  food,
                  gamePad(),
                ],
              )
            : onEnd());
  }

// Yılan Yandığında
  Widget onEnd() {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Spacer(
            flex: 4,
          ),
          Text(
            "Game Over",
            style: TextStyle(
                color: Color(0xFF692765),
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
          Spacer(
            flex: 2,
          ),
          Text(
            "Well Done!",
            style: TextStyle(
                color: Color(0xFF0a5369),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          Spacer(
            flex: 1,
          ),
          Text(
            widget.name,
            style: TextStyle(
                color: Colors.lightGreen[900],
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          Spacer(
            flex: 1,
          ),
          Text("Your Score is $_score",
              style: TextStyle(
                  color: Color(0xFF0a5369),
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          Spacer(
            flex: 2,
          ),
          TextButton(
            child: Text("Restart Game",
                style: TextStyle(
                    color: Color(0xFF7d581b),
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              setState(() {
                _score = 0;
                speed = widget.value;
                length = 4;
                _positions = [];
                _isAlive = true;
              });
            },
          ),
          TextButton(
            child: Text("Back to Main Menu",
                style: TextStyle(
                    color: Color(0xFF7d581b),
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MainMenuPage(name: widget.name, value:widget.value)));
              setState(() {});
            },
          ),
          Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }

// Kontrol
  checkAlive() {
    for (int i = 1; i < _positions.length; i++) {
      if (_positions[i] == _positions[0]) {
        _isAlive = false;
      }
    }
  }

// Hareketi Sağlayan Yön Tuşları
  Widget gamePad() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: width! / 2,
        width: width! / 2,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                  onPressed: () {
                    if (_direction != Direction.up) _direction = Direction.down;
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 35,
                  )),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: IconButton(
                  onPressed: () {
                    if (_direction != Direction.down) _direction = Direction.up;
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_up,
                    size: 35,
                  )),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {
                    if (_direction != Direction.left)
                      _direction = Direction.right;
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                    size: 35,
                  )),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: () {
                    if (_direction != Direction.right)
                      _direction = Direction.left;
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                    size: 35,
                  )),
            ),
          ],
        ),
      ),
    );
  }

// Skor
  Positioned score() => Positioned(
      top: 40,
      right: 30,
      child:
          Text("Score: $_score ", style: TextStyle(color: Color(0xFF0a5369), fontSize: 22)));

  //OyuncuAdi
  Positioned playern() => Positioned(
      top: 40,
      left: 85,
      child:
      Text(widget.name, style: TextStyle(color: Colors.lightGreen[900], fontSize: 22)));

  Positioned player() => Positioned(
      top: 40,
      left: 15,
      child:
      Text("Player:", style: TextStyle(color: Colors.black, fontSize: 22)));

  hscore() {
    if(highscore<_score){
      highscore=_score;
    }
    return Container(width: 0.0, height: 0.0);
  }
  Positioned hscores() => Positioned(
      top: 70,
      right: 35,
      child:
      Text("$highscore", style: TextStyle(color: Colors.black, fontSize: 22)));

  Positioned hsdis() => Positioned(
      top: 70,
      right: 70,
      child:
      Text("Best:", style: TextStyle(color: Colors.black, fontSize: 22)));



// Hız
  changeSpeed() {
    if (timer != null) if (timer!.isActive) timer!.cancel();
    timer = Timer.periodic(Duration(milliseconds: 500 ~/ widget.value), (timer) {
      setState(() {});
    });
  }

// Yılan Bölümleri
  List<Piece> snakePieces() {
    List<Piece> pieces = [];
    if (_isAlive) {
      setState(() {
        draw();
        foodDraw();
      });
    }
    for (int i = 0; i < _positions.length; i++) {
      pieces.add(Piece(
          size: 15,
          posX: _positions[i].dx,
          posY: _positions[i].dy,
          color: Color(0xFF2E7D32)));
    }
    checkAlive();
    return pieces;
  }

// Yem
  foodDraw() {
    if (foodPosition == null) foodPosition = getRandomPositionWithinScreen();
    food = Piece(
        color: Colors.black,
        posX: foodPosition!.dx,
        posY: foodPosition!.dy,
        size: 15);
    if (foodPosition! <= (_positions[0] + Offset(10, 10)) &&
        foodPosition! >= (_positions[0] - Offset(10, 10))) {
      _score += 10;
      length += 1;
      foodPosition = getRandomPositionWithinScreen();
      speed += 0.15;
    }
  }

// Tasarım
  draw() {
    if (_positions.length == 0) {
      _positions.add(getRandomPositionWithinScreen());
    }
    while (length > _positions.length) {
      _positions.add(_positions[_positions.length - 1]);
    }
    for (int i = _positions.length - 1; i > 0; i--) {
      _positions[i] = _positions[i - 1];
    }
    _positions[0] = checkBorder(_positions[0]);
    _positions[0] = getNextPosition(_positions[0]);
  }

// Yönlendirme
  Offset getNextPosition(Offset position) {
    Offset nextPosition = Offset(5, 6);
    if (_direction == Direction.up) nextPosition = position - Offset(0, 15);
    if (_direction == Direction.down) nextPosition = position + Offset(0, 15);
    if (_direction == Direction.right) nextPosition = position + Offset(15, 0);
    if (_direction == Direction.left) nextPosition = position - Offset(15, 0);

    return nextPosition;
  }

// Çerçeve Sınırları
  checkBorder(Offset position) {
    if (position.dy > height!) position = Offset(position.dx, 0);
    if (position.dy < 0) position = Offset(position.dx, height!);
    if (position.dx > width!) position = Offset(0, position.dy);
    if (position.dx < 0) position = Offset(width!, position.dy);
    return position;
  }

// Rastgele Konum
  Offset getRandomPositionWithinScreen() {
    Random rand = Random();
    double x = rand.nextInt(width!.toInt()).toDouble();
    double y = rand.nextInt(height!.toInt()).toDouble();
    return Offset(x, y) - Offset(15, 15);
  }
}

// Parça
class Piece extends StatelessWidget {
  double size;
  double posX;
  double posY;
  Color color;
  Piece(
      {Key? key,
      required this.size,
      required this.posX,
      required this.posY,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: posY,
      left: posX,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}