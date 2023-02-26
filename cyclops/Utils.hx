package cyclops;

import cyclops.tilemap.ITileset;
import cyclops.tilemap.ILayer;
import cyclops.tilemap.ILevel;
import cyclops.tilemap.ILevel.ILevelLayer;
import hxd.System;
import haxe.Json;

typedef Config = {
  name: String,
  version: String,
  enableConsole: Bool
}

class Utils {
  public static function getSystemData(): Config {
    var data = Res.data.system.entry.getText();
    var systemData: Config = Json.parse(data);
    return systemData;
  }

  public static function getVersion(): String {
    var data = getSystemData();
    return data.version;
  }

  public static function getPlatform(): String {
    var platform = System.platform;

    switch (platform) {
      case IOS:
        return "IOS";
      case Android:
        return "Android";
      case WebGL:
        return "Web";
      case PC:
        return "Desktop";
      case _:
        return "Other";
    }
  }

  public static function isConsleEnabled(): Bool {
    var data = getSystemData();
    return data.enableConsole;
  }

  public static function parseLdtkData(data: Dynamic) {
    function getTexture(filepath: String) {
      var filename = filepath.split('/').pop();
      // var key = filename.split('.')[0];
      var texture = Res.load('tilesets/$filename');
      if (texture != null) {
        return texture;
      }
      return null;
    }

    function parseLevelLayers(levelLayers: Array<Dynamic>): Array<ILevelLayer> {
      var layers: Array<ILevelLayer> = [];

      for (layer in levelLayers) {
        layers.push({
          layerId: layer.layerDefUid,
          name: layer.__identifier,
          visible: layer.visible,
          tiles: layer.gridTiles,
        });
      }
      return layers;
    }

    function parseLevels(data): Array<ILevel> {
      var levels: Array<ILevel> = [];
      var levelData: Array<Dynamic> = data.levels;

      for (level in levelData) {
        levels.push({
          id: level.uid,
          name: level.identifier,
          width: level.pxWid,
          height: level.pxHei,
          bgColor: level.bgColor,
          bgRelFilepath: level.bgRelFilepath,
          layers: parseLevelLayers(level.layerInstances),
        });
      }

      return levels;
    }

    function parseLayers(data) {
      var layers: Array<ILayer> = [];
      var layersData: Array<Dynamic> = data.defs.layers;

      for (layer in layersData) {
        layers.push({
          id: layer.uid,
          name: layer.identifier,
          type: layer.type,
          gridSize: layer.gridSize,
          tileWidth: layer.gridSize,
          tileHeight: layer.gridSize,
          tilesetId: layer.tilesetDefUid,
        });
      }
      return layers;
    }

    function parseTilesets(data) {
      var tilesets: Array<ITileset> = [];
      var tilesetData: Array<Dynamic> = data.defs.tilesets;

      for (tileset in tilesetData) {
        tilesets.push({
          id: tileset.uid,
          name: tileset.identifier,
          relFilepath: tileset.relPath,
          width: tileset.pxWid,
          height: tileset.pxHei,
          gridSize: tileset.tileGridSize,
          tileWidth: tileset.tileGridSize,
          tileHeight: tileset.tileGridSize,
          texture: getTexture(tileset.relPath).toTile(),
        });
      }
      return tilesets;
    }

    var levels = parseLevels(data);
    var layers = parseLayers(data);
    var tilesets = parseTilesets(data);

    return {
      levels: levels,
      layers: layers,
      tilesets: tilesets
    };
  }
}
