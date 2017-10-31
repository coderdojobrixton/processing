

class Sounds {
  SoundFile ping;
  SoundFile pong;
  SoundFile win;

  Sounds(PApplet application) {
    ping = new SoundFile(application, "ping.wav");
    pong = new SoundFile(application, "pong.wav");
    win = new SoundFile(application, "win.wav");
  }

  void playPing() {
    ping.play();
  }

  void playPong() {
    pong.play();
  }

  void playWin() {
    win.play();
  }
}