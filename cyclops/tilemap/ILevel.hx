package cyclops.tilemap;

typedef ITile = {
  px: Array<Int>,
  src: Array<Int>,
  f: Int,
  t: Int,
  d: Array<Int>
}

typedef ILevelLayer = {
  name: String,
  layerId: Int,
  visible: Bool,
  tiles: Array<ITile>
}

typedef ILevel = {
  id: Int,
  name: String,
  width: Int,
  height: Int,
  bgColor: String,
  bgRelFilepath: String,
  layers: Array<ILevelLayer>,
}
