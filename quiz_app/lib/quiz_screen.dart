import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/congrats_screen.dart';
import 'package:quiz_app/main.dart';
import 'package:vibration/vibration.dart';
import 'package:audioplayers/audioplayers.dart';

class QuizApp extends StatefulWidget {
  final audio;
  final vibration;
  QuizApp({super.key, required this.audio, required this.vibration});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Map> questions = [
    {
      "question": "What is Flutter?",
      "options": [
        "a programming language",
        "an open-source UI toolkit",
        "an operating system",
        "a DBMS toolkit"
      ],
      "correctIndex": 1
    },
    {
      "question": "Who developed the Flutter Framework and continues to maintain it today?",
      "options": [
        " Facebook",
        "Microsoft",
        "Google",
        " Oracle"
      ],
      "correctIndex": 2
    },
    {
      "question": "Which programming language is used to build Flutter applications?",
      "options": [
        "Kotlin",
        "Go",
        "Java",
        "Dart",
      ],
      "correctIndex": 3
    },
    {
      "question": "What language is Flutter's rendering engine primarily written in?",
      "options": [
        "Kotlin",
        "C++",
        "Dart",
        "Java"
      ],
      "correctIndex": 1
    },
    {
      "question": " A widget that allows us to refresh the screen is called a _____.",
      "options": [
        "Stateful widget",
        "Stateless widget",
        "Statebuild widget",
        "All of the above"
      ],
      "correctIndex": 0
    },
  ];

  int questionCout = 0;
  int selectedOption = -1;
  int correctCount = 0;

  MaterialStateProperty<Color?> checkAnswer(int buttonIndex) {
    if (selectedOption != -1) {
      if (buttonIndex == questions[questionCout]["correctIndex"]) {
        if (selectedOption == questions[questionCout]["correctIndex"] && buttonIndex == selectedOption) {
          if (widget.vibration == true) {
            Vibration.vibrate(duration: 100, amplitude: 100);
          }
          if (widget.audio == true) {
            AudioPlayer().play(AssetSource("audio/correctAnswer.mp3"));
          }

          return const MaterialStatePropertyAll(Colors.green);
        }
        return const MaterialStatePropertyAll(Colors.green);
      } else if (buttonIndex == selectedOption) {
        if (widget.vibration == true) {
          Vibration.vibrate(duration: 500, amplitude: 500);
        }

        if (widget.audio == true) {
          AudioPlayer().play(AssetSource("audio/wrongAnswer.mp3"), volume: 0.3);
        }

        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  void checkValidation() {
    setState(() {
      if (selectedOption == questions[questionCout]["correctIndex"]) {
        correctCount++;
      }
    });
  }

  void increment() {
    setState(() {
      questionCout++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz App"), centerTitle: true),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(color: Color.fromRGBO(127, 109, 243, 0.678), borderRadius: BorderRadius.circular(20), boxShadow: [
                BoxShadow(color: Color.fromRGBO(127, 109, 243, 0.509), offset: Offset(0, 0), blurRadius: 7, blurStyle: BlurStyle.normal, spreadRadius: 7),
              ]),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Question: ${questionCout + 1} / ${questions.length}",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("${questionCout + 1}. ${questions[questionCout]["question"]}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: checkAnswer(0),
                        shadowColor: MaterialStatePropertyAll(Color.fromRGBO(127, 109, 243, 0.909)),
                        elevation: MaterialStatePropertyAll(10),
                      ),
                      onPressed: () {
                        if (selectedOption == -1) {
                          setState(() {
                            selectedOption = 0;
                          });
                        }
                      },
                      child: Text("A. ${questions[questionCout]["options"][0]}"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 350,
                    child: ElevatedButton(
                        style: ButtonStyle(backgroundColor: checkAnswer(1), shadowColor: MaterialStatePropertyAll(Color.fromRGBO(127, 109, 243, 0.909)), elevation: MaterialStatePropertyAll(10)),
                        onPressed: () {
                          if (selectedOption == -1) {
                            setState(() {
                              selectedOption = 1;
                            });
                          }
                        },
                        child: Text(
                          "B. ${questions[questionCout]["options"][1]}",
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 350,
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: checkAnswer(2), shadowColor: MaterialStatePropertyAll(Color.fromRGBO(127, 109, 243, 0.909)), elevation: MaterialStatePropertyAll(10)),
                      onPressed: () {
                        if (selectedOption == -1) {
                          setState(() {
                            selectedOption = 2;
                          });
                        }
                      },
                      child: Text("C. ${questions[questionCout]["options"][2]}"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 350,
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: checkAnswer(3), shadowColor: MaterialStatePropertyAll(Color.fromRGBO(127, 109, 243, 0.909)), elevation: MaterialStatePropertyAll(10)),
                      onPressed: () {
                        if (selectedOption == -1) {
                          setState(() {
                            selectedOption = 3;
                          });
                        }
                      },
                      child: Text("D. ${questions[questionCout]["options"][3]}"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton.extended(
                  tooltip: "quit test",
                  onPressed: () {
                    if (widget.vibration == true) {
                      Vibration.vibrate(duration: 50, amplitude: 500);
                    }
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              content: Text("Do you really want to quit?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      if (widget.vibration == true) {
                                        Vibration.vibrate(duration: 50, amplitude: 500);
                                      }
                                      Navigator.pop(context, true);
                                    },
                                    child: Text("No")),
                                TextButton(
                                    onPressed: () {
                                      if (widget.vibration == true) {
                                        Vibration.vibrate(duration: 50, amplitude: 500);
                                      }
                                      setState(() {
                                        correctCount = 0;
                                        questionCout = 0;
                                        selectedOption = -1;
                                        Navigator.pop(context, true);
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
                                      });
                                    },
                                    child: Text("Yes"))
                              ],
                            ));
                  },
                  icon: Icon(Icons.exit_to_app),
                  label: Text("Quit"),
                ),
                questionCout + 1 < questions.length
                    ? FloatingActionButton.extended(
                        tooltip: "next question",
                        onPressed: () {
                          if (widget.vibration == true) {
                            Vibration.vibrate(duration: 50, amplitude: 500);
                          }
                          if (selectedOption != -1) {
                            checkValidation();
                            selectedOption = -1;
                            print(correctCount);
                            increment();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Select an answer")));
                          }
                        },
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text("Next", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                      )
                    : FloatingActionButton.extended(
                        tooltip: "submit test",
                        onPressed: () {
                          if (widget.vibration == true) {
                            Vibration.vibrate(duration: 50, amplitude: 500);
                          }
                          if (selectedOption != -1) {
                            checkValidation();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FinalPage(
                                          totalQuestions: questions.length,
                                          vibration: widget.vibration,
                                          audio: widget.audio,
                                          correctCount: correctCount,
                                          questionCout: questionCout,
                                          selectedOption: selectedOption,
                                        )));
                            if (widget.audio == true) {
                              AudioPlayer().play(AssetSource("audio/Completed.mp3"));
                            } else {
                              null;
                            }
                          }
                        },
                        icon: const Icon(Icons.done),
                        label: const Text("Submit"),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
