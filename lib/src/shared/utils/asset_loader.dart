import 'dart:io';

class AssetLoader {
  static String loadAsset(String path) {
    return File(path).readAsStringSync();
  }
}
