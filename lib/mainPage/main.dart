import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MainApplication extends StatelessWidget {
  const MainApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MainApplicationStateful());
  }
}

class MainApplicationStateful extends StatefulWidget {
  const MainApplicationStateful({Key? key}) : super(key: key);

  @override
  BasicPhraseAppScreen createState() => BasicPhraseAppScreen();
}

class BasicPhraseAppScreen extends State<MainApplicationStateful> {
  AudioPlayer audioPlayer = AudioPlayer();
  static AudioCache player = AudioCache();
  bool alreadyPlaying = false;

  Map<String, String> songsAndTitle = <String, String>{
    'Haide Poli Timișoara': 'Haide Poli Timișoara.mp3',
    'Haide Poli Timișoara(engleză)': 'Come on Poli Timisoara.mp3',
    'Haide Poli Timișoara(germană)': 'Komm schon, Poli Timisoara.mp3 ',
    'Hai la stadion': 'Hai la stadion.mp3',
    'Haide la stadion(engleză)': 'Come to the stadium.mp3',
    'Haide la stadion(germană)': 'Geh ins Stadion.mp3',
    'Inimi de cavaler': 'Inimi de cavaler.mp3',
    'Inimi de cavaler(engleză)': "Knight's heart.mp3",
    'Inimi de cavaler(germană)': 'InimiDeCavaler_ger.mp3',
    'Rapid Giulești': 'Rapid Giulești.mp3',
    'Rapid Giulești(engleză': 'Rapid Giulești_engleza.mp3',
    'Rapid Giulești(germană)': 'Schnelle Giulești.mp3',
    'ambient cmention': 'ambient_c_motion.mp3',
    'Deasupra tuturor': 'noi_din_BANAT.mp3',
    'Suflet de ultras': 'Suflet de ultras.mp3'
  };

  Future<void> playFile(String title) async {
    audioPlayer = await player.play(title);
    alreadyPlaying = true;
  }

  void stopFile() {
    audioPlayer.stop();
    alreadyPlaying = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Basic Phrases'),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: songsAndTitle.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: <Color>[
                  Colors.lightBlueAccent,
                  Colors.blue,
                ],
                stops: <double>[
                  0,
                  0.7,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            width: 10,
            child: Center(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    if (alreadyPlaying) {
                      stopFile();
                    } else {
                      playFile(songsAndTitle.values.elementAt(index));
                    }
                  },
                  child: Text(
                    songsAndTitle.keys.elementAt(index),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
