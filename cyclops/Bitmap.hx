package cyclops;

class Bitmap extends h2d.Bitmap {
  public var texture(default, set): h3d.mat.Texture;

  public function new(?texture: h3d.mat.Texture) {
    super(null);
    if (texture != null) {
      this.texture = texture;
      tile = h2d.Tile.fromTexture(texture);
    }
  }

  public function set_texture(texture: h3d.mat.Texture) {
    if (texture != null) {
      tile = h2d.Tile.fromTexture(texture);
    }
    return this.texture = texture;
  }
}
