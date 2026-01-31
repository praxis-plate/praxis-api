import 'dart:io';

import 'package:praxis_server/src/shared/utils/asset_loader.dart';
import 'package:test/test.dart';

void main() {
  group('AssetLoader', () {
    late String testFilePath;
    const testContent = 'Test content for asset loader';

    setUp(() {
      testFilePath = 'test_asset.txt';
      File(testFilePath).writeAsStringSync(testContent);
    });

    tearDown(() {
      final file = File(testFilePath);
      if (file.existsSync()) {
        file.deleteSync();
      }
    });

    test('should load asset from file', () {
      final content = AssetLoader.loadAsset(testFilePath);

      expect(content, equals(testContent));
    });

    test('should throw exception for non-existent file', () {
      expect(
        () => AssetLoader.loadAsset('non_existent_file.txt'),
        throwsA(isA<FileSystemException>()),
      );
    });
  });
}
