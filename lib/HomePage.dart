import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_game/View_Page.dart';
import 'package:quiz_game/model.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  late QuizDataList quizDataList;
  int currentQuestionIndex = 0;
  bool quizCompleted = false;
  int score = 0;

  @override
  void initState() {
    super.initState();
    fetchQuizData();
  }
  Future<void> fetchQuizData() async {
    final Uri uri = Uri.parse('https://herosapp.nyc3.digitaloceanspaces.com/quiz.json');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      setState(() {
        quizDataList = quizDataListFromJson(response.body);
      });
    } else {
    }
  }


  @override
  Widget build(BuildContext context) {
    if (quizDataList == false || quizDataList.questions.isEmpty) {
      return CircularProgressIndicator();}
    if (quizCompleted) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Quiz Completed!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
              SizedBox(height: 15),
              Container(child :
              SizedBox(
                  height:40,
                  width:300,
                  child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                  ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=> ViewPage()));
                  resetQuiz();
                },
                child: Text("Reset Quiz",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),),))
              ),
            ],

          ),
        ),
      );
    }
      return Scaffold(
        appBar: AppBar(
          title: Text("Quiz Game"),backgroundColor: Colors.indigo,
        ),
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Text("Question ${currentQuestionIndex + 1} of 8",
          style: TextStyle(fontSize: 30, color: Colors.blue),
         ),

          Text("Your Current Score : $score "),
          SizedBox(height: 15),
          Image.network(quizDataList.questions[currentQuestionIndex].questionImageUrl ?? '',
              width: 300,alignment: Alignment.center),
          SizedBox(height: 20),
          Text(quizDataList.questions[currentQuestionIndex].question,style: TextStyle(
              fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          ...quizDataList.questions[currentQuestionIndex].answers.toJson().entries.map((entry) {

            final option = entry.key;
            final answer = entry.value;

            return ElevatedButton(
              onPressed: (
                  ) {
                checkAnswer(answer);
              },
              style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                minimumSize: Size(500, 40),
              ),
              child: Text('$option: $answer'),
            );

          }).toList(),
        ],
      ),

    );
  }

  void checkAnswer(String selectedAnswer) {
    final Question currentQuestion = quizDataList.questions[currentQuestionIndex];

    if (selectedAnswer == currentQuestion.correctAnswer) {
     
      setState(() {
        score++; 
      });
    } else {
      
    }

    if (selectedAnswer == currentQuestion.correctAnswer) {
    } else {
    }
    if (currentQuestionIndex < quizDataList.questions.length - 1)
    {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      setState(() {
        quizCompleted = true;
      });
    }
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0; 
      quizCompleted = false;
    });
  }
}

