package cyclops.tilemap;

typedef ITileset = {
  id: Int,
  name: String,
  relFilepath: String,
  width: Int,
  height: Int,
  gridSize: Int,
  tileWidth: Int,
  tileHeight: Int,
  texture: h2d.Tile
}
