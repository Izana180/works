import 'package:flutter/material.dart';

void main() {
  runApp(const FastestFingerApp());
}

class FastestFingerApp extends StatelessWidget {
  const FastestFingerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '早押し判定機',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PlayerSelectionPage(),
    );
  }
}

//トップページ
class PlayerSelectionPage extends StatefulWidget {
  const PlayerSelectionPage({super.key});

  @override
  PlayerSelectionPageState createState() => PlayerSelectionPageState();
}

class PlayerSelectionPageState extends State<PlayerSelectionPage> {
  int selectedPlayers = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '人数を選択:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            DropdownButton<int>(
              value: selectedPlayers,
              items: [for (var i = 2; i <= 4; i++) i]
                  .map((e) => DropdownMenuItem<int>(
                value: e,
                child: Text('$e Players'),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedPlayers = value!;
                });
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FastestFingerPage(numPlayers: selectedPlayers),
                  ),
                );
              },
              child: const Text('Start Game', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}

//ゲーム画面
class FastestFingerPage extends StatefulWidget {
  final int numPlayers;

  const FastestFingerPage({required this.numPlayers, super.key});

  @override
  FastestFingerPageState createState() => FastestFingerPageState();
}

class FastestFingerPageState extends State<FastestFingerPage> {
  String winner = '';
  bool gameEnded = false;
  int currentQuestion = 1; //今何問目？
  final int totalQuestions = 20; //限定問題数
  late List<int> playerScores;

  @override
  void initState() {
    super.initState();
    playerScores = List.filled(widget.numPlayers, 0);
  }

  void onButtonPressed(String player) {
    if (!gameEnded) {
      setState(() {
        winner = player;
        gameEnded = true;
      });
    }
  }

  //Next
  void resetGame() {
    setState(() {
      winner = '';
      gameEnded = false;
      if (currentQuestion < totalQuestions) {
        currentQuestion++;
      } else {
        currentQuestion = 1;
        playerScores=List.filled(widget.numPlayers,0); //問題数終了でリセット
      }
    });
  }

  void addPointToWinner() {
    if (winner.isNotEmpty) {
      int winnerIndex = int.parse(winner.split(' ').last) - 1;
      setState(() {
        playerScores[winnerIndex]++;
      });
    }
    resetGame();
  }

  Color getPlayerButtonColor(int playerNumber) {
    switch (playerNumber) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.yellow;
      case 4:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  Color getPlayerTextColor(int playerNumber) {
    switch (playerNumber) {
      case 1:
      case 2:
      case 4:
        return Colors.white;
      case 3:
        return Colors.black;
      default:
        return Colors.black;
    }
  }

  List<Widget> buildPlayerButtons() {
    List<Widget> buttons = [];
    for (int i = 1; i <= widget.numPlayers; i++) {
      buttons.add(
        Column(
          children: [
            ElevatedButton(
              onPressed: () => onButtonPressed('Player $i'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: getPlayerButtonColor(i),
              ),
              child: Text(
                'Player $i',
                style: TextStyle(
                  fontSize: 20,
                  color: getPlayerTextColor(i),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text('Score: ${playerScores[i - 1]}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      );
    }
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('早押し判定機'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (winner.isEmpty)
              Text(
                '第$currentQuestion問',
                style: const TextStyle(fontSize: 24),
              )
            else
              Text(
                '$winner',
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 50),
            Wrap(
              spacing: 20.0, // ボタン間の横のスペース
              runSpacing: 20.0, // ボタン間の縦のスペース
              children: buildPlayerButtons(),
            ),
            const SizedBox(height: 50),
            if (gameEnded)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: addPointToWinner,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    ),
                    child: const Text('〇', style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: resetGame,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    ),
                    child: const Text('×', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
