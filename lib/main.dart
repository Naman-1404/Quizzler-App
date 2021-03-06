import 'package:flutter/material.dart';
import 'questions.dart';
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
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
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> checkbutton=[];
  int answerno=0;
  List<Questions> questionBank=
  [
    Questions(q:'You can lead a cow down stairs but not up stairs.', a: false),
    Questions(q: 'Approximately one quarter of human bones are in the feet.', a: true),
    Questions(q: 'A slug\'s blood is green.', a: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[answerno].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctans=questionBank[answerno].questionAnswer;
                if(correctans==true)
                {
                  print("Answer is correct");
                }
                else
                {
                  print("answer is wrong");
                }
                setState(() {
                  answerno++;
                });
              },  //The user picked true.
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctans=questionBank[answerno].questionAnswer;
                if(correctans==false)
                {
                  print("Answer is correct");
                }
                else
                {
                  print("answer is wrong");
                }
                setState(() {
                  answerno++;
                });

              },  //The user picked false.
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children:checkbutton,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/

