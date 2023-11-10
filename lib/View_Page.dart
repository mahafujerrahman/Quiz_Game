import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_game/HomePage.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
          child : Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Image.asset("images/q1.png",width: 500),
                SizedBox(height: 30,),
                Text("Welcome to Our Platfrom",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white
                  ),),
                Text("Quiz Game",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white
                  ),
                ),
                SizedBox(height: 10),
                Text("Challenge your knowledge and quick thinking in our quiz game, where every answer brings you closer to victory!",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                  ),),
               SizedBox(height: 60),
                Align(
                    alignment: Alignment.center,
                    child : Container(
                          alignment: Alignment.center,
                          width: size.width -50,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:BorderRadius.circular(0)),
                          child: Text(
                            "High Score :",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black
                            ),
                          ),

                        )
                    ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child : GestureDetector(
                      onTap:() {
                        Navigator.push(context, MaterialPageRoute(builder:(context)=> QuizApp()));
                      },
                      child : Container(
                        margin: EdgeInsets.only(bottom :20),
                        alignment: Alignment.center,
                        width: size.width -50,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:BorderRadius.circular(12)),
                        child: Text(
                          "Start New Game",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black
                          ),
                        ),

                      )
                  ),

                )
              ],
            ),
          ) ,

        )
    );

  }
}