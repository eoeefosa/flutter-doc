import 'package:flutter/material.dart';

class QuizScorer extends ChangeNotifier {
  int _score = 0;
  int _lives = 3;
  int get score => _score;
  int get live => _lives;

  bool checkAnswer(String userAnswer, String correctAnswer) {
    if (userAnswer.toLowerCase() == correctAnswer.toLowerCase()) {
      _score++;
      return true;
    } else {
      _lives--;
      return false;
    }
  }

  void resetScoreAndLives() {
    _score = 0;
    _lives = 3;
  }
}
