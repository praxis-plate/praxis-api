import 'dart:convert';
import 'dart:io';

import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CmsMediaStorageService {
  static const int maxImageBytes = 3 * 1024 * 1024;
  static const Set<String> _allowedMimeTypes = {
    'image/jpeg',
    'image/png',
    'image/webp',
    'image/gif',
  };

  final Directory storageDirectory;

  CmsMediaStorageService({
    Directory? storageDirectory,
  }) : storageDirectory = storageDirectory ?? Directory('web/static/cms-media');

  Future<CmsMediaDto> uploadImage(
    Session session,
    UploadCmsMediaRequest request,
  ) async {
    final mimeType = request.mimeType.trim().toLowerCase();
    if (!_allowedMimeTypes.contains(mimeType)) {
      throw ValidationException(
        message: 'Unsupported image mime type',
        field: 'mimeType',
      );
    }

    final bytes = _decodeBase64(request.dataBase64);
    if (bytes.isEmpty || bytes.length > maxImageBytes) {
      throw ValidationException(
        message: 'Image size must be between 1 byte and 3 MB',
        field: 'dataBase64',
      );
    }

    await storageDirectory.create(recursive: true);
    final fileName = _buildStoredFileName(
      sourceName: request.fileName,
      mimeType: mimeType,
    );
    final file = File('${storageDirectory.path}/$fileName');
    await file.writeAsBytes(bytes, flush: true);

    return CmsMediaDto(
      fileName: fileName,
      mimeType: mimeType,
      url: _buildPublicUrl(fileName),
      sizeBytes: bytes.length,
    );
  }

  List<int> _decodeBase64(String value) {
    try {
      return base64Decode(value);
    } on FormatException {
      throw ValidationException(
        message: 'Image payload must be base64 encoded',
        field: 'dataBase64',
      );
    }
  }

  String _buildStoredFileName({
    required String sourceName,
    required String mimeType,
  }) {
    final safeBaseName = sourceName
        .split(RegExp(r'[/\\]'))
        .last
        .replaceAll(RegExp(r'[^a-zA-Z0-9._-]'), '-')
        .replaceAll(RegExp(r'-+'), '-')
        .toLowerCase();
    final extension = _extensionForMimeType(mimeType);
    final normalizedBaseName = safeBaseName.isEmpty
        ? 'cms-image$extension'
        : safeBaseName.endsWith(extension)
        ? safeBaseName
        : '$safeBaseName$extension';
    final id = const Uuid().v7obj().toString();
    return '$id-$normalizedBaseName';
  }

  String _extensionForMimeType(String mimeType) {
    return switch (mimeType) {
      'image/jpeg' => '.jpg',
      'image/png' => '.png',
      'image/webp' => '.webp',
      'image/gif' => '.gif',
      _ => '.bin',
    };
  }

  String _buildPublicUrl(String fileName) {
    final config = Serverpod.instance.config.webServer!;
    return Uri(
      scheme: config.publicScheme,
      host: config.publicHost,
      port: config.publicPort,
      path: '/cms-media/$fileName',
    ).toString();
  }
}
