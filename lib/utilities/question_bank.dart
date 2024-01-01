import 'package:flutter/material.dart';

import '../model/question_model.dart';

class QuestionBank {
  int _questionNumber = 0;
  int _totalScore = 0;
  final List<Icon> _scoreKeeper = [];

  final Icon _rightIndicator = const Icon(
    Icons.check,
    color: Colors.green,
  );
  final Icon _wrongIndicator = const Icon(
    Icons.close,
    color: Colors.red,
  );

  final List<QuesitonModel> _questionBank = [
    QuesitonModel(
      question: 'Some cats are actually allergic to humans',
      answer: true,
    ),
    QuesitonModel(
      question: 'You can lead a cow down stairs but not up stairs.',
      answer: false,
    ),
    QuesitonModel(
      question: 'Approximately one quarter of human bones are in the feet.',
      answer: true,
    ),
    QuesitonModel(
      question: 'A slug\'s blood is green.',
      answer: true,
    ),
    QuesitonModel(
      question: 'Buzz Aldrin\'s mother\'s maiden name was "Moon".',
      answer: true,
    ),
    QuesitonModel(
      question: 'It is illegal to pee in the Ocean in Portugal.',
      answer: true,
    ),
    QuesitonModel(
      question:
          'No piece of square dry paper can be folded in half more than 7 times.',
      answer: false,
    ),
    QuesitonModel(
      question:
          'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
      answer: true,
    ),
    QuesitonModel(
      question:
          'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
      answer: false,
    ),
    QuesitonModel(
      question:
          'The total surface area of two human lungs is approximately 70 square metres.',
      answer: true,
    ),
    QuesitonModel(
      question: 'Google was originally called "Backrub".',
      answer: true,
    ),
    QuesitonModel(
      question:
          'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
      answer: true,
    ),
    QuesitonModel(
      question:
          'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
      answer: true,
    ),
  ];

  void nextQuestion({required bool chosenAnswer}) {
    // Check if the answer is correct
    if (chosenAnswer == _questionBank[_questionNumber].answer) {
      debugPrint('right answer');
      _totalScore++;
      _scoreKeeper.add(_rightIndicator);
      _nextQuestion();
    } else {
      debugPrint('wrong answer');
      _scoreKeeper.add(_wrongIndicator);
      _nextQuestion();
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].question;
  }

  List<QuesitonModel> getQuestionBank() {
    return _questionBank;
  }

  void _nextQuestion() {
    // - 1 Because the questions bank begins at index 0
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  List<Icon> getScoreKeeper() {
    return _scoreKeeper;
  }

  int getQuestionNumber() {
    return _questionNumber;
  }

  void resetGame() {
    _questionNumber = 0;
    _scoreKeeper.clear();
    _totalScore = 0;
  }

  int getScore() {
    return _totalScore;
  }
}
