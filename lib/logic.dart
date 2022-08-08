class Player {
  static const x = "X";
  static const o = "O";
  static const empty = "";
}

class GameLogic {
  List<String>? board;
  static List<String>? initGameBoard() =>
      List.generate(9, (index) => Player.empty);

  bool winChecker(String player, int index, List<int> scoreBoard) {
    int row = index ~/ 3; // floor value 8~/3=2

    int col = index % 3;
    int score = player == "X" ? 1 : -1;

    scoreBoard[row] += score;
    scoreBoard[3 + col] += score;
    if (row == col) scoreBoard[2 * 3] += score;
    if (3 - 1 - col == row) scoreBoard[2 * 3 + 1] += score;

    if (scoreBoard.contains(3) || scoreBoard.contains(-3)) {
      return true;
    } else {
      return false;
    }
  }
}
