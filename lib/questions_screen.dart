import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:imersao_flutter/question.dart';
import 'package:imersao_flutter/score_screen.dart';

class TriviaScreen extends StatefulWidget {
  @override
  _TriviaScreenState createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen> {
  int answer = 0;
  int score = 0;
  int index = 0;
  Color color =  Colors.white;
  Color correct = Colors.white;
  Color incorrect = Colors.white;
  List<Question> questionsList = Question.getQuestionList();

  void verifyResponse() {
    if (answer == questionsList[index].answer) {
      score++;
      color = correct;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:Center(
        child:  Image(
          image: AssetImage('lib/assets/Icon.png'),
        ),),
        backgroundColor: Color(0xff374952),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(32, 56, 32, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  questionsList[index].questionText,
                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(32, 10, 32, 10),
                  decoration: BoxDecoration(
                    color: incorrect,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(1, 3),
                      ),
                    ],
                  ),
                  child: RadioListTile(
                    activeColor:Color(0xffDA0175),
                    value: 1,
                    groupValue: answer,
                    title: Text(questionsList[index].option1),
                    onChanged: (int value) {
                      answer = value;
                      incorrect= Color.fromARGB(51, 224, 92, 92,);
                      correct=Color.fromARGB(191, 92, 224, 131,);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(32, 10, 32, 10),
                  decoration: BoxDecoration(
                    color: correct,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(1, 3),
                      ),
                    ],
                  ),
                  child: RadioListTile(
                    activeColor:Color(0xffDA0175),
                    value: 2,
                    groupValue: answer,
                    title: Text(questionsList[index].option2),
                    onChanged: (int value) {
                      setState(() {
                        answer = value;
                        correct=Color.fromARGB(191, 92, 224, 131,);
                        incorrect= Color.fromARGB(51, 224, 92, 92,);
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(32, 10, 32, 10),
                  decoration: BoxDecoration(
                    color: incorrect,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(1, 3),
                      ),
                    ],
                  ),
                  child: RadioListTile(
                    activeColor:Color(0xffDA0175),
                    value: 3,
                    groupValue: answer,
                    title: Text(questionsList[index].option3),
                    onChanged: (int value) {
                      setState(() {
                        answer = value;
                        incorrect= Color.fromARGB(51, 224, 92, 92,);
                        correct=Color.fromARGB(191, 92, 224, 131,);
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(32, 10, 32, 10),
                  decoration: BoxDecoration(
                    color: incorrect,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(1, 3),
                      ),
                    ],
                  ),
                  child: RadioListTile(
                    activeColor:Color(0xffDA0175),
                    value: 4,
                    groupValue: answer,
                    title: Text(questionsList[index].option4),
                    onChanged: (int value) {
                      setState(() {
                        answer = value;
                        incorrect= Color.fromARGB(51, 224, 92, 92,);
                        correct= Color.fromARGB(191, 92, 224, 131,);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 87,
            decoration: BoxDecoration(
              color: color,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, -1,),
                ),
              ],
            ),
            child: Center(
              child: FlatButton(
                onPressed: () {
                  verifyResponse();
                  if (index < questionsList.length - 1) {
                    setState(() {
                      index = index + 1;
                      answer = 0;
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScoreScreen(result:score,maximum:questionsList.length)),
                    );
                  }
                },
                child: Text('>>',
                    style: TextStyle(
                      fontSize: 16,
                    )),
                color: Color(0xffDA0175),
                textColor: Color(0xffF7F7F7),
                padding: EdgeInsets.fromLTRB(60, 11, 60, 11),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
