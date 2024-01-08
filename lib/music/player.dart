import 'package:just_audio/just_audio.dart';

class PageManager {
  static const url =
      'https://firebasestorage.googleapis.com/v0/b/portfolio-a90a8.appspot.com/o/background.mp3?alt=media';

  late AudioPlayer _audioPlayer;
  PageManager() {
    _init();
  }

  void _init() async {
    _audioPlayer = AudioPlayer();
    await _audioPlayer.setUrl(url);
    _audioPlayer.setVolume(0.03);
    _audioPlayer.setLoopMode(LoopMode.all);
  }

  void play() {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}
