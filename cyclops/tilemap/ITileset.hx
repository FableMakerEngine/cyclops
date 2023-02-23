package cyclops.tilemap;

typedef ITileset = {
  id: Int,
  name: String,
  relFilepath: String,
  width: Int,
  height: Int,
  gridSize: Int,
  tileWidth: Int,
  tileHeight: Int
  // We need to create the texture class which just inherhits from h2d.Tile
  // texture: Texture;
}
