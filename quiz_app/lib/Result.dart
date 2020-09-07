import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int final_score;
  final Function resetHandler;

  Result(this.final_score, this.resetHandler);

  String get resultPharse {
    String resultText;
    if (final_score < 15)
      resultText = 'You are awesome and inncocent';
    else if (final_score <= 20)
      resultText = 'You are likelable!';
    else if (final_score <= 25)
      resultText = 'You are genius';
    else
      resultText = 'you are Strange?!!';

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPharse,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            textColor: Colors.blue,
            child: Text('Reset Quiz?'),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
