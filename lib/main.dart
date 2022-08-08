import 'package:flutter/material.dart';
import 'package:tictac/logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tic Tac toe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String currentPlay = 'X';
  int count = 0;
  GameLogic game = GameLogic();
  bool gameOver = false;
  String result = '';
  List<int> scoreBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  @override
  void initState() {
    super.initState();
    game.board = GameLogic.initGameBoard();
  }

  @override
  void dispose() {
    super.dispose();
    scoreBoard.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            child: GridView.count(
              padding: const EdgeInsets.all(18),
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: List.generate(9, (index) {
                return InkWell(
                  onTap: gameOver
                      ? null
                      : () {
                          if (game.board![index] == '') {
                            setState(() {
                              game.board![index] = currentPlay;
                              count++;
                              gameOver = game.winChecker(
                                  currentPlay, index, scoreBoard);

                              if (gameOver) {
                                result = "$currentPlay is winner";
                              } else if (!gameOver && count == 9) {
                                result = "Draw";
                                gameOver = true;
                              }
                              if (currentPlay == 'X') {
                                currentPlay = "O";
                              } else {
                                currentPlay = 'X';
                              }
                            });
                          }
                        },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        game.board![index],
                        style: TextStyle(
                            fontSize: 45,
                            color: game.board![index] == 'X'
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Center(
            child: Text(
              result,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                game.board = GameLogic.initGameBoard();
                scoreBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0];
                gameOver = false;
                currentPlay = "X";
                count = 0;
                result = '';
              });
            },
            child: Container(
                height: 50,
                width: 50,
                color: Colors.blue,
                child: const Center(
                  child: Icon(
                    Icons.restart_alt_rounded,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
