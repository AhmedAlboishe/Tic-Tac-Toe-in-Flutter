import 'package:flutter/material.dart';
import '../components/box.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool equal = false;
  List<List<String>> board = [
    ['', '', ''],
    ['', '', ''],
    ['', '', '']
  ];
  String player = "X";
  String result = '';

  void play(int row, int col) {
    if (board[row][col] == '') {
      setState(() {
        board[row][col] = player;
        checkWin();
        if (result == '') {
          player = player == 'X' ? 'O' : 'X';
        }
      });
    }
  }

  void checkWin() {
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == board[i][1] &&
          board[i][0] == board[i][2] &&
          board[i][0] != '') {
        if (player == "X") {
          result = "X";
        } else {
          result = "O";
        }
        return;
      }
      if (board[0][i] == board[1][i] &&
          board[0][i] == board[2][i] &&
          board[0][i] != '') {
        if (player == "X") {
          result = "X";
        } else {
          result = "O";
        }
        return;
      }
    }
    if (board[0][0] == board[1][1] &&
        board[0][0] == board[2][2] &&
        board[0][0] != '') {
      if (player == "X") {
        result = "X";
      } else {
        result = "O";
      }
      return;
    }
    if (board[0][2] == board[1][1] &&
        board[0][2] == board[2][0] &&
        board[0][2] != '') {
      if (player == "X") {
        result = "X";
      } else {
        result = "O";
      }
      return;
    }

    if (board[0][0] != '' &&
        board[0][1] != '' &&
        board[0][2] != '' &&
        board[1][0] != '' &&
        board[1][1] != '' &&
        board[1][2] != '' &&
        board[2][0] != '' &&
        board[2][1] != '' &&
        board[2][2] != '') {
      equal = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return result == ''
        ? Scaffold(
            backgroundColor: const Color.fromARGB(255, 229, 214, 255),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 50, top: 50),
                    height: 25,
                    width: 150,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(100, 120, 61, 247),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        equal == true ? 'equal' : 'Turn $player to play',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Geologica',
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Box(
                        row: 0,
                        col: 0,
                        onTap: play,
                        player: board[0][0],
                      ),
                      Box(
                        row: 0,
                        col: 1,
                        onTap: play,
                        player: board[0][1],
                      ),
                      Box(
                        row: 0,
                        col: 2,
                        onTap: play,
                        player: board[0][2],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Box(
                        row: 1,
                        col: 0,
                        onTap: play,
                        player: board[1][0],
                      ),
                      Box(
                        row: 1,
                        col: 1,
                        onTap: play,
                        player: board[1][1],
                      ),
                      Box(
                        row: 1,
                        col: 2,
                        onTap: play,
                        player: board[1][2],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Box(
                        row: 2,
                        col: 0,
                        onTap: play,
                        player: board[2][0],
                      ),
                      Box(
                        row: 2,
                        col: 1,
                        onTap: play,
                        player: board[2][1],
                      ),
                      Box(
                        row: 2,
                        col: 2,
                        onTap: play,
                        player: board[2][2],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: const Color(0xff793DF7),
                      child: IconButton(
                        onPressed: () {
                          board = [
                            ['', '', ''],
                            ['', '', ''],
                            ['', '', '']
                          ];
                          player = "X";
                          result = '';
                          equal = false;
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.replay,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : Scaffold(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            body: Container(
              height: screenHeight,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/winer.jpg'),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 380),
                      width: 380,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(167, 120, 61, 247),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "<$result> Win The Game 🎉",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            // backgroundColor: Colors.white,
                            fontFamily: 'Geologica',
                            fontSize: 19,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60, bottom: 33),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: const Color(0xff793DF7),
                        child: IconButton(
                          onPressed: () {
                            board = [
                              ['', '', ''],
                              ['', '', ''],
                              ['', '', '']
                            ];
                            player = "X";
                            result = '';
                            equal = false;
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.replay,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
