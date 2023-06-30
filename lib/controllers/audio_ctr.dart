import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

import '../models/enums.dart';

class AudioCtr extends GetxController {
  AudioPlayer audioPlayer = AudioPlayer();

  void _playCorrectAudio() {
    audioPlayer.play(AssetSource("audio/correct.mp3"));
  }

  void _playWrongAudio() {
    audioPlayer.play(AssetSource("audio/wrong.mp3"));
  }

  void playAudio(AudioType audioType) {
    if (audioType == AudioType.correct) {
      _playCorrectAudio();
    } else {
      _playWrongAudio();
    }
  }
}
