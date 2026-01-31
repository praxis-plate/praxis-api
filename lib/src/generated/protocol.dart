/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i3;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i4;
import 'dto/achievement_dto.dart' as _i5;
import 'dto/coin_transaction_dto.dart' as _i6;
import 'dto/course_detail_dto.dart' as _i7;
import 'dto/course_dto.dart' as _i8;
import 'dto/course_structure_dto.dart' as _i9;
import 'dto/course_structure_lesson_dto.dart' as _i10;
import 'dto/course_structure_module_dto.dart' as _i11;
import 'dto/course_structure_task_dto.dart' as _i12;
import 'dto/lesson_completion_result_dto.dart' as _i13;
import 'dto/lesson_dto.dart' as _i14;
import 'dto/module_dto.dart' as _i15;
import 'dto/task_answer_result_dto.dart' as _i16;
import 'dto/task_dto.dart' as _i17;
import 'dto/task_option_dto.dart' as _i18;
import 'dto/task_test_case_dto.dart' as _i19;
import 'dto/user_statistics_dto.dart' as _i20;
import 'dto/wallet_balance_dto.dart' as _i21;
import 'enums/coin_transaction_type.dart' as _i22;
import 'enums/task_type.dart' as _i23;
import 'exceptions/not_found_exception.dart' as _i24;
import 'exceptions/validation_exception.dart' as _i25;
import 'requests/complete_lesson_session_request.dart' as _i26;
import 'requests/create_coin_transaction_request.dart' as _i27;
import 'requests/generate_explanation_request.dart' as _i28;
import 'requests/generate_hint_request.dart' as _i29;
import 'responses/ai_response.dart' as _i30;
import 'tables/achievement_table.dart' as _i31;
import 'tables/coin_transaction_table.dart' as _i32;
import 'tables/course_table.dart' as _i33;
import 'tables/lesson_progress_table.dart' as _i34;
import 'tables/lesson_table.dart' as _i35;
import 'tables/module_table.dart' as _i36;
import 'tables/task_option_table.dart' as _i37;
import 'tables/task_table.dart' as _i38;
import 'tables/task_test_case_table.dart' as _i39;
import 'tables/user_achievement_table.dart' as _i40;
import 'tables/user_course_table.dart' as _i41;
import 'tables/user_statistics_table.dart' as _i42;
import 'tables/user_wallet_table.dart' as _i43;
import 'package:praxis_server/src/generated/dto/achievement_dto.dart' as _i44;
import 'package:praxis_server/src/generated/dto/course_dto.dart' as _i45;
import 'package:praxis_server/src/generated/dto/lesson_dto.dart' as _i46;
import 'package:praxis_server/src/generated/dto/module_dto.dart' as _i47;
import 'package:praxis_server/src/generated/dto/task_dto.dart' as _i48;
import 'package:praxis_server/src/generated/dto/coin_transaction_dto.dart'
    as _i49;
export 'dto/achievement_dto.dart';
export 'dto/coin_transaction_dto.dart';
export 'dto/course_detail_dto.dart';
export 'dto/course_dto.dart';
export 'dto/course_structure_dto.dart';
export 'dto/course_structure_lesson_dto.dart';
export 'dto/course_structure_module_dto.dart';
export 'dto/course_structure_task_dto.dart';
export 'dto/lesson_completion_result_dto.dart';
export 'dto/lesson_dto.dart';
export 'dto/module_dto.dart';
export 'dto/task_answer_result_dto.dart';
export 'dto/task_dto.dart';
export 'dto/task_option_dto.dart';
export 'dto/task_test_case_dto.dart';
export 'dto/user_statistics_dto.dart';
export 'dto/wallet_balance_dto.dart';
export 'enums/coin_transaction_type.dart';
export 'enums/task_type.dart';
export 'exceptions/not_found_exception.dart';
export 'exceptions/validation_exception.dart';
export 'requests/complete_lesson_session_request.dart';
export 'requests/create_coin_transaction_request.dart';
export 'requests/generate_explanation_request.dart';
export 'requests/generate_hint_request.dart';
export 'responses/ai_response.dart';
export 'tables/achievement_table.dart';
export 'tables/coin_transaction_table.dart';
export 'tables/course_table.dart';
export 'tables/lesson_progress_table.dart';
export 'tables/lesson_table.dart';
export 'tables/module_table.dart';
export 'tables/task_option_table.dart';
export 'tables/task_table.dart';
export 'tables/task_test_case_table.dart';
export 'tables/user_achievement_table.dart';
export 'tables/user_course_table.dart';
export 'tables/user_statistics_table.dart';
export 'tables/user_wallet_table.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'achievement',
      dartName: 'Achievement',
      schema: 'public',
      module: 'praxis',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'achievement_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'iconUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'pointsReward',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'relatedCourseId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'conditionType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'conditionValue',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'achievement_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'achievement_condition_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'conditionType',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'coin_transaction',
      dartName: 'CoinTransaction',
      schema: 'public',
      module: 'praxis',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'coin_transaction_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'authUserId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'transactionKey',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:CoinTransactionType',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'amount',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'currency',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'relatedEntityId',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'reversalOfTransactionId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'reason',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'metadata',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'coin_transaction_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'coin_transaction_transaction_key_unique',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'transactionKey',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'coin_transaction_auth_user_id_created_at_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'course',
      dartName: 'Course',
      schema: 'public',
      module: 'praxis',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'course_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'author',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'category',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'priceInCoins',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'durationMinutes',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'rating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'thumbnailUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'coverImage',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'course_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'course_category_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'category',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'course_rating_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'rating',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'lesson',
      dartName: 'Lesson',
      schema: 'public',
      module: 'praxis',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'lesson_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'moduleId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'contentText',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'videoUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'imageUrls',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'orderIndex',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'durationMinutes',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'lesson_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'lesson_module_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'moduleId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'lesson_module_id_order_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'moduleId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'orderIndex',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'lesson_progress',
      dartName: 'LessonProgress',
      schema: 'public',
      module: 'praxis',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'lesson_progress_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'authUserId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'lessonId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'isCompleted',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'completedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'timeSpentSeconds',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'lesson_progress_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'lesson_progress_auth_user_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'lesson_progress_auth_user_id_lesson_id_unique',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'lessonId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'module',
      dartName: 'Module',
      schema: 'public',
      module: 'praxis',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'module_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'courseId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'orderIndex',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'module_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'module_course_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'courseId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'module_course_id_order_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'courseId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'orderIndex',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'task',
      dartName: 'Task',
      schema: 'public',
      module: 'praxis',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'task_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'lessonId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'taskType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:TaskType',
        ),
        _i2.ColumnDefinition(
          name: 'questionText',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'correctAnswer',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'optionsJson',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'codeTemplate',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'testCasesJson',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'programmingLanguage',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'difficultyLevel',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'xpValue',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'orderIndex',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'fallbackHint',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'fallbackExplanation',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'topic',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'task_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'task_lesson_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'lessonId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'task_lesson_id_order_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'lessonId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'orderIndex',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'task_option',
      dartName: 'TaskOption',
      schema: 'public',
      module: 'praxis',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'task_option_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'taskId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'optionText',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isCorrect',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'orderIndex',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'task_option_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'task_option_task_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'taskId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'task_option_task_id_order_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'taskId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'orderIndex',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'task_test_case',
      dartName: 'TaskTestCase',
      schema: 'public',
      module: 'praxis',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'task_test_case_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'taskId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'input',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'expectedOutput',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isHidden',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'orderIndex',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'task_test_case_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'task_test_case_task_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'taskId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'task_test_case_task_id_order_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'taskId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'orderIndex',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user_achievement',
      dartName: 'UserAchievement',
      schema: 'public',
      module: 'praxis',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_achievement_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'authUserId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'achievementId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'unlockedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_achievement_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'user_achievement_auth_user_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'user_achievement_auth_user_id_achievement_id_unique',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'achievementId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user_course',
      dartName: 'UserCourse',
      schema: 'public',
      module: 'praxis',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_course_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'authUserId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'courseId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'enrolledAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'isCompleted',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'completedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_course_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'user_course_auth_user_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'user_course_auth_user_id_course_id_unique',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'courseId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user_statistics',
      dartName: 'UserStatistics',
      schema: 'public',
      module: 'praxis',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_statistics_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'authUserId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'currentStreak',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'maxStreak',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'experiencePoints',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'lastActiveDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_statistics_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'user_statistics_auth_user_id_unique',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user_wallet',
      dartName: 'UserWallet',
      schema: 'public',
      module: 'praxis',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_wallet_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'authUserId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'balance',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'available',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'held',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'currency',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'version',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_wallet_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'user_wallet_auth_user_id_unique',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i4.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i5.AchievementDto) {
      return _i5.AchievementDto.fromJson(data) as T;
    }
    if (t == _i6.CoinTransactionDto) {
      return _i6.CoinTransactionDto.fromJson(data) as T;
    }
    if (t == _i7.CourseDetailDto) {
      return _i7.CourseDetailDto.fromJson(data) as T;
    }
    if (t == _i8.CourseDto) {
      return _i8.CourseDto.fromJson(data) as T;
    }
    if (t == _i9.CourseStructureDto) {
      return _i9.CourseStructureDto.fromJson(data) as T;
    }
    if (t == _i10.CourseStructureLessonDto) {
      return _i10.CourseStructureLessonDto.fromJson(data) as T;
    }
    if (t == _i11.CourseStructureModuleDto) {
      return _i11.CourseStructureModuleDto.fromJson(data) as T;
    }
    if (t == _i12.CourseStructureTaskDto) {
      return _i12.CourseStructureTaskDto.fromJson(data) as T;
    }
    if (t == _i13.LessonCompletionResultDto) {
      return _i13.LessonCompletionResultDto.fromJson(data) as T;
    }
    if (t == _i14.LessonDto) {
      return _i14.LessonDto.fromJson(data) as T;
    }
    if (t == _i15.ModuleDto) {
      return _i15.ModuleDto.fromJson(data) as T;
    }
    if (t == _i16.TaskAnswerResultDto) {
      return _i16.TaskAnswerResultDto.fromJson(data) as T;
    }
    if (t == _i17.TaskDto) {
      return _i17.TaskDto.fromJson(data) as T;
    }
    if (t == _i18.TaskOptionDto) {
      return _i18.TaskOptionDto.fromJson(data) as T;
    }
    if (t == _i19.TaskTestCaseDto) {
      return _i19.TaskTestCaseDto.fromJson(data) as T;
    }
    if (t == _i20.UserStatisticsDto) {
      return _i20.UserStatisticsDto.fromJson(data) as T;
    }
    if (t == _i21.WalletBalanceDto) {
      return _i21.WalletBalanceDto.fromJson(data) as T;
    }
    if (t == _i22.CoinTransactionType) {
      return _i22.CoinTransactionType.fromJson(data) as T;
    }
    if (t == _i23.TaskType) {
      return _i23.TaskType.fromJson(data) as T;
    }
    if (t == _i24.NotFoundException) {
      return _i24.NotFoundException.fromJson(data) as T;
    }
    if (t == _i25.ValidationException) {
      return _i25.ValidationException.fromJson(data) as T;
    }
    if (t == _i26.CompleteLessonSessionRequest) {
      return _i26.CompleteLessonSessionRequest.fromJson(data) as T;
    }
    if (t == _i27.CreateCoinTransactionRequest) {
      return _i27.CreateCoinTransactionRequest.fromJson(data) as T;
    }
    if (t == _i28.GenerateExplanationRequest) {
      return _i28.GenerateExplanationRequest.fromJson(data) as T;
    }
    if (t == _i29.GenerateHintRequest) {
      return _i29.GenerateHintRequest.fromJson(data) as T;
    }
    if (t == _i30.AiResponse) {
      return _i30.AiResponse.fromJson(data) as T;
    }
    if (t == _i31.Achievement) {
      return _i31.Achievement.fromJson(data) as T;
    }
    if (t == _i32.CoinTransaction) {
      return _i32.CoinTransaction.fromJson(data) as T;
    }
    if (t == _i33.Course) {
      return _i33.Course.fromJson(data) as T;
    }
    if (t == _i34.LessonProgress) {
      return _i34.LessonProgress.fromJson(data) as T;
    }
    if (t == _i35.Lesson) {
      return _i35.Lesson.fromJson(data) as T;
    }
    if (t == _i36.Module) {
      return _i36.Module.fromJson(data) as T;
    }
    if (t == _i37.TaskOption) {
      return _i37.TaskOption.fromJson(data) as T;
    }
    if (t == _i38.Task) {
      return _i38.Task.fromJson(data) as T;
    }
    if (t == _i39.TaskTestCase) {
      return _i39.TaskTestCase.fromJson(data) as T;
    }
    if (t == _i40.UserAchievement) {
      return _i40.UserAchievement.fromJson(data) as T;
    }
    if (t == _i41.UserCourse) {
      return _i41.UserCourse.fromJson(data) as T;
    }
    if (t == _i42.UserStatistics) {
      return _i42.UserStatistics.fromJson(data) as T;
    }
    if (t == _i43.UserWallet) {
      return _i43.UserWallet.fromJson(data) as T;
    }
    if (t == _i1.getType<_i5.AchievementDto?>()) {
      return (data != null ? _i5.AchievementDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.CoinTransactionDto?>()) {
      return (data != null ? _i6.CoinTransactionDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.CourseDetailDto?>()) {
      return (data != null ? _i7.CourseDetailDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.CourseDto?>()) {
      return (data != null ? _i8.CourseDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.CourseStructureDto?>()) {
      return (data != null ? _i9.CourseStructureDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.CourseStructureLessonDto?>()) {
      return (data != null
              ? _i10.CourseStructureLessonDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i11.CourseStructureModuleDto?>()) {
      return (data != null
              ? _i11.CourseStructureModuleDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i12.CourseStructureTaskDto?>()) {
      return (data != null ? _i12.CourseStructureTaskDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i13.LessonCompletionResultDto?>()) {
      return (data != null
              ? _i13.LessonCompletionResultDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i14.LessonDto?>()) {
      return (data != null ? _i14.LessonDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.ModuleDto?>()) {
      return (data != null ? _i15.ModuleDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.TaskAnswerResultDto?>()) {
      return (data != null ? _i16.TaskAnswerResultDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i17.TaskDto?>()) {
      return (data != null ? _i17.TaskDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.TaskOptionDto?>()) {
      return (data != null ? _i18.TaskOptionDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.TaskTestCaseDto?>()) {
      return (data != null ? _i19.TaskTestCaseDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.UserStatisticsDto?>()) {
      return (data != null ? _i20.UserStatisticsDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.WalletBalanceDto?>()) {
      return (data != null ? _i21.WalletBalanceDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.CoinTransactionType?>()) {
      return (data != null ? _i22.CoinTransactionType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i23.TaskType?>()) {
      return (data != null ? _i23.TaskType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.NotFoundException?>()) {
      return (data != null ? _i24.NotFoundException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.ValidationException?>()) {
      return (data != null ? _i25.ValidationException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i26.CompleteLessonSessionRequest?>()) {
      return (data != null
              ? _i26.CompleteLessonSessionRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i27.CreateCoinTransactionRequest?>()) {
      return (data != null
              ? _i27.CreateCoinTransactionRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i28.GenerateExplanationRequest?>()) {
      return (data != null
              ? _i28.GenerateExplanationRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i29.GenerateHintRequest?>()) {
      return (data != null ? _i29.GenerateHintRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i30.AiResponse?>()) {
      return (data != null ? _i30.AiResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.Achievement?>()) {
      return (data != null ? _i31.Achievement.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.CoinTransaction?>()) {
      return (data != null ? _i32.CoinTransaction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.Course?>()) {
      return (data != null ? _i33.Course.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.LessonProgress?>()) {
      return (data != null ? _i34.LessonProgress.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.Lesson?>()) {
      return (data != null ? _i35.Lesson.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.Module?>()) {
      return (data != null ? _i36.Module.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.TaskOption?>()) {
      return (data != null ? _i37.TaskOption.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.Task?>()) {
      return (data != null ? _i38.Task.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.TaskTestCase?>()) {
      return (data != null ? _i39.TaskTestCase.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.UserAchievement?>()) {
      return (data != null ? _i40.UserAchievement.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i41.UserCourse?>()) {
      return (data != null ? _i41.UserCourse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i42.UserStatistics?>()) {
      return (data != null ? _i42.UserStatistics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i43.UserWallet?>()) {
      return (data != null ? _i43.UserWallet.fromJson(data) : null) as T;
    }
    if (t == List<_i15.ModuleDto>) {
      return (data as List).map((e) => deserialize<_i15.ModuleDto>(e)).toList()
          as T;
    }
    if (t == List<_i14.LessonDto>) {
      return (data as List).map((e) => deserialize<_i14.LessonDto>(e)).toList()
          as T;
    }
    if (t == List<_i17.TaskDto>) {
      return (data as List).map((e) => deserialize<_i17.TaskDto>(e)).toList()
          as T;
    }
    if (t == List<_i11.CourseStructureModuleDto>) {
      return (data as List)
              .map((e) => deserialize<_i11.CourseStructureModuleDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i12.CourseStructureTaskDto>) {
      return (data as List)
              .map((e) => deserialize<_i12.CourseStructureTaskDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i10.CourseStructureLessonDto>) {
      return (data as List)
              .map((e) => deserialize<_i10.CourseStructureLessonDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i5.AchievementDto>) {
      return (data as List)
              .map((e) => deserialize<_i5.AchievementDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i18.TaskOptionDto>) {
      return (data as List)
              .map((e) => deserialize<_i18.TaskOptionDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i19.TaskTestCaseDto>) {
      return (data as List)
              .map((e) => deserialize<_i19.TaskTestCaseDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i44.AchievementDto>) {
      return (data as List)
              .map((e) => deserialize<_i44.AchievementDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i45.CourseDto>) {
      return (data as List).map((e) => deserialize<_i45.CourseDto>(e)).toList()
          as T;
    }
    if (t == List<_i46.LessonDto>) {
      return (data as List).map((e) => deserialize<_i46.LessonDto>(e)).toList()
          as T;
    }
    if (t == List<_i47.ModuleDto>) {
      return (data as List).map((e) => deserialize<_i47.ModuleDto>(e)).toList()
          as T;
    }
    if (t == List<_i48.TaskDto>) {
      return (data as List).map((e) => deserialize<_i48.TaskDto>(e)).toList()
          as T;
    }
    if (t == List<_i49.CoinTransactionDto>) {
      return (data as List)
              .map((e) => deserialize<_i49.CoinTransactionDto>(e))
              .toList()
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i5.AchievementDto => 'AchievementDto',
      _i6.CoinTransactionDto => 'CoinTransactionDto',
      _i7.CourseDetailDto => 'CourseDetailDto',
      _i8.CourseDto => 'CourseDto',
      _i9.CourseStructureDto => 'CourseStructureDto',
      _i10.CourseStructureLessonDto => 'CourseStructureLessonDto',
      _i11.CourseStructureModuleDto => 'CourseStructureModuleDto',
      _i12.CourseStructureTaskDto => 'CourseStructureTaskDto',
      _i13.LessonCompletionResultDto => 'LessonCompletionResultDto',
      _i14.LessonDto => 'LessonDto',
      _i15.ModuleDto => 'ModuleDto',
      _i16.TaskAnswerResultDto => 'TaskAnswerResultDto',
      _i17.TaskDto => 'TaskDto',
      _i18.TaskOptionDto => 'TaskOptionDto',
      _i19.TaskTestCaseDto => 'TaskTestCaseDto',
      _i20.UserStatisticsDto => 'UserStatisticsDto',
      _i21.WalletBalanceDto => 'WalletBalanceDto',
      _i22.CoinTransactionType => 'CoinTransactionType',
      _i23.TaskType => 'TaskType',
      _i24.NotFoundException => 'NotFoundException',
      _i25.ValidationException => 'ValidationException',
      _i26.CompleteLessonSessionRequest => 'CompleteLessonSessionRequest',
      _i27.CreateCoinTransactionRequest => 'CreateCoinTransactionRequest',
      _i28.GenerateExplanationRequest => 'GenerateExplanationRequest',
      _i29.GenerateHintRequest => 'GenerateHintRequest',
      _i30.AiResponse => 'AiResponse',
      _i31.Achievement => 'Achievement',
      _i32.CoinTransaction => 'CoinTransaction',
      _i33.Course => 'Course',
      _i34.LessonProgress => 'LessonProgress',
      _i35.Lesson => 'Lesson',
      _i36.Module => 'Module',
      _i37.TaskOption => 'TaskOption',
      _i38.Task => 'Task',
      _i39.TaskTestCase => 'TaskTestCase',
      _i40.UserAchievement => 'UserAchievement',
      _i41.UserCourse => 'UserCourse',
      _i42.UserStatistics => 'UserStatistics',
      _i43.UserWallet => 'UserWallet',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('praxis.', '');
    }

    switch (data) {
      case _i5.AchievementDto():
        return 'AchievementDto';
      case _i6.CoinTransactionDto():
        return 'CoinTransactionDto';
      case _i7.CourseDetailDto():
        return 'CourseDetailDto';
      case _i8.CourseDto():
        return 'CourseDto';
      case _i9.CourseStructureDto():
        return 'CourseStructureDto';
      case _i10.CourseStructureLessonDto():
        return 'CourseStructureLessonDto';
      case _i11.CourseStructureModuleDto():
        return 'CourseStructureModuleDto';
      case _i12.CourseStructureTaskDto():
        return 'CourseStructureTaskDto';
      case _i13.LessonCompletionResultDto():
        return 'LessonCompletionResultDto';
      case _i14.LessonDto():
        return 'LessonDto';
      case _i15.ModuleDto():
        return 'ModuleDto';
      case _i16.TaskAnswerResultDto():
        return 'TaskAnswerResultDto';
      case _i17.TaskDto():
        return 'TaskDto';
      case _i18.TaskOptionDto():
        return 'TaskOptionDto';
      case _i19.TaskTestCaseDto():
        return 'TaskTestCaseDto';
      case _i20.UserStatisticsDto():
        return 'UserStatisticsDto';
      case _i21.WalletBalanceDto():
        return 'WalletBalanceDto';
      case _i22.CoinTransactionType():
        return 'CoinTransactionType';
      case _i23.TaskType():
        return 'TaskType';
      case _i24.NotFoundException():
        return 'NotFoundException';
      case _i25.ValidationException():
        return 'ValidationException';
      case _i26.CompleteLessonSessionRequest():
        return 'CompleteLessonSessionRequest';
      case _i27.CreateCoinTransactionRequest():
        return 'CreateCoinTransactionRequest';
      case _i28.GenerateExplanationRequest():
        return 'GenerateExplanationRequest';
      case _i29.GenerateHintRequest():
        return 'GenerateHintRequest';
      case _i30.AiResponse():
        return 'AiResponse';
      case _i31.Achievement():
        return 'Achievement';
      case _i32.CoinTransaction():
        return 'CoinTransaction';
      case _i33.Course():
        return 'Course';
      case _i34.LessonProgress():
        return 'LessonProgress';
      case _i35.Lesson():
        return 'Lesson';
      case _i36.Module():
        return 'Module';
      case _i37.TaskOption():
        return 'TaskOption';
      case _i38.Task():
        return 'Task';
      case _i39.TaskTestCase():
        return 'TaskTestCase';
      case _i40.UserAchievement():
        return 'UserAchievement';
      case _i41.UserCourse():
        return 'UserCourse';
      case _i42.UserStatistics():
        return 'UserStatistics';
      case _i43.UserWallet():
        return 'UserWallet';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i4.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'AchievementDto') {
      return deserialize<_i5.AchievementDto>(data['data']);
    }
    if (dataClassName == 'CoinTransactionDto') {
      return deserialize<_i6.CoinTransactionDto>(data['data']);
    }
    if (dataClassName == 'CourseDetailDto') {
      return deserialize<_i7.CourseDetailDto>(data['data']);
    }
    if (dataClassName == 'CourseDto') {
      return deserialize<_i8.CourseDto>(data['data']);
    }
    if (dataClassName == 'CourseStructureDto') {
      return deserialize<_i9.CourseStructureDto>(data['data']);
    }
    if (dataClassName == 'CourseStructureLessonDto') {
      return deserialize<_i10.CourseStructureLessonDto>(data['data']);
    }
    if (dataClassName == 'CourseStructureModuleDto') {
      return deserialize<_i11.CourseStructureModuleDto>(data['data']);
    }
    if (dataClassName == 'CourseStructureTaskDto') {
      return deserialize<_i12.CourseStructureTaskDto>(data['data']);
    }
    if (dataClassName == 'LessonCompletionResultDto') {
      return deserialize<_i13.LessonCompletionResultDto>(data['data']);
    }
    if (dataClassName == 'LessonDto') {
      return deserialize<_i14.LessonDto>(data['data']);
    }
    if (dataClassName == 'ModuleDto') {
      return deserialize<_i15.ModuleDto>(data['data']);
    }
    if (dataClassName == 'TaskAnswerResultDto') {
      return deserialize<_i16.TaskAnswerResultDto>(data['data']);
    }
    if (dataClassName == 'TaskDto') {
      return deserialize<_i17.TaskDto>(data['data']);
    }
    if (dataClassName == 'TaskOptionDto') {
      return deserialize<_i18.TaskOptionDto>(data['data']);
    }
    if (dataClassName == 'TaskTestCaseDto') {
      return deserialize<_i19.TaskTestCaseDto>(data['data']);
    }
    if (dataClassName == 'UserStatisticsDto') {
      return deserialize<_i20.UserStatisticsDto>(data['data']);
    }
    if (dataClassName == 'WalletBalanceDto') {
      return deserialize<_i21.WalletBalanceDto>(data['data']);
    }
    if (dataClassName == 'CoinTransactionType') {
      return deserialize<_i22.CoinTransactionType>(data['data']);
    }
    if (dataClassName == 'TaskType') {
      return deserialize<_i23.TaskType>(data['data']);
    }
    if (dataClassName == 'NotFoundException') {
      return deserialize<_i24.NotFoundException>(data['data']);
    }
    if (dataClassName == 'ValidationException') {
      return deserialize<_i25.ValidationException>(data['data']);
    }
    if (dataClassName == 'CompleteLessonSessionRequest') {
      return deserialize<_i26.CompleteLessonSessionRequest>(data['data']);
    }
    if (dataClassName == 'CreateCoinTransactionRequest') {
      return deserialize<_i27.CreateCoinTransactionRequest>(data['data']);
    }
    if (dataClassName == 'GenerateExplanationRequest') {
      return deserialize<_i28.GenerateExplanationRequest>(data['data']);
    }
    if (dataClassName == 'GenerateHintRequest') {
      return deserialize<_i29.GenerateHintRequest>(data['data']);
    }
    if (dataClassName == 'AiResponse') {
      return deserialize<_i30.AiResponse>(data['data']);
    }
    if (dataClassName == 'Achievement') {
      return deserialize<_i31.Achievement>(data['data']);
    }
    if (dataClassName == 'CoinTransaction') {
      return deserialize<_i32.CoinTransaction>(data['data']);
    }
    if (dataClassName == 'Course') {
      return deserialize<_i33.Course>(data['data']);
    }
    if (dataClassName == 'LessonProgress') {
      return deserialize<_i34.LessonProgress>(data['data']);
    }
    if (dataClassName == 'Lesson') {
      return deserialize<_i35.Lesson>(data['data']);
    }
    if (dataClassName == 'Module') {
      return deserialize<_i36.Module>(data['data']);
    }
    if (dataClassName == 'TaskOption') {
      return deserialize<_i37.TaskOption>(data['data']);
    }
    if (dataClassName == 'Task') {
      return deserialize<_i38.Task>(data['data']);
    }
    if (dataClassName == 'TaskTestCase') {
      return deserialize<_i39.TaskTestCase>(data['data']);
    }
    if (dataClassName == 'UserAchievement') {
      return deserialize<_i40.UserAchievement>(data['data']);
    }
    if (dataClassName == 'UserCourse') {
      return deserialize<_i41.UserCourse>(data['data']);
    }
    if (dataClassName == 'UserStatistics') {
      return deserialize<_i42.UserStatistics>(data['data']);
    }
    if (dataClassName == 'UserWallet') {
      return deserialize<_i43.UserWallet>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i4.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i4.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i31.Achievement:
        return _i31.Achievement.t;
      case _i32.CoinTransaction:
        return _i32.CoinTransaction.t;
      case _i33.Course:
        return _i33.Course.t;
      case _i34.LessonProgress:
        return _i34.LessonProgress.t;
      case _i35.Lesson:
        return _i35.Lesson.t;
      case _i36.Module:
        return _i36.Module.t;
      case _i37.TaskOption:
        return _i37.TaskOption.t;
      case _i38.Task:
        return _i38.Task.t;
      case _i39.TaskTestCase:
        return _i39.TaskTestCase.t;
      case _i40.UserAchievement:
        return _i40.UserAchievement.t;
      case _i41.UserCourse:
        return _i41.UserCourse.t;
      case _i42.UserStatistics:
        return _i42.UserStatistics.t;
      case _i43.UserWallet:
        return _i43.UserWallet.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'praxis';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i3.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i4.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
