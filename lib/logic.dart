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
    int score = player == "X" ? 1 : -1;
    scoreBoard[index] = score;

    if ((scoreBoard[0]) == scoreBoard[1] &&
        scoreBoard[1] == scoreBoard[2] &&
        scoreBoard[0] != 0) {
      return true;
    } else if (scoreBoard[3] == scoreBoard[4] &&
        scoreBoard[4] == scoreBoard[5] &&
        scoreBoard[3] != 0) {
      return true;
    } else if (scoreBoard[6] == scoreBoard[7] &&
        scoreBoard[7] == scoreBoard[8] &&
        scoreBoard[6] != 0) {
      return true;
    } else if (scoreBoard[0] == scoreBoard[3] &&
        scoreBoard[3] == scoreBoard[6] &&
        scoreBoard[0] != 0) {
      return true;
    } else if (scoreBoard[1] == scoreBoard[4] &&
        scoreBoard[4] == scoreBoard[7] &&
        scoreBoard[1] != 0) {
      return true;
    } else if (scoreBoard[2] == scoreBoard[5] &&
        scoreBoard[8] == scoreBoard[5] &&
        scoreBoard[2] != 0) {
      return true;
    } else if (scoreBoard[0] == scoreBoard[4] &&
        scoreBoard[4] == scoreBoard[8] &&
        scoreBoard[0] != 0) {
      return true;
    } else if (scoreBoard[2] == scoreBoard[4] &&
        scoreBoard[4] == scoreBoard[6] &&
        scoreBoard[2] != 0) {
      return true;
    } else {
      return false;
    }
  }
}
