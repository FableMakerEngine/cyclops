package sample;

class Main {
  public static function main() {
    var game = new cyclops.Game();
    game.onReady = (instance) -> {
      game.changeScene(new TestScene());
    }
  }
}
