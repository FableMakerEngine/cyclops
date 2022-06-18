package cyclops;

import h2d.Interactive;
import h2d.Object;
import h2d.Tile;

class Sprite extends h2d.Object {
  public var interaction: Interactive;
  public var origin(default, set) = new h2d.col.Point();
  public var bitmap(default, set): Bitmap;

  public function new(x: Float, y: Float, ?bitmap: Bitmap, ?isInteractive: Bool, ?parent: Object) {
    super(parent);
    this.x = x;
    this.y = y;
    if (bitmap != null) {
      this.bitmap = bitmap;
    }
    if (isInteractive) {
      var size = getSize();
      interaction = new Interactive(size.width, size.height, this);
      interaction.onClick = onClick;
      interaction.onOver = onOver;
      interaction.onOut = onOut;
    }
  }

  function set_bitmap(bitmap: Bitmap) {
    return this.bitmap = bitmap;
  }

  function set_origin(origin: h2d.col.Point) {
    // We can set the origin based on [0, 0], [0.5, 0.5] by using the bitmap/tile
    // width and height
    bitmap.x = bitmap.x - (origin.x * bitmap.width);
    bitmap.y = bitmap.y - (origin.y * bitmap.height);
    return this.origin = origin;
  }

  // override function calcAbsPos() {
  //   if (parent == null) {
  //     var cr, sr;
  //     if (rotation == 0) {
  //       cr = 1.;
  //       sr = 0.;
  //       matA = scaleX;
  //       matB = 0;
  //       matC = 0;
  //       matD = scaleY;
  //     } else {
  //       cr = Math.cos(rotation);
  //       sr = Math.sin(rotation);
  //       matA = scaleX * cr;
  //       matB = scaleX * sr;
  //       matC = scaleY * -sr;
  //       matD = scaleY * cr;
  //     }
  //     absX = x;
  //     absY = y;
  //   } else {
  //     if (rotation == 0) {
  //       matA = scaleX * parent.matA;
  //       matB = scaleX * parent.matB;
  //       matC = scaleY * parent.matC;
  //       matD = scaleY * parent.matD;
  //     } else {
  //       var cr = Math.cos(rotation);
  //       var sr = Math.sin(rotation);
  //       var tmpA = scaleX * cr;
  //       var tmpB = scaleX * sr;
  //       var tmpC = scaleY * -sr;
  //       var tmpD = scaleY * cr;
  //       matA = tmpA * parent.matA + tmpB * parent.matC;
  //       matB = tmpA * parent.matB + tmpB * parent.matD;
  //       matC = tmpC * parent.matA + tmpD * parent.matC;
  //       matD = tmpC * parent.matB + tmpD * parent.matD;
  //     }
  //     absX = x * parent.matA + y * parent.matC + parent.absX - (origin.x * matA + origin.y * matC);
  //     absY = x * parent.matB + y * parent.matD + parent.absY - (origin.x * matB + origin.y * matD);
  //   }
  // }

  public function onClick(event: hxd.Event) {}

  public function onOver(event: hxd.Event) {}

  public function onOut(event: hxd.Event) {}

  public function update(dt: Float) {}
}
