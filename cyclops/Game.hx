package cyclops;

class Game extends hxd.App {
  public var scene(default, null): Scene;

  @:isVar
  public static var instance(get, null): Game;

  public var onReady(default, set): Game->Void;

  public function new() {
    super();
    instance = this;
  }

  public static function get_instance(): Game {
    if (instance == null) {
      instance = new Game();
    }
    return instance;
  }

  public function set_onReady(value) {
    return onReady = value;
  }

  public override function init() {
    #if (hl && !debug)
    Res.initLocal();
    #else
    Res.initEmbed();
    #end
    if (onReady != null) {
      onReady(this);
    }
  }

  public function changeScene(scene: Scene): Void {
    this.scene = scene;
    this.scene.game = this;

    setScene(scene);
    scene.init();
  }

  private override function onResize(): Void {
    super.onResize();
    if (scene != null) {
      scene.onResize();
    }
  }

  override function update(dt: Float): Void {
    if (scene != null) {
      scene.update(dt);
    }
  }
}
