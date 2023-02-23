package cyclops;

class TileMap extends h2d.Object {
  public var config: ITilemapConfig;

  private var tilesets: Array<ITileset>;

  private var layers: Array<ILayer>;

  private var tilemap: h2d.TileGroup;

  public function new(?parent, config: ITilemapConfig) {
    super(parent);
    this.config = config;
  }
}
