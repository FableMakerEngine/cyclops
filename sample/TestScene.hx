package sample;

import cyclops.Bitmap;
import h3d.mat.Texture;
import h2d.col.Point;
import h2d.Tile;
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
  }

  public function createRectSprite() {
    var rect = new Bitmap(Texture.fromColor(0xffbe60));
    sprite = new Sprite(width / 2, height / 2, rect, true);
    sprite.interaction.onClick = (e: hxd.Event) -> {
      trace("clicked");
    };
    sprite.origin = new Point(rect.width / 2, rect.height / 2);
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
