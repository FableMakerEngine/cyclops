package cyclops;

import h2d.Interactive;
import h2d.Object;
import h2d.Tile;
import h2d.Bitmap;
import h2d.col.Point;

class Sprite extends h2d.Object {
  public var interaction: Interactive;
  public var tile(default, set): Tile;

  private var bitmap: h2d.Bitmap;

  public var origin(default, set) = new Point();

  public function new(x: Float, y: Float, ?tile: Tile, ?isInteractive: Bool, ?parent: Object) {
    super(parent);
    this.x = x;
    this.y = y;
    bitmap = new h2d.Bitmap(null, this);
    if (tile != null) {
      bitmap.tile = tile;
    }
    if (isInteractive) {
      var size = getSize();
      interaction = new Interactive(size.width, size.height, bitmap);
      interaction.onClick = onClick;
      interaction.onOver = onOver;
      interaction.onOut = onOut;
    }
  }

  function set_tile(tile: Tile) {
    bitmap.tile = tile;
    return this.tile = tile;
  }

  function set_origin(origin: h2d.col.Point) {
    bitmap.x = bitmap.x - (origin.x * bitmap.tile.width);
    bitmap.y = bitmap.y - (origin.y * bitmap.tile.height);
    return this.origin = origin;
  }

  public function onClick(event: hxd.Event) {}

  public function onOver(event: hxd.Event) {}

  public function onOut(event: hxd.Event) {}

  public function update(dt: Float) {}
}
