import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/quiz_screen.dart';
import 'package:vibration/vibration.dart';

class FinalPage extends StatefulWidget {
  int correctCount;
  int questionCout;
  int selectedOption;
  bool audio;
  bool vibration;
  int totalQuestions;
  FinalPage({super.key, required this.correctCount, required this.questionCout, required this.selectedOption, required this.audio, required this.vibration, required this.totalQuestions});

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(vertical: 80),
            child: Image.asset("assets/images/congratulations.png"),
          ),
          Container(
            height: 340,
            width: double.infinity,
            decoration: BoxDecoration(color: Color.fromRGBO(127, 109, 243, 0.909), borderRadius: BorderRadius.vertical(top: Radius.circular(100))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(127, 109, 243, 0.575),
                    radius: 90,
                    child: CircleAvatar(
                      backgroundColor: Color.fromRGBO(127, 109, 243, 1),
                      radius: 75,
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(88, 72, 194, 0.333),
                        radius: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text("${widget.correctCount}/${widget.totalQuestions}", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white)),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Score", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(shadowColor: MaterialStatePropertyAll(Color.fromRGBO(127, 109, 243, 0.909)), elevation: MaterialStatePropertyAll(10)),
                          onPressed: () {
                            if (widget.vibration == true) {
                              Vibration.vibrate(duration: 50, amplitude: 500);
                            }
                            setState(() {
                              widget.correctCount = 0;
                              widget.questionCout = 0;
                              widget.selectedOption = -1;
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
                            });
                          },
                          child: Row(
                            children: [
                              Icon(Icons.home),
                              const Text("Home"),
                            ],
                          )),
                      ElevatedButton(
                          style: ButtonStyle(shadowColor: MaterialStatePropertyAll(Color.fromRGBO(127, 109, 243, 0.909)), elevation: MaterialStatePropertyAll(10)),
                          onPressed: () {
                            if (widget.vibration == true) {
                              Vibration.vibrate(duration: 50, amplitude: 500);
                            }
                            setState(() {
                              widget.correctCount = 0;
                              widget.questionCout = 0;
                              widget.selectedOption = -1;
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QuizApp(
                                            vibration: widget.vibration,
                                            audio: widget.audio,
                                          )));
                            });
                          },
                          child: Row(
                            children: [
                              Icon(Icons.refresh),
                              const Text("Reset"),
                            ],
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
