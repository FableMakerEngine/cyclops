package sample;

import hxd.Res;
import hxd.File;
import h3d.mat.Texture;
import h2d.col.Point;
import cyclops.Sprite;

class TestScene extends cyclops.Scene {
  public var testText: h2d.Text;
  public var sprite: cyclops.Sprite;
  public var logoSprite: cyclops.Sprite;

  private var isRotatingLeft: Bool = false;

  public function new() {
    super();
    testText = createText('Hello World!', 42);
    testText.x = width / 2;
    testText.y = height / 2 - testText.textHeight / 2;
    testText.textAlign = h2d.Text.Align.Center;
    add(testText, 1);
    createLogo();
    createRectSprite();
  }

  public function createLogo() {
    var logoTile = Res.img.logoSmall.toTile();
    logoSprite = new Sprite(width / 2, height / 2, logoTile);
    logoSprite.origin = new Point(0.5, 0.5);
    add(logoSprite, 0);
  }

  public function createRectSprite() {
    var rectTile = h2d.Tile.fromColor(0xFF0000, 100, 100);
    sprite = new Sprite(width / 2, height / 2, rectTile, true);
    sprite.interaction.onPush = (e: hxd.Event) -> {
      sprite.tile = h2d.Tile.fromColor(0x1A1B79, 100, 100);
    };
    sprite.interaction.onRelease = (e: hxd.Event) -> {
      sprite.tile = h2d.Tile.fromColor(0xFF0000, 100, 100);
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
    sprite.x = width / 2;
    sprite.y = height / 2;
    logoSprite.x = width / 2;
    logoSprite.y = height / 2;
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
