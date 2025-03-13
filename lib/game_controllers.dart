import 'dart:math';
import 'package:get/get.dart';

class GameChoice extends GetxController {
  var userChoice = ''.obs;
  var computerChoice = ''.obs;
  var result = ''.obs;

  final List<String> choices = ['Rock', 'Paper', 'Scissors'];

  void playGame(String userSelection) {
    userChoice.value = userSelection;
    computerChoice.value = choices[Random().nextInt(choices.length)];

    result.value = _determineWinner(userChoice.value, computerChoice.value);
  }

  String _determineWinner(String user, String computer) {
    if (user == computer) return "It's a Draw!";
    if ((user == 'Rock' && computer == 'Scissors') ||
        (user == 'Paper' && computer == 'Rock') ||
        (user == 'Scissors' && computer == 'Paper')) {
      return "You Win!";
    } else {
      return "You Lose!";
    }
  }
}
