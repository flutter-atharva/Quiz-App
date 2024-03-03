import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_screen.dart';
import 'package:vibration/vibration.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool audio = true;
  bool vibration = true;

  void toggleAudio() {
    if (audio == true) {
      audio = false;
    } else {
      audio = true;
    }
  }

  void toggleVibration() {
    if (vibration == true) {
      vibration = false;
    } else {
      vibration = true;
    }
  }

  IconButton toggleAudioIcon() {
    if (audio == true) {
      return IconButton(
          tooltip: "Audio",
          color: Colors.deepPurple,
          onPressed: () {
            setState(() {
              toggleAudio();
            });
          },
          icon: Icon(Icons.volume_up));
    } else {
      return IconButton(
        tooltip: "Audio",
          color: Colors.deepPurple,
          onPressed: () {
            setState(() {
              toggleAudio();
            });
          },
          icon: Icon(Icons.volume_off));
    }
  }

  IconButton toggleVibrationIcon() {
    if (vibration == true) {
      Vibration.vibrate(duration: 50, amplitude: 500);
    }
    if (vibration == true) {
      return IconButton(
        
        tooltip: "vibration",
          color: Colors.deepPurple,
          onPressed: () {
            setState(() {
              toggleVibration();
            });
          },
          icon: Icon(Icons.vibration));
    } else {
      return IconButton(
        
        tooltip: "vibration",
          color: Colors.deepPurple,
          onPressed: () {
            setState(() {
              toggleVibration();
            });
          },
          icon: Icon(Icons.phone_android_sharp));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz App",
          style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w500, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // SizedBox(
          //   height: ,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                toggleAudioIcon(),
                SizedBox(width: 5),
                toggleVibrationIcon()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Image.asset(
              "assets/images/welcome_2.avif",
              height: 350,
              width: 350,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(127, 109, 243, 0.909),
              borderRadius: BorderRadius.vertical(top: Radius.circular(100)),
            ),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: SizedBox(
                          height: 70,
                          width: 160,
                          child: ElevatedButton(
                              style: ButtonStyle(shadowColor: MaterialStatePropertyAll(Color.fromRGBO(127, 109, 243, 0.909)), elevation: MaterialStatePropertyAll(10)),
                              onPressed: () {
                                if (vibration == true) {
                                  Vibration.vibrate(duration: 50, amplitude: 100);
                                }
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuizApp(audio: audio, vibration: vibration)));
                              },
                              child: const Text(
                                "Start Quiz",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500
                                ),
                              )
                            )
                      ),
                    )
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
