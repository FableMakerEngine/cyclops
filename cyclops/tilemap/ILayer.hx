package cyclops.tilemap;

typedef ILayer = {
  id: Int,
  name: String,
  type: String,
  gridSize: Int,
  tileWidth: Int,
  tileHeight: Int,
  tilesetId: Int,
}
