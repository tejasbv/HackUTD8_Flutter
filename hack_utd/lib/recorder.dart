//import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:microphone/microphone.dart';

enum AudioState { recording, stop, play, original }

const veryDarkBlue = Color(0xff172133);
const kindaDarkBlue = Color(0xff202641);

class RecordingScreen extends StatefulWidget {
  @override
  _RecordingScreenState createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  bool enablebutton = false;
  AudioState audioState = AudioState.original;
  final microphoneRecorder = MicrophoneRecorder()..init();
  AudioPlayer audioPlayer = AudioPlayer();

  void handleAudioState(AudioState state) {
    setState(() {
      if (audioState == AudioState.original) {
        // Starts recording
        audioState = AudioState.recording;
        microphoneRecorder.start();
        // Finished recording
      } else if (audioState == AudioState.recording) {
        audioState = AudioState.play;
        microphoneRecorder.stop();
        enablebutton = true;
        // Play recorded audio
      } else if (audioState == AudioState.play) {
        audioState = AudioState.stop;
        print(microphoneRecorder.value.recording!.url);
        audioPlayer
            .setUrl(microphoneRecorder.value.recording!.url)
            .then((_) => {audioPlayer.play()});
        // Stop recorded audio
      } else if (audioState == AudioState.stop) {
        audioState = AudioState.play;
        audioPlayer.stop();
      }
    });
  }

  submitData() async {
    var response = http.post(Uri.http("192.168.114.113:3000", "image_upload"),
        body: {"4694861197-DL": microphoneRecorder.value.recording!.url});
    //var body = response.body;
    print("called");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Microphone Flutter Web',
      home: Scaffold(
        backgroundColor: veryDarkBlue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: handleAudioColour(),
                    ),
                    child: RawMaterialButton(
                      fillColor: Colors.white,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(30),
                      onPressed: () => handleAudioState(audioState),
                      child: getIcon(audioState),
                    ),
                  ),
                  SizedBox(width: 20),
                  if (audioState == AudioState.play ||
                      audioState == AudioState.stop)
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kindaDarkBlue,
                      ),
                      child: RawMaterialButton(
                        fillColor: Colors.white,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(30),
                        onPressed: () => setState(() {
                          audioState = AudioState.original;
                        }),
                        child: const Icon(Icons.replay, size: 50),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: enablebutton ? submitData() : null,
                child: const Center(child: Text("upload"))),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed:
                    !enablebutton ? () => {Navigator.pop(context)} : null,
                child: const Center(child: Text("skip")))
          ],
        ),
      ),
    );
  }

  Color handleAudioColour() {
    if (audioState == AudioState.recording) {
      return Colors.deepOrangeAccent.shade700.withOpacity(0.5);
    } else if (audioState == AudioState.stop) {
      return Colors.green.shade900;
    } else {
      return kindaDarkBlue;
    }
  }

  Icon getIcon(AudioState state) {
    switch (state) {
      case AudioState.play:
        return const Icon(Icons.play_arrow, size: 50);
      case AudioState.stop:
        return const Icon(Icons.stop, size: 50);
      case AudioState.recording:
        return const Icon(Icons.mic, color: Colors.redAccent, size: 50);
      default:
        return const Icon(Icons.mic, size: 50);
    }
  }
}
