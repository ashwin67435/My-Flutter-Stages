import 'package:flutter/material.dart';
import './Quiz.dart';
import './Result.dart';

void main() => runApp(MyApp()); //one exp

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _total_score = 0;
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [{'text':'red','score':5}, {'text':'blue','score':4}, {'text':'green','score':8}, {'text':'violet','score':5}],
    },
    {
      'questionText': 'What\'s your favourite pet?',
      'answers': [{'text':'cat','score':6}, {'text':'Dog','score':4}, {'text':'Snake','score':8}, {'text':'Bear','score':8}],
    },
    {
      'questionText': 'What\'s your favourite childhood hero?',
      'answers': [{'text':'ben10','score':10}, {'text':'Ironman','score':8}, {'text':'heman','score':5}, {'text':'chotabeem','score':5}],
    },
  ];

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _total_score  = 0;
    });
  }

  void _answerQuestion(int score) {
    _total_score += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion)
            : Result(_total_score,_resetQuiz),
      ),
    );
  }
}
