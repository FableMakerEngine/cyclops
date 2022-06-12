package cyclops;

class Game extends hxd.App {
  public var scene: Scene;

  public function new() {
    super();
  }

  public override function init() {
    trace("Hello World");
    #if (hl && !debug)
    Res.initLocal();
    #else
    Res.initEmbed();
    #end
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
