package sample;

import hxd.File;
import h3d.mat.Texture;
import h2d.col.Point;
import cyclops.Sprite;

class TestScene extends cyclops.Scene {
  public var testText: h2d.Text;
  public var sprite: cyclops.Sprite;

  private var isRotatingLeft: Bool = false;

  public function new() {
    super();
    testText = createText('Hello World!', 42);
    testText.x = width / 2;
    testText.y = height / 2 - testText.textHeight / 2;
    testText.textAlign = h2d.Text.Align.Center;
    add(testText, 1);
    createRectSprite();
    createLogo();
  }

  public function createLogo() {
    var data = File.getBytes("res/img/logoSmall.png");
    var lgooRes = hxd.res.Any.fromBytes('img/logoSmall.png', data);
    var rectTile = lgooRes.toTile();
    sprite = new Sprite(width / 2, height / 2, rectTile);
    sprite.origin = new Point(0.5, 0.5);
    add(sprite, 0);
  }

  public function createRectSprite() {
    var rectTile = h2d.Tile.fromColor(0xFF0000, 100, 100);
    sprite = new Sprite(width / 2, height / 2, rectTile, true);
    sprite.interaction.onClick = (e: hxd.Event) -> {
      trace("clicked");
    };
    sprite.origin = new Point(0.5, 0.5);
    add(sprite, 0);
  }

  public function createText(title: String, size: Int): h2d.Text {
    var font = hxd.res.DefaultFont.get().clone();
    font.resizeTo(size);

    var gameText = new h2d.Text(font, this);
    gameText.text = title;

    return gameText;
  }

  public override function init() {
    trace('Test Scene Ready!');
  }

  public override function onResize() {
    testText.x = width / 2;
    testText.y = height / 2 - testText.textHeight / 2;
  }

  public override function update(dt: Float) {
    sprite.rotate(0.2 * dt);
    if (testText != null) {
      if (isRotatingLeft) {
        testText.rotate(0.2 * dt);
      } else {
        testText.rotation -= 0.2 * dt;
      }
      if (testText.rotation >= 0.5) {
        isRotatingLeft = false;
      }
      if (testText.rotation <= -0.5) {
        isRotatingLeft = true;
      }
    }
  }
}
