import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'questions.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal,
          title: Text('Quizzler'),
          /*leading: GestureDetector(
            onTap: () {
              print('Gesture detected');
            },
            child: Icon(
              Icons.menu, // add custom icons also
            ),
          ),*/
        ),
        backgroundColor: Colors.black54,
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

AudioCache audioCache = new AudioCache();

class _QuizPageState extends State<QuizPage> {
  int count = 0;
  int text = 0;
  void checkAnswer(bool ansType) {
    if (questionList[count].questionAnswer == ansType) {
      audioCache.play('correct_choice.wav');
      scoreKeep.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else if (questionList[count].questionAnswer != ansType) {
      audioCache.play('wrong_choice.mp3');
      scoreKeep.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
  }

  List<Questions> questionList = [
    Questions(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Questions(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Questions(q: 'A slug\'s blood is green.', a: true),
  ];

  List<Widget> scoreKeep = [
    Card(
      color: Colors.blueAccent.shade100,
      child: Text(
        'ScoreKeeper:',
        style: TextStyle(fontSize: 17),
      ),
    ),
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
                questionList[text].questionText,
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
                setState(() {
                  if (count < 3) {
                    checkAnswer(true);
                    if (text < 2) {
                      text++;
                    }
                    count++;
                  }
                }); //The user picked true.
              },
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
                setState(() {
                  if (count < 3) {
                    checkAnswer(false);
                    if (text < 2) {
                      text++;
                    }
                    count++;
                  }
                });
                //The user picked false.
              },
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: scoreKeep,
          ),
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
