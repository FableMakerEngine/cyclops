package core;

import hxd.Key;
import hxd.res.DefaultFont;
import h2d.Console;
import h2d.Interactive;

class Scene extends h2d.Scene {
  public var interaction: Interactive;
  @:isVar
  public var game(get, set): Game = Game.instance;
  public var inteeraction: Interactive;
  public var console: Console;
  public var touchInput: TouchInput;

  public function new() {
    super();
    interaction = new Interactive(width, height, this);
    interaction.onClick = onClick;
    interaction.onFocus = onFocus;
    interaction.onFocusLost = onFocusLost;
    interaction.onKeyDown = onKeyDown;
    interaction.onKeyUp = onKeyUp;
    interaction.cursor = null;
    touchInput = new TouchInput(this);
  }

  public function set_game(game: Game) {
    this.game = game;
    return game;
  }

  public function get_game(): Game {
    return game;
  }

  public function setupConsole() {
    if (!Utils.isConsleEnabled()) {
      return;
    }

    var consoleFont = DefaultFont.get().clone();
    console = new Console(consoleFont, this);

    console.addCommand('version', 'Get System Data', [], () -> {
      console.log(Utils.getVersion());
    });

    console.addCommand('platform', 'Get platform the game is running on', [], () -> {
      console.log(Utils.getPlatform());
    });

    console.addCommand('gameName', 'Get name of the game', [], () -> {
      console.log(Utils.getSystemData().name);
    });

    #if debug
    console.show();
    console.log("Game ready!");
    #end
  }

  public function init(): Void {
    setupConsole();
  }

  public function update(dt: Float): Void {
    updateConsole();
  }

  public function updateConsole() {
    if (Key.isPressed(Key.QWERTY_TILDE)) {
      if (console.isActive()) {
        console.hide();
      } else {
        console.runCommand('cls');
        console.log('Console ready');
        console.show();
      }
    }
  }

  public override function dispose(): Void {}

  public function onResize() {}

  public function onClick(event: hxd.Event) {}

  public function onFocus(event: hxd.Event) {}

  public function onFocusLost(event: hxd.Event) {}

  public function onKeyDown(event: hxd.Event) {}

  public function onKeyUp(event: hxd.Event) {}
}
