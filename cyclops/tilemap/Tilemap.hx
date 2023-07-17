package cyclops.tilemap;

using Lambda;

class Tilemap extends h2d.Object {
  public var config: ITilemapConfig;

  private var level: ILevel;

  private var tilesets: Array<ITileset>;

  private var layers: Array<ILayer>;

  private var tilemap: h2d.TileGroup;

  public function new(?parent, config: ITilemapConfig) {
    super(parent);
    level = config.level;
    tilesets = config.tilesets;
    layers = config.layers;
    this.config = config;
    createTilemap();
  }

  private function createTilemap() {
    tilemap = new h2d.TileGroup();
    populateTilemap();
    this.addChild(tilemap);
  }

  private function populateTilemap(): Void {
    var levelLayers = level.layers;
    levelLayers.reverse();
    this.tilemap.clear();

    for (levelLayer in levelLayers) {
      var layerDef = layers.find(l -> l.id == levelLayer.layerId);
      if (layerDef.type != 'Tiles') {
        continue;
      }
      var tileset = tilesets.find(t -> t.id == layerDef.tilesetId);
      var texture = tileset.texture;

      for (tile in levelLayer.tiles) {
        var x = tile.px[0];
        var y = tile.px[1];
        var tilesetX = tile.src[0];
        var tilesetY = tile.src[1];
        var tile = texture.sub(tilesetX, tilesetY, layerDef.tileWidth, layerDef.tileHeight);
        tilemap.add(x, y, tile);
      }
    }
  }
}
