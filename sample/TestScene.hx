package sample;

import h2d.Text.Align;

class TestScene extends cyclops.Scene {
  public var testText: h2d.Text;

  private var isRotatingLeft: Bool = false;

  public function new() {
    super();
    testText = createText('Hello World!', 42);
    testText.x = width / 2;
    testText.y = height / 2 - testText.textHeight / 2;
    testText.textAlign = Align.Center;
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
