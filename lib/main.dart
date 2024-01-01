import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/utilities/question_bank.dart';
import 'package:quiz_app_flutter/widgets/alert_dialog.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final QuestionBank _questionBank = QuestionBank();

  void nextQuestion({required bool chosenAnswer}) {
    _questionBank.nextQuestion(chosenAnswer: chosenAnswer);
    setState(() {});

    // -1 because the question index begins at 0
    if (_questionBank.getQuestionNumber() ==
        _questionBank.getQuestionBank().length - 1) {
      CustomAlertDialog().showAlert(
        context: context,
        questionBank: _questionBank,
        onPressed: () {
          _questionBank.resetGame();
          Navigator.pop(context);
          setState(() {});
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                _questionBank.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.green,
                ),
              ),
              onPressed: () => nextQuestion(chosenAnswer: true),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.red,
                ),
              ),
              onPressed: () => nextQuestion(chosenAnswer: false),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: _questionBank.getScoreKeeper(),
          ),
        )
      ],
    );
  }
}
