import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'question': 'What\'s your favourite color?',
      'choices': ['Black', 'Red', 'Yellow', 'Green'],
      'answer': 'Black'
    },
    {
      'question': 'What\'s your favourite animal?',
      'choices': ['Dog', 'Cat', 'Rabbit', 'Monkey'],
      'answer': 'Cat'
    },
  ];

  var _questionIndex = 0;
  var _score = 0;

  void _answerQuestion(selected) {
    final correctAnswer = _questions[_questionIndex]['answer'];
    setState(() {
      if (selected == correctAnswer) _score++;
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(_questions, _answerQuestion, _questionIndex)
              : Result(
                  resetHandler: _resetQuiz,
                  score: _score,
                )),
    );
  }
}
