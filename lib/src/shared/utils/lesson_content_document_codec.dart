import 'dart:convert';
import 'dart:math';

import 'package:praxis_server/src/generated/protocol.dart';

class LessonContentDocumentCodec {
  static const int schemaVersion = 1;
  static const int averageReadingWordsPerMinute = 200;

  const LessonContentDocumentCodec();

  String encodeForStorage({
    required String legacyContentText,
    LessonContentDocumentDto? contentDocument,
  }) {
    if (contentDocument == null) {
      return _requireText(legacyContentText, 'contentText');
    }

    final normalized = _normalizeDocument(contentDocument);
    return jsonEncode(_documentToStorageJson(normalized));
  }

  LessonContentDocumentDto? decodeFromStorage(String contentText) {
    final decoded = _tryDecodeMap(contentText);
    if (decoded == null || decoded['schemaVersion'] != schemaVersion) {
      return null;
    }

    final blocks = decoded['blocks'];
    if (blocks is! List) {
      return null;
    }

    try {
      return LessonContentDocumentDto(
        schemaVersion: schemaVersion,
        blocks: blocks
            .whereType<Map>()
            .map(
              (block) => _blockFromStorageJson(block.cast<String, dynamic>()),
            )
            .toList(),
      );
    } catch (_) {
      return null;
    }
  }

  int estimateReadingMinutes(String contentText) {
    final words = _plainText(
      contentText,
    ).split(RegExp(r'\s+')).where((word) => word.trim().isNotEmpty).length;
    if (words == 0) {
      return 0;
    }
    return max(1, (words / averageReadingWordsPerMinute).ceil());
  }

  LessonContentDocumentDto _normalizeDocument(
    LessonContentDocumentDto document,
  ) {
    if (document.schemaVersion != schemaVersion) {
      throw ValidationException(
        message: 'Unsupported lesson content schema version',
        field: 'contentDocument.schemaVersion',
      );
    }
    if (document.blocks.isEmpty) {
      throw ValidationException(
        message: 'Lesson content must contain at least one block',
        field: 'contentDocument.blocks',
      );
    }

    return LessonContentDocumentDto(
      schemaVersion: schemaVersion,
      blocks: [
        for (var index = 0; index < document.blocks.length; index++)
          _normalizeBlock(document.blocks[index], index),
      ],
    );
  }

  LessonContentBlockDto _normalizeBlock(
    LessonContentBlockDto block,
    int index,
  ) {
    return switch (block.type) {
      LessonContentBlockType.heading => LessonContentBlockDto(
        type: block.type,
        text: _requireText(
          block.text ?? '',
          'contentDocument.blocks[$index].text',
        ),
        level: (block.level ?? 2).clamp(1, 3),
      ),
      LessonContentBlockType.paragraph => LessonContentBlockDto(
        type: block.type,
        text: _requireText(
          block.text ?? '',
          'contentDocument.blocks[$index].text',
        ),
      ),
      LessonContentBlockType.quote => LessonContentBlockDto(
        type: block.type,
        text: _requireText(
          block.text ?? '',
          'contentDocument.blocks[$index].text',
        ),
      ),
      LessonContentBlockType.code => LessonContentBlockDto(
        type: block.type,
        text: _requireText(
          block.text ?? '',
          'contentDocument.blocks[$index].text',
        ),
        language: _normalizeOptionalText(block.language),
      ),
      LessonContentBlockType.image => LessonContentBlockDto(
        type: block.type,
        url: _requireUrl(block.url, 'contentDocument.blocks[$index].url'),
        caption: _normalizeOptionalText(block.caption),
      ),
    };
  }

  Map<String, dynamic> _documentToStorageJson(
    LessonContentDocumentDto document,
  ) {
    return {
      'schemaVersion': schemaVersion,
      'blocks': document.blocks.map(_blockToStorageJson).toList(),
    };
  }

  Map<String, dynamic> _blockToStorageJson(LessonContentBlockDto block) {
    return {
      'type': block.type.name,
      if (block.text != null) 'text': block.text,
      if (block.level != null) 'level': block.level,
      if (block.language != null) 'language': block.language,
      if (block.url != null) 'url': block.url,
      if (block.caption != null) 'caption': block.caption,
    };
  }

  LessonContentBlockDto _blockFromStorageJson(Map<String, dynamic> json) {
    final typeName = json['type'];
    if (typeName is! String) {
      throw const FormatException('Missing block type');
    }
    final type = LessonContentBlockType.values.byName(typeName);
    return LessonContentBlockDto(
      type: type,
      text: json['text'] as String?,
      level: json['level'] as int?,
      language: json['language'] as String?,
      url: json['url'] as String?,
      caption: json['caption'] as String?,
    );
  }

  String _plainText(String contentText) {
    final document = decodeFromStorage(contentText);
    if (document == null) {
      return contentText;
    }

    return document.blocks
        .map((block) => block.text ?? block.caption ?? '')
        .where((text) => text.trim().isNotEmpty)
        .join('\n');
  }

  Map<String, dynamic>? _tryDecodeMap(String value) {
    try {
      final decoded = jsonDecode(value);
      return decoded is Map<String, dynamic> ? decoded : null;
    } catch (_) {
      return null;
    }
  }

  String _requireText(String value, String field) {
    final normalized = value.trim();
    if (normalized.isEmpty) {
      throw ValidationException(message: 'Field is required', field: field);
    }
    return normalized;
  }

  String? _normalizeOptionalText(String? value) {
    final normalized = value?.trim();
    if (normalized == null || normalized.isEmpty) {
      return null;
    }
    return normalized;
  }

  String _requireUrl(String? value, String field) {
    final normalized = _requireText(value ?? '', field);
    final uri = Uri.tryParse(normalized);
    if (uri == null ||
        !uri.hasScheme ||
        !(uri.scheme == 'http' || uri.scheme == 'https')) {
      throw ValidationException(
        message: 'Field must contain a valid http or https URL',
        field: field,
      );
    }
    return normalized;
  }
}
