enum AudioState {
  /**
   * Make an enum called AudioState and give it values to represent 
   * playing, paused and stopped states.
   */
  playing,
  paused,
  stopped,
}

void main() {
  /**
   * Create a constant called audioState and give it an AudioState value. 
   * Write a switch statement that prints a message based on the value.
   */
  const audioState = AudioState.playing;
  switch (audioState) {
    case AudioState.playing:
      print("Audio playing");
      break;
    case AudioState.paused:
      print("Audio paused");
      break;
    case AudioState.stopped:
      print("Audio stopped");
      break;
    default:
      print("no response");
  }
}
