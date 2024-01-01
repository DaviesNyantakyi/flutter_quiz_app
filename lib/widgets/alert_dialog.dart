import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/utilities/question_bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CustomAlertDialog {
  Future<bool?> showAlert({
    required BuildContext context,
    required QuestionBank questionBank,
    VoidCallback? onPressed,
  }) {
    int totalQuestions = questionBank.getQuestionBank().length;
    int totalScore = questionBank.getScore();

    Color color = totalScore > totalQuestions / 2 ? Colors.green : Colors.red;
    return Alert(
      context: context,
      title: '$totalScore/$totalQuestions',
      closeIcon: Container(),
      style: AlertStyle(backgroundColor: color),
      onWillPopActive: true,
      buttons: [
        DialogButton(
          onPressed: onPressed,
          color: Colors.white,
          child: const Text(
            'Play Again',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ],
    ).show();
  }
}
