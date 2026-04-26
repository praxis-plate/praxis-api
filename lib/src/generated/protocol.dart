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
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i3;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i4;
import 'dto/access_profile_dto.dart' as _i5;
import 'dto/achievement_dto.dart' as _i6;
import 'dto/adaptive_learning_path_dto.dart' as _i7;
import 'dto/adaptive_topic_mastery_dto.dart' as _i8;
import 'dto/cms_task_option_input_dto.dart' as _i9;
import 'dto/cms_task_test_case_input_dto.dart' as _i10;
import 'dto/coin_transaction_dto.dart' as _i11;
import 'dto/course_analytics_dashboard_dto.dart' as _i12;
import 'dto/course_analytics_lesson_dto.dart' as _i13;
import 'dto/course_analytics_summary_dto.dart' as _i14;
import 'dto/course_analytics_task_dto.dart' as _i15;
import 'dto/course_analytics_wrong_answer_dto.dart' as _i16;
import 'dto/course_detail_dto.dart' as _i17;
import 'dto/course_dto.dart' as _i18;
import 'dto/course_recommendation_dto.dart' as _i19;
import 'dto/course_structure_dto.dart' as _i20;
import 'dto/course_structure_lesson_dto.dart' as _i21;
import 'dto/course_structure_module_dto.dart' as _i22;
import 'dto/course_structure_task_dto.dart' as _i23;
import 'dto/external_course_sync_dto.dart' as _i24;
import 'dto/external_integration_provider_dto.dart' as _i25;
import 'dto/external_video_session_dto.dart' as _i26;
import 'dto/lesson_completion_result_dto.dart' as _i27;
import 'dto/lesson_dto.dart' as _i28;
import 'dto/module_dto.dart' as _i29;
import 'dto/task_answer_result_dto.dart' as _i30;
import 'dto/task_answer_test_case_result_dto.dart' as _i31;
import 'dto/task_dto.dart' as _i32;
import 'dto/task_option_dto.dart' as _i33;
import 'dto/task_test_case_dto.dart' as _i34;
import 'dto/user_statistics_dto.dart' as _i35;
import 'dto/wallet_balance_dto.dart' as _i36;
import 'enums/adaptive_learning_path_type.dart' as _i37;
import 'enums/coin_transaction_type.dart' as _i38;
import 'enums/content_status.dart' as _i39;
import 'enums/external_integration_auth_scheme.dart' as _i40;
import 'enums/external_integration_kind.dart' as _i41;
import 'enums/external_integration_provider.dart' as _i42;
import 'enums/task_type.dart' as _i43;
import 'enums/user_role.dart' as _i44;
import 'exceptions/not_found_exception.dart' as _i45;
import 'exceptions/validation_exception.dart' as _i46;
import 'requests/complete_lesson_session_request.dart' as _i47;
import 'requests/create_coin_transaction_request.dart' as _i48;
import 'requests/create_course_request.dart' as _i49;
import 'requests/create_lesson_request.dart' as _i50;
import 'requests/create_module_request.dart' as _i51;
import 'requests/create_task_request.dart' as _i52;
import 'requests/generate_explanation_request.dart' as _i53;
import 'requests/generate_hint_request.dart' as _i54;
import 'requests/provision_external_video_session_request.dart' as _i55;
import 'requests/reorder_lessons_request.dart' as _i56;
import 'requests/reorder_modules_request.dart' as _i57;
import 'requests/reorder_tasks_request.dart' as _i58;
import 'requests/sync_course_to_external_provider_request.dart' as _i59;
import 'requests/update_course_request.dart' as _i60;
import 'requests/update_lesson_request.dart' as _i61;
import 'requests/update_module_request.dart' as _i62;
import 'requests/update_task_request.dart' as _i63;
import 'requests/upsert_task_options_request.dart' as _i64;
import 'requests/upsert_task_test_cases_request.dart' as _i65;
import 'responses/ai_response.dart' as _i66;
import 'tables/achievement_table.dart' as _i67;
import 'tables/coin_transaction_table.dart' as _i68;
import 'tables/course_table.dart' as _i69;
import 'tables/lesson_progress_table.dart' as _i70;
import 'tables/lesson_table.dart' as _i71;
import 'tables/module_table.dart' as _i72;
import 'tables/task_answer_attempt_table.dart' as _i73;
import 'tables/task_option_table.dart' as _i74;
import 'tables/task_table.dart' as _i75;
import 'tables/task_test_case_table.dart' as _i76;
import 'tables/user_achievement_table.dart' as _i77;
import 'tables/user_course_table.dart' as _i78;
import 'tables/user_statistics_table.dart' as _i79;
import 'tables/user_wallet_table.dart' as _i80;
import 'package:praxis_server/src/generated/dto/achievement_dto.dart' as _i81;
import 'package:praxis_server/src/generated/dto/course_dto.dart' as _i82;
import 'package:praxis_server/src/generated/dto/course_recommendation_dto.dart'
    as _i83;
import 'package:praxis_server/src/generated/dto/external_integration_provider_dto.dart'
    as _i84;
import 'package:praxis_server/src/generated/dto/lesson_dto.dart' as _i85;
import 'package:praxis_server/src/generated/dto/module_dto.dart' as _i86;
import 'package:praxis_server/src/generated/dto/task_dto.dart' as _i87;
import 'package:praxis_server/src/generated/dto/task_option_dto.dart' as _i88;
import 'package:praxis_server/src/generated/dto/task_test_case_dto.dart'
    as _i89;
import 'package:praxis_server/src/generated/dto/coin_transaction_dto.dart'
    as _i90;
export 'dto/access_profile_dto.dart';
export 'dto/achievement_dto.dart';
export 'dto/adaptive_learning_path_dto.dart';
export 'dto/adaptive_topic_mastery_dto.dart';
export 'dto/cms_task_option_input_dto.dart';
export 'dto/cms_task_test_case_input_dto.dart';
export 'dto/coin_transaction_dto.dart';
export 'dto/course_analytics_dashboard_dto.dart';
export 'dto/course_analytics_lesson_dto.dart';
export 'dto/course_analytics_summary_dto.dart';
export 'dto/course_analytics_task_dto.dart';
export 'dto/course_analytics_wrong_answer_dto.dart';
export 'dto/course_detail_dto.dart';
export 'dto/course_dto.dart';
export 'dto/course_recommendation_dto.dart';
export 'dto/course_structure_dto.dart';
export 'dto/course_structure_lesson_dto.dart';
export 'dto/course_structure_module_dto.dart';
export 'dto/course_structure_task_dto.dart';
export 'dto/external_course_sync_dto.dart';
export 'dto/external_integration_provider_dto.dart';
export 'dto/external_video_session_dto.dart';
export 'dto/lesson_completion_result_dto.dart';
export 'dto/lesson_dto.dart';
export 'dto/module_dto.dart';
export 'dto/task_answer_result_dto.dart';
export 'dto/task_answer_test_case_result_dto.dart';
export 'dto/task_dto.dart';
export 'dto/task_option_dto.dart';
export 'dto/task_test_case_dto.dart';
export 'dto/user_statistics_dto.dart';
export 'dto/wallet_balance_dto.dart';
export 'enums/adaptive_learning_path_type.dart';
export 'enums/coin_transaction_type.dart';
export 'enums/content_status.dart';
export 'enums/external_integration_auth_scheme.dart';
export 'enums/external_integration_kind.dart';
export 'enums/external_integration_provider.dart';
export 'enums/task_type.dart';
export 'enums/user_role.dart';
export 'exceptions/not_found_exception.dart';
export 'exceptions/validation_exception.dart';
export 'requests/complete_lesson_session_request.dart';
export 'requests/create_coin_transaction_request.dart';
export 'requests/create_course_request.dart';
export 'requests/create_lesson_request.dart';
export 'requests/create_module_request.dart';
export 'requests/create_task_request.dart';
export 'requests/generate_explanation_request.dart';
export 'requests/generate_hint_request.dart';
export 'requests/provision_external_video_session_request.dart';
export 'requests/reorder_lessons_request.dart';
export 'requests/reorder_modules_request.dart';
export 'requests/reorder_tasks_request.dart';
export 'requests/sync_course_to_external_provider_request.dart';
export 'requests/update_course_request.dart';
export 'requests/update_lesson_request.dart';
export 'requests/update_module_request.dart';
export 'requests/update_task_request.dart';
export 'requests/upsert_task_options_request.dart';
export 'requests/upsert_task_test_cases_request.dart';
export 'responses/ai_response.dart';
export 'tables/achievement_table.dart';
export 'tables/coin_transaction_table.dart';
export 'tables/course_table.dart';
export 'tables/lesson_progress_table.dart';
export 'tables/lesson_table.dart';
export 'tables/module_table.dart';
export 'tables/task_answer_attempt_table.dart';
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
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'contentStatus',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ContentStatus',
        ),
        _i2.ColumnDefinition(
          name: 'publishedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
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
      name: 'task_answer_attempt',
      dartName: 'TaskAnswerAttempt',
      schema: 'public',
      module: 'praxis',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'task_answer_attempt_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'authUserId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _i2.ColumnDefinition(
          name: 'taskId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'userAnswer',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'isCorrect',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'feedbackType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'submittedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'task_answer_attempt_pkey',
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
          indexName: 'task_answer_attempt_task_id_idx',
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
          indexName: 'task_answer_attempt_auth_user_id_idx',
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
          indexName: 'task_answer_attempt_task_id_submitted_at_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'taskId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'submittedAt',
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

    if (t == _i5.AccessProfileDto) {
      return _i5.AccessProfileDto.fromJson(data) as T;
    }
    if (t == _i6.AchievementDto) {
      return _i6.AchievementDto.fromJson(data) as T;
    }
    if (t == _i7.AdaptiveLearningPathDto) {
      return _i7.AdaptiveLearningPathDto.fromJson(data) as T;
    }
    if (t == _i8.AdaptiveTopicMasteryDto) {
      return _i8.AdaptiveTopicMasteryDto.fromJson(data) as T;
    }
    if (t == _i9.CmsTaskOptionInputDto) {
      return _i9.CmsTaskOptionInputDto.fromJson(data) as T;
    }
    if (t == _i10.CmsTaskTestCaseInputDto) {
      return _i10.CmsTaskTestCaseInputDto.fromJson(data) as T;
    }
    if (t == _i11.CoinTransactionDto) {
      return _i11.CoinTransactionDto.fromJson(data) as T;
    }
    if (t == _i12.CourseAnalyticsDashboardDto) {
      return _i12.CourseAnalyticsDashboardDto.fromJson(data) as T;
    }
    if (t == _i13.CourseAnalyticsLessonDto) {
      return _i13.CourseAnalyticsLessonDto.fromJson(data) as T;
    }
    if (t == _i14.CourseAnalyticsSummaryDto) {
      return _i14.CourseAnalyticsSummaryDto.fromJson(data) as T;
    }
    if (t == _i15.CourseAnalyticsTaskDto) {
      return _i15.CourseAnalyticsTaskDto.fromJson(data) as T;
    }
    if (t == _i16.CourseAnalyticsWrongAnswerDto) {
      return _i16.CourseAnalyticsWrongAnswerDto.fromJson(data) as T;
    }
    if (t == _i17.CourseDetailDto) {
      return _i17.CourseDetailDto.fromJson(data) as T;
    }
    if (t == _i18.CourseDto) {
      return _i18.CourseDto.fromJson(data) as T;
    }
    if (t == _i19.CourseRecommendationDto) {
      return _i19.CourseRecommendationDto.fromJson(data) as T;
    }
    if (t == _i20.CourseStructureDto) {
      return _i20.CourseStructureDto.fromJson(data) as T;
    }
    if (t == _i21.CourseStructureLessonDto) {
      return _i21.CourseStructureLessonDto.fromJson(data) as T;
    }
    if (t == _i22.CourseStructureModuleDto) {
      return _i22.CourseStructureModuleDto.fromJson(data) as T;
    }
    if (t == _i23.CourseStructureTaskDto) {
      return _i23.CourseStructureTaskDto.fromJson(data) as T;
    }
    if (t == _i24.ExternalCourseSyncDto) {
      return _i24.ExternalCourseSyncDto.fromJson(data) as T;
    }
    if (t == _i25.ExternalIntegrationProviderDto) {
      return _i25.ExternalIntegrationProviderDto.fromJson(data) as T;
    }
    if (t == _i26.ExternalVideoSessionDto) {
      return _i26.ExternalVideoSessionDto.fromJson(data) as T;
    }
    if (t == _i27.LessonCompletionResultDto) {
      return _i27.LessonCompletionResultDto.fromJson(data) as T;
    }
    if (t == _i28.LessonDto) {
      return _i28.LessonDto.fromJson(data) as T;
    }
    if (t == _i29.ModuleDto) {
      return _i29.ModuleDto.fromJson(data) as T;
    }
    if (t == _i30.TaskAnswerResultDto) {
      return _i30.TaskAnswerResultDto.fromJson(data) as T;
    }
    if (t == _i31.TaskAnswerTestCaseResultDto) {
      return _i31.TaskAnswerTestCaseResultDto.fromJson(data) as T;
    }
    if (t == _i32.TaskDto) {
      return _i32.TaskDto.fromJson(data) as T;
    }
    if (t == _i33.TaskOptionDto) {
      return _i33.TaskOptionDto.fromJson(data) as T;
    }
    if (t == _i34.TaskTestCaseDto) {
      return _i34.TaskTestCaseDto.fromJson(data) as T;
    }
    if (t == _i35.UserStatisticsDto) {
      return _i35.UserStatisticsDto.fromJson(data) as T;
    }
    if (t == _i36.WalletBalanceDto) {
      return _i36.WalletBalanceDto.fromJson(data) as T;
    }
    if (t == _i37.AdaptiveLearningPathType) {
      return _i37.AdaptiveLearningPathType.fromJson(data) as T;
    }
    if (t == _i38.CoinTransactionType) {
      return _i38.CoinTransactionType.fromJson(data) as T;
    }
    if (t == _i39.ContentStatus) {
      return _i39.ContentStatus.fromJson(data) as T;
    }
    if (t == _i40.ExternalIntegrationAuthScheme) {
      return _i40.ExternalIntegrationAuthScheme.fromJson(data) as T;
    }
    if (t == _i41.ExternalIntegrationKind) {
      return _i41.ExternalIntegrationKind.fromJson(data) as T;
    }
    if (t == _i42.ExternalIntegrationProvider) {
      return _i42.ExternalIntegrationProvider.fromJson(data) as T;
    }
    if (t == _i43.TaskType) {
      return _i43.TaskType.fromJson(data) as T;
    }
    if (t == _i44.UserRole) {
      return _i44.UserRole.fromJson(data) as T;
    }
    if (t == _i45.NotFoundException) {
      return _i45.NotFoundException.fromJson(data) as T;
    }
    if (t == _i46.ValidationException) {
      return _i46.ValidationException.fromJson(data) as T;
    }
    if (t == _i47.CompleteLessonSessionRequest) {
      return _i47.CompleteLessonSessionRequest.fromJson(data) as T;
    }
    if (t == _i48.CreateCoinTransactionRequest) {
      return _i48.CreateCoinTransactionRequest.fromJson(data) as T;
    }
    if (t == _i49.CreateCourseRequest) {
      return _i49.CreateCourseRequest.fromJson(data) as T;
    }
    if (t == _i50.CreateLessonRequest) {
      return _i50.CreateLessonRequest.fromJson(data) as T;
    }
    if (t == _i51.CreateModuleRequest) {
      return _i51.CreateModuleRequest.fromJson(data) as T;
    }
    if (t == _i52.CreateTaskRequest) {
      return _i52.CreateTaskRequest.fromJson(data) as T;
    }
    if (t == _i53.GenerateExplanationRequest) {
      return _i53.GenerateExplanationRequest.fromJson(data) as T;
    }
    if (t == _i54.GenerateHintRequest) {
      return _i54.GenerateHintRequest.fromJson(data) as T;
    }
    if (t == _i55.ProvisionExternalVideoSessionRequest) {
      return _i55.ProvisionExternalVideoSessionRequest.fromJson(data) as T;
    }
    if (t == _i56.ReorderLessonsRequest) {
      return _i56.ReorderLessonsRequest.fromJson(data) as T;
    }
    if (t == _i57.ReorderModulesRequest) {
      return _i57.ReorderModulesRequest.fromJson(data) as T;
    }
    if (t == _i58.ReorderTasksRequest) {
      return _i58.ReorderTasksRequest.fromJson(data) as T;
    }
    if (t == _i59.SyncCourseToExternalProviderRequest) {
      return _i59.SyncCourseToExternalProviderRequest.fromJson(data) as T;
    }
    if (t == _i60.UpdateCourseRequest) {
      return _i60.UpdateCourseRequest.fromJson(data) as T;
    }
    if (t == _i61.UpdateLessonRequest) {
      return _i61.UpdateLessonRequest.fromJson(data) as T;
    }
    if (t == _i62.UpdateModuleRequest) {
      return _i62.UpdateModuleRequest.fromJson(data) as T;
    }
    if (t == _i63.UpdateTaskRequest) {
      return _i63.UpdateTaskRequest.fromJson(data) as T;
    }
    if (t == _i64.UpsertTaskOptionsRequest) {
      return _i64.UpsertTaskOptionsRequest.fromJson(data) as T;
    }
    if (t == _i65.UpsertTaskTestCasesRequest) {
      return _i65.UpsertTaskTestCasesRequest.fromJson(data) as T;
    }
    if (t == _i66.AiResponse) {
      return _i66.AiResponse.fromJson(data) as T;
    }
    if (t == _i67.Achievement) {
      return _i67.Achievement.fromJson(data) as T;
    }
    if (t == _i68.CoinTransaction) {
      return _i68.CoinTransaction.fromJson(data) as T;
    }
    if (t == _i69.Course) {
      return _i69.Course.fromJson(data) as T;
    }
    if (t == _i70.LessonProgress) {
      return _i70.LessonProgress.fromJson(data) as T;
    }
    if (t == _i71.Lesson) {
      return _i71.Lesson.fromJson(data) as T;
    }
    if (t == _i72.Module) {
      return _i72.Module.fromJson(data) as T;
    }
    if (t == _i73.TaskAnswerAttempt) {
      return _i73.TaskAnswerAttempt.fromJson(data) as T;
    }
    if (t == _i74.TaskOption) {
      return _i74.TaskOption.fromJson(data) as T;
    }
    if (t == _i75.Task) {
      return _i75.Task.fromJson(data) as T;
    }
    if (t == _i76.TaskTestCase) {
      return _i76.TaskTestCase.fromJson(data) as T;
    }
    if (t == _i77.UserAchievement) {
      return _i77.UserAchievement.fromJson(data) as T;
    }
    if (t == _i78.UserCourse) {
      return _i78.UserCourse.fromJson(data) as T;
    }
    if (t == _i79.UserStatistics) {
      return _i79.UserStatistics.fromJson(data) as T;
    }
    if (t == _i80.UserWallet) {
      return _i80.UserWallet.fromJson(data) as T;
    }
    if (t == _i1.getType<_i5.AccessProfileDto?>()) {
      return (data != null ? _i5.AccessProfileDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.AchievementDto?>()) {
      return (data != null ? _i6.AchievementDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.AdaptiveLearningPathDto?>()) {
      return (data != null ? _i7.AdaptiveLearningPathDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i8.AdaptiveTopicMasteryDto?>()) {
      return (data != null ? _i8.AdaptiveTopicMasteryDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i9.CmsTaskOptionInputDto?>()) {
      return (data != null ? _i9.CmsTaskOptionInputDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i10.CmsTaskTestCaseInputDto?>()) {
      return (data != null ? _i10.CmsTaskTestCaseInputDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i11.CoinTransactionDto?>()) {
      return (data != null ? _i11.CoinTransactionDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i12.CourseAnalyticsDashboardDto?>()) {
      return (data != null
              ? _i12.CourseAnalyticsDashboardDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i13.CourseAnalyticsLessonDto?>()) {
      return (data != null
              ? _i13.CourseAnalyticsLessonDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i14.CourseAnalyticsSummaryDto?>()) {
      return (data != null
              ? _i14.CourseAnalyticsSummaryDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i15.CourseAnalyticsTaskDto?>()) {
      return (data != null ? _i15.CourseAnalyticsTaskDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i16.CourseAnalyticsWrongAnswerDto?>()) {
      return (data != null
              ? _i16.CourseAnalyticsWrongAnswerDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i17.CourseDetailDto?>()) {
      return (data != null ? _i17.CourseDetailDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.CourseDto?>()) {
      return (data != null ? _i18.CourseDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.CourseRecommendationDto?>()) {
      return (data != null ? _i19.CourseRecommendationDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i20.CourseStructureDto?>()) {
      return (data != null ? _i20.CourseStructureDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i21.CourseStructureLessonDto?>()) {
      return (data != null
              ? _i21.CourseStructureLessonDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i22.CourseStructureModuleDto?>()) {
      return (data != null
              ? _i22.CourseStructureModuleDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i23.CourseStructureTaskDto?>()) {
      return (data != null ? _i23.CourseStructureTaskDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i24.ExternalCourseSyncDto?>()) {
      return (data != null ? _i24.ExternalCourseSyncDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i25.ExternalIntegrationProviderDto?>()) {
      return (data != null
              ? _i25.ExternalIntegrationProviderDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i26.ExternalVideoSessionDto?>()) {
      return (data != null ? _i26.ExternalVideoSessionDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i27.LessonCompletionResultDto?>()) {
      return (data != null
              ? _i27.LessonCompletionResultDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i28.LessonDto?>()) {
      return (data != null ? _i28.LessonDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.ModuleDto?>()) {
      return (data != null ? _i29.ModuleDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.TaskAnswerResultDto?>()) {
      return (data != null ? _i30.TaskAnswerResultDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i31.TaskAnswerTestCaseResultDto?>()) {
      return (data != null
              ? _i31.TaskAnswerTestCaseResultDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i32.TaskDto?>()) {
      return (data != null ? _i32.TaskDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.TaskOptionDto?>()) {
      return (data != null ? _i33.TaskOptionDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.TaskTestCaseDto?>()) {
      return (data != null ? _i34.TaskTestCaseDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.UserStatisticsDto?>()) {
      return (data != null ? _i35.UserStatisticsDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.WalletBalanceDto?>()) {
      return (data != null ? _i36.WalletBalanceDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.AdaptiveLearningPathType?>()) {
      return (data != null
              ? _i37.AdaptiveLearningPathType.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i38.CoinTransactionType?>()) {
      return (data != null ? _i38.CoinTransactionType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i39.ContentStatus?>()) {
      return (data != null ? _i39.ContentStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.ExternalIntegrationAuthScheme?>()) {
      return (data != null
              ? _i40.ExternalIntegrationAuthScheme.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i41.ExternalIntegrationKind?>()) {
      return (data != null ? _i41.ExternalIntegrationKind.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i42.ExternalIntegrationProvider?>()) {
      return (data != null
              ? _i42.ExternalIntegrationProvider.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i43.TaskType?>()) {
      return (data != null ? _i43.TaskType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i44.UserRole?>()) {
      return (data != null ? _i44.UserRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i45.NotFoundException?>()) {
      return (data != null ? _i45.NotFoundException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i46.ValidationException?>()) {
      return (data != null ? _i46.ValidationException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i47.CompleteLessonSessionRequest?>()) {
      return (data != null
              ? _i47.CompleteLessonSessionRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i48.CreateCoinTransactionRequest?>()) {
      return (data != null
              ? _i48.CreateCoinTransactionRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i49.CreateCourseRequest?>()) {
      return (data != null ? _i49.CreateCourseRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i50.CreateLessonRequest?>()) {
      return (data != null ? _i50.CreateLessonRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i51.CreateModuleRequest?>()) {
      return (data != null ? _i51.CreateModuleRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i52.CreateTaskRequest?>()) {
      return (data != null ? _i52.CreateTaskRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i53.GenerateExplanationRequest?>()) {
      return (data != null
              ? _i53.GenerateExplanationRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i54.GenerateHintRequest?>()) {
      return (data != null ? _i54.GenerateHintRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i55.ProvisionExternalVideoSessionRequest?>()) {
      return (data != null
              ? _i55.ProvisionExternalVideoSessionRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i56.ReorderLessonsRequest?>()) {
      return (data != null ? _i56.ReorderLessonsRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i57.ReorderModulesRequest?>()) {
      return (data != null ? _i57.ReorderModulesRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i58.ReorderTasksRequest?>()) {
      return (data != null ? _i58.ReorderTasksRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i59.SyncCourseToExternalProviderRequest?>()) {
      return (data != null
              ? _i59.SyncCourseToExternalProviderRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i60.UpdateCourseRequest?>()) {
      return (data != null ? _i60.UpdateCourseRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i61.UpdateLessonRequest?>()) {
      return (data != null ? _i61.UpdateLessonRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i62.UpdateModuleRequest?>()) {
      return (data != null ? _i62.UpdateModuleRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i63.UpdateTaskRequest?>()) {
      return (data != null ? _i63.UpdateTaskRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i64.UpsertTaskOptionsRequest?>()) {
      return (data != null
              ? _i64.UpsertTaskOptionsRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i65.UpsertTaskTestCasesRequest?>()) {
      return (data != null
              ? _i65.UpsertTaskTestCasesRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i66.AiResponse?>()) {
      return (data != null ? _i66.AiResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i67.Achievement?>()) {
      return (data != null ? _i67.Achievement.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i68.CoinTransaction?>()) {
      return (data != null ? _i68.CoinTransaction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i69.Course?>()) {
      return (data != null ? _i69.Course.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i70.LessonProgress?>()) {
      return (data != null ? _i70.LessonProgress.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i71.Lesson?>()) {
      return (data != null ? _i71.Lesson.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i72.Module?>()) {
      return (data != null ? _i72.Module.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i73.TaskAnswerAttempt?>()) {
      return (data != null ? _i73.TaskAnswerAttempt.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i74.TaskOption?>()) {
      return (data != null ? _i74.TaskOption.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i75.Task?>()) {
      return (data != null ? _i75.Task.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i76.TaskTestCase?>()) {
      return (data != null ? _i76.TaskTestCase.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i77.UserAchievement?>()) {
      return (data != null ? _i77.UserAchievement.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i78.UserCourse?>()) {
      return (data != null ? _i78.UserCourse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i79.UserStatistics?>()) {
      return (data != null ? _i79.UserStatistics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i80.UserWallet?>()) {
      return (data != null ? _i80.UserWallet.fromJson(data) : null) as T;
    }
    if (t == List<_i44.UserRole>) {
      return (data as List).map((e) => deserialize<_i44.UserRole>(e)).toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i8.AdaptiveTopicMasteryDto>) {
      return (data as List)
              .map((e) => deserialize<_i8.AdaptiveTopicMasteryDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i13.CourseAnalyticsLessonDto>) {
      return (data as List)
              .map((e) => deserialize<_i13.CourseAnalyticsLessonDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i15.CourseAnalyticsTaskDto>) {
      return (data as List)
              .map((e) => deserialize<_i15.CourseAnalyticsTaskDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i16.CourseAnalyticsWrongAnswerDto>) {
      return (data as List)
              .map((e) => deserialize<_i16.CourseAnalyticsWrongAnswerDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i29.ModuleDto>) {
      return (data as List).map((e) => deserialize<_i29.ModuleDto>(e)).toList()
          as T;
    }
    if (t == List<_i28.LessonDto>) {
      return (data as List).map((e) => deserialize<_i28.LessonDto>(e)).toList()
          as T;
    }
    if (t == List<_i32.TaskDto>) {
      return (data as List).map((e) => deserialize<_i32.TaskDto>(e)).toList()
          as T;
    }
    if (t == List<_i22.CourseStructureModuleDto>) {
      return (data as List)
              .map((e) => deserialize<_i22.CourseStructureModuleDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i23.CourseStructureTaskDto>) {
      return (data as List)
              .map((e) => deserialize<_i23.CourseStructureTaskDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i21.CourseStructureLessonDto>) {
      return (data as List)
              .map((e) => deserialize<_i21.CourseStructureLessonDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i6.AchievementDto>) {
      return (data as List)
              .map((e) => deserialize<_i6.AchievementDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i31.TaskAnswerTestCaseResultDto>) {
      return (data as List)
              .map((e) => deserialize<_i31.TaskAnswerTestCaseResultDto>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i31.TaskAnswerTestCaseResultDto>?>()) {
      return (data != null
              ? (data as List)
                    .map(
                      (e) => deserialize<_i31.TaskAnswerTestCaseResultDto>(e),
                    )
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i33.TaskOptionDto>) {
      return (data as List)
              .map((e) => deserialize<_i33.TaskOptionDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i34.TaskTestCaseDto>) {
      return (data as List)
              .map((e) => deserialize<_i34.TaskTestCaseDto>(e))
              .toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i9.CmsTaskOptionInputDto>) {
      return (data as List)
              .map((e) => deserialize<_i9.CmsTaskOptionInputDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i10.CmsTaskTestCaseInputDto>) {
      return (data as List)
              .map((e) => deserialize<_i10.CmsTaskTestCaseInputDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i81.AchievementDto>) {
      return (data as List)
              .map((e) => deserialize<_i81.AchievementDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i82.CourseDto>) {
      return (data as List).map((e) => deserialize<_i82.CourseDto>(e)).toList()
          as T;
    }
    if (t == List<_i83.CourseRecommendationDto>) {
      return (data as List)
              .map((e) => deserialize<_i83.CourseRecommendationDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i84.ExternalIntegrationProviderDto>) {
      return (data as List)
              .map((e) => deserialize<_i84.ExternalIntegrationProviderDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i85.LessonDto>) {
      return (data as List).map((e) => deserialize<_i85.LessonDto>(e)).toList()
          as T;
    }
    if (t == List<_i86.ModuleDto>) {
      return (data as List).map((e) => deserialize<_i86.ModuleDto>(e)).toList()
          as T;
    }
    if (t == List<_i87.TaskDto>) {
      return (data as List).map((e) => deserialize<_i87.TaskDto>(e)).toList()
          as T;
    }
    if (t == List<_i88.TaskOptionDto>) {
      return (data as List)
              .map((e) => deserialize<_i88.TaskOptionDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i89.TaskTestCaseDto>) {
      return (data as List)
              .map((e) => deserialize<_i89.TaskTestCaseDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i90.CoinTransactionDto>) {
      return (data as List)
              .map((e) => deserialize<_i90.CoinTransactionDto>(e))
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
      _i5.AccessProfileDto => 'AccessProfileDto',
      _i6.AchievementDto => 'AchievementDto',
      _i7.AdaptiveLearningPathDto => 'AdaptiveLearningPathDto',
      _i8.AdaptiveTopicMasteryDto => 'AdaptiveTopicMasteryDto',
      _i9.CmsTaskOptionInputDto => 'CmsTaskOptionInputDto',
      _i10.CmsTaskTestCaseInputDto => 'CmsTaskTestCaseInputDto',
      _i11.CoinTransactionDto => 'CoinTransactionDto',
      _i12.CourseAnalyticsDashboardDto => 'CourseAnalyticsDashboardDto',
      _i13.CourseAnalyticsLessonDto => 'CourseAnalyticsLessonDto',
      _i14.CourseAnalyticsSummaryDto => 'CourseAnalyticsSummaryDto',
      _i15.CourseAnalyticsTaskDto => 'CourseAnalyticsTaskDto',
      _i16.CourseAnalyticsWrongAnswerDto => 'CourseAnalyticsWrongAnswerDto',
      _i17.CourseDetailDto => 'CourseDetailDto',
      _i18.CourseDto => 'CourseDto',
      _i19.CourseRecommendationDto => 'CourseRecommendationDto',
      _i20.CourseStructureDto => 'CourseStructureDto',
      _i21.CourseStructureLessonDto => 'CourseStructureLessonDto',
      _i22.CourseStructureModuleDto => 'CourseStructureModuleDto',
      _i23.CourseStructureTaskDto => 'CourseStructureTaskDto',
      _i24.ExternalCourseSyncDto => 'ExternalCourseSyncDto',
      _i25.ExternalIntegrationProviderDto => 'ExternalIntegrationProviderDto',
      _i26.ExternalVideoSessionDto => 'ExternalVideoSessionDto',
      _i27.LessonCompletionResultDto => 'LessonCompletionResultDto',
      _i28.LessonDto => 'LessonDto',
      _i29.ModuleDto => 'ModuleDto',
      _i30.TaskAnswerResultDto => 'TaskAnswerResultDto',
      _i31.TaskAnswerTestCaseResultDto => 'TaskAnswerTestCaseResultDto',
      _i32.TaskDto => 'TaskDto',
      _i33.TaskOptionDto => 'TaskOptionDto',
      _i34.TaskTestCaseDto => 'TaskTestCaseDto',
      _i35.UserStatisticsDto => 'UserStatisticsDto',
      _i36.WalletBalanceDto => 'WalletBalanceDto',
      _i37.AdaptiveLearningPathType => 'AdaptiveLearningPathType',
      _i38.CoinTransactionType => 'CoinTransactionType',
      _i39.ContentStatus => 'ContentStatus',
      _i40.ExternalIntegrationAuthScheme => 'ExternalIntegrationAuthScheme',
      _i41.ExternalIntegrationKind => 'ExternalIntegrationKind',
      _i42.ExternalIntegrationProvider => 'ExternalIntegrationProvider',
      _i43.TaskType => 'TaskType',
      _i44.UserRole => 'UserRole',
      _i45.NotFoundException => 'NotFoundException',
      _i46.ValidationException => 'ValidationException',
      _i47.CompleteLessonSessionRequest => 'CompleteLessonSessionRequest',
      _i48.CreateCoinTransactionRequest => 'CreateCoinTransactionRequest',
      _i49.CreateCourseRequest => 'CreateCourseRequest',
      _i50.CreateLessonRequest => 'CreateLessonRequest',
      _i51.CreateModuleRequest => 'CreateModuleRequest',
      _i52.CreateTaskRequest => 'CreateTaskRequest',
      _i53.GenerateExplanationRequest => 'GenerateExplanationRequest',
      _i54.GenerateHintRequest => 'GenerateHintRequest',
      _i55.ProvisionExternalVideoSessionRequest =>
        'ProvisionExternalVideoSessionRequest',
      _i56.ReorderLessonsRequest => 'ReorderLessonsRequest',
      _i57.ReorderModulesRequest => 'ReorderModulesRequest',
      _i58.ReorderTasksRequest => 'ReorderTasksRequest',
      _i59.SyncCourseToExternalProviderRequest =>
        'SyncCourseToExternalProviderRequest',
      _i60.UpdateCourseRequest => 'UpdateCourseRequest',
      _i61.UpdateLessonRequest => 'UpdateLessonRequest',
      _i62.UpdateModuleRequest => 'UpdateModuleRequest',
      _i63.UpdateTaskRequest => 'UpdateTaskRequest',
      _i64.UpsertTaskOptionsRequest => 'UpsertTaskOptionsRequest',
      _i65.UpsertTaskTestCasesRequest => 'UpsertTaskTestCasesRequest',
      _i66.AiResponse => 'AiResponse',
      _i67.Achievement => 'Achievement',
      _i68.CoinTransaction => 'CoinTransaction',
      _i69.Course => 'Course',
      _i70.LessonProgress => 'LessonProgress',
      _i71.Lesson => 'Lesson',
      _i72.Module => 'Module',
      _i73.TaskAnswerAttempt => 'TaskAnswerAttempt',
      _i74.TaskOption => 'TaskOption',
      _i75.Task => 'Task',
      _i76.TaskTestCase => 'TaskTestCase',
      _i77.UserAchievement => 'UserAchievement',
      _i78.UserCourse => 'UserCourse',
      _i79.UserStatistics => 'UserStatistics',
      _i80.UserWallet => 'UserWallet',
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
      case _i5.AccessProfileDto():
        return 'AccessProfileDto';
      case _i6.AchievementDto():
        return 'AchievementDto';
      case _i7.AdaptiveLearningPathDto():
        return 'AdaptiveLearningPathDto';
      case _i8.AdaptiveTopicMasteryDto():
        return 'AdaptiveTopicMasteryDto';
      case _i9.CmsTaskOptionInputDto():
        return 'CmsTaskOptionInputDto';
      case _i10.CmsTaskTestCaseInputDto():
        return 'CmsTaskTestCaseInputDto';
      case _i11.CoinTransactionDto():
        return 'CoinTransactionDto';
      case _i12.CourseAnalyticsDashboardDto():
        return 'CourseAnalyticsDashboardDto';
      case _i13.CourseAnalyticsLessonDto():
        return 'CourseAnalyticsLessonDto';
      case _i14.CourseAnalyticsSummaryDto():
        return 'CourseAnalyticsSummaryDto';
      case _i15.CourseAnalyticsTaskDto():
        return 'CourseAnalyticsTaskDto';
      case _i16.CourseAnalyticsWrongAnswerDto():
        return 'CourseAnalyticsWrongAnswerDto';
      case _i17.CourseDetailDto():
        return 'CourseDetailDto';
      case _i18.CourseDto():
        return 'CourseDto';
      case _i19.CourseRecommendationDto():
        return 'CourseRecommendationDto';
      case _i20.CourseStructureDto():
        return 'CourseStructureDto';
      case _i21.CourseStructureLessonDto():
        return 'CourseStructureLessonDto';
      case _i22.CourseStructureModuleDto():
        return 'CourseStructureModuleDto';
      case _i23.CourseStructureTaskDto():
        return 'CourseStructureTaskDto';
      case _i24.ExternalCourseSyncDto():
        return 'ExternalCourseSyncDto';
      case _i25.ExternalIntegrationProviderDto():
        return 'ExternalIntegrationProviderDto';
      case _i26.ExternalVideoSessionDto():
        return 'ExternalVideoSessionDto';
      case _i27.LessonCompletionResultDto():
        return 'LessonCompletionResultDto';
      case _i28.LessonDto():
        return 'LessonDto';
      case _i29.ModuleDto():
        return 'ModuleDto';
      case _i30.TaskAnswerResultDto():
        return 'TaskAnswerResultDto';
      case _i31.TaskAnswerTestCaseResultDto():
        return 'TaskAnswerTestCaseResultDto';
      case _i32.TaskDto():
        return 'TaskDto';
      case _i33.TaskOptionDto():
        return 'TaskOptionDto';
      case _i34.TaskTestCaseDto():
        return 'TaskTestCaseDto';
      case _i35.UserStatisticsDto():
        return 'UserStatisticsDto';
      case _i36.WalletBalanceDto():
        return 'WalletBalanceDto';
      case _i37.AdaptiveLearningPathType():
        return 'AdaptiveLearningPathType';
      case _i38.CoinTransactionType():
        return 'CoinTransactionType';
      case _i39.ContentStatus():
        return 'ContentStatus';
      case _i40.ExternalIntegrationAuthScheme():
        return 'ExternalIntegrationAuthScheme';
      case _i41.ExternalIntegrationKind():
        return 'ExternalIntegrationKind';
      case _i42.ExternalIntegrationProvider():
        return 'ExternalIntegrationProvider';
      case _i43.TaskType():
        return 'TaskType';
      case _i44.UserRole():
        return 'UserRole';
      case _i45.NotFoundException():
        return 'NotFoundException';
      case _i46.ValidationException():
        return 'ValidationException';
      case _i47.CompleteLessonSessionRequest():
        return 'CompleteLessonSessionRequest';
      case _i48.CreateCoinTransactionRequest():
        return 'CreateCoinTransactionRequest';
      case _i49.CreateCourseRequest():
        return 'CreateCourseRequest';
      case _i50.CreateLessonRequest():
        return 'CreateLessonRequest';
      case _i51.CreateModuleRequest():
        return 'CreateModuleRequest';
      case _i52.CreateTaskRequest():
        return 'CreateTaskRequest';
      case _i53.GenerateExplanationRequest():
        return 'GenerateExplanationRequest';
      case _i54.GenerateHintRequest():
        return 'GenerateHintRequest';
      case _i55.ProvisionExternalVideoSessionRequest():
        return 'ProvisionExternalVideoSessionRequest';
      case _i56.ReorderLessonsRequest():
        return 'ReorderLessonsRequest';
      case _i57.ReorderModulesRequest():
        return 'ReorderModulesRequest';
      case _i58.ReorderTasksRequest():
        return 'ReorderTasksRequest';
      case _i59.SyncCourseToExternalProviderRequest():
        return 'SyncCourseToExternalProviderRequest';
      case _i60.UpdateCourseRequest():
        return 'UpdateCourseRequest';
      case _i61.UpdateLessonRequest():
        return 'UpdateLessonRequest';
      case _i62.UpdateModuleRequest():
        return 'UpdateModuleRequest';
      case _i63.UpdateTaskRequest():
        return 'UpdateTaskRequest';
      case _i64.UpsertTaskOptionsRequest():
        return 'UpsertTaskOptionsRequest';
      case _i65.UpsertTaskTestCasesRequest():
        return 'UpsertTaskTestCasesRequest';
      case _i66.AiResponse():
        return 'AiResponse';
      case _i67.Achievement():
        return 'Achievement';
      case _i68.CoinTransaction():
        return 'CoinTransaction';
      case _i69.Course():
        return 'Course';
      case _i70.LessonProgress():
        return 'LessonProgress';
      case _i71.Lesson():
        return 'Lesson';
      case _i72.Module():
        return 'Module';
      case _i73.TaskAnswerAttempt():
        return 'TaskAnswerAttempt';
      case _i74.TaskOption():
        return 'TaskOption';
      case _i75.Task():
        return 'Task';
      case _i76.TaskTestCase():
        return 'TaskTestCase';
      case _i77.UserAchievement():
        return 'UserAchievement';
      case _i78.UserCourse():
        return 'UserCourse';
      case _i79.UserStatistics():
        return 'UserStatistics';
      case _i80.UserWallet():
        return 'UserWallet';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    className = _i4.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'AccessProfileDto') {
      return deserialize<_i5.AccessProfileDto>(data['data']);
    }
    if (dataClassName == 'AchievementDto') {
      return deserialize<_i6.AchievementDto>(data['data']);
    }
    if (dataClassName == 'AdaptiveLearningPathDto') {
      return deserialize<_i7.AdaptiveLearningPathDto>(data['data']);
    }
    if (dataClassName == 'AdaptiveTopicMasteryDto') {
      return deserialize<_i8.AdaptiveTopicMasteryDto>(data['data']);
    }
    if (dataClassName == 'CmsTaskOptionInputDto') {
      return deserialize<_i9.CmsTaskOptionInputDto>(data['data']);
    }
    if (dataClassName == 'CmsTaskTestCaseInputDto') {
      return deserialize<_i10.CmsTaskTestCaseInputDto>(data['data']);
    }
    if (dataClassName == 'CoinTransactionDto') {
      return deserialize<_i11.CoinTransactionDto>(data['data']);
    }
    if (dataClassName == 'CourseAnalyticsDashboardDto') {
      return deserialize<_i12.CourseAnalyticsDashboardDto>(data['data']);
    }
    if (dataClassName == 'CourseAnalyticsLessonDto') {
      return deserialize<_i13.CourseAnalyticsLessonDto>(data['data']);
    }
    if (dataClassName == 'CourseAnalyticsSummaryDto') {
      return deserialize<_i14.CourseAnalyticsSummaryDto>(data['data']);
    }
    if (dataClassName == 'CourseAnalyticsTaskDto') {
      return deserialize<_i15.CourseAnalyticsTaskDto>(data['data']);
    }
    if (dataClassName == 'CourseAnalyticsWrongAnswerDto') {
      return deserialize<_i16.CourseAnalyticsWrongAnswerDto>(data['data']);
    }
    if (dataClassName == 'CourseDetailDto') {
      return deserialize<_i17.CourseDetailDto>(data['data']);
    }
    if (dataClassName == 'CourseDto') {
      return deserialize<_i18.CourseDto>(data['data']);
    }
    if (dataClassName == 'CourseRecommendationDto') {
      return deserialize<_i19.CourseRecommendationDto>(data['data']);
    }
    if (dataClassName == 'CourseStructureDto') {
      return deserialize<_i20.CourseStructureDto>(data['data']);
    }
    if (dataClassName == 'CourseStructureLessonDto') {
      return deserialize<_i21.CourseStructureLessonDto>(data['data']);
    }
    if (dataClassName == 'CourseStructureModuleDto') {
      return deserialize<_i22.CourseStructureModuleDto>(data['data']);
    }
    if (dataClassName == 'CourseStructureTaskDto') {
      return deserialize<_i23.CourseStructureTaskDto>(data['data']);
    }
    if (dataClassName == 'ExternalCourseSyncDto') {
      return deserialize<_i24.ExternalCourseSyncDto>(data['data']);
    }
    if (dataClassName == 'ExternalIntegrationProviderDto') {
      return deserialize<_i25.ExternalIntegrationProviderDto>(data['data']);
    }
    if (dataClassName == 'ExternalVideoSessionDto') {
      return deserialize<_i26.ExternalVideoSessionDto>(data['data']);
    }
    if (dataClassName == 'LessonCompletionResultDto') {
      return deserialize<_i27.LessonCompletionResultDto>(data['data']);
    }
    if (dataClassName == 'LessonDto') {
      return deserialize<_i28.LessonDto>(data['data']);
    }
    if (dataClassName == 'ModuleDto') {
      return deserialize<_i29.ModuleDto>(data['data']);
    }
    if (dataClassName == 'TaskAnswerResultDto') {
      return deserialize<_i30.TaskAnswerResultDto>(data['data']);
    }
    if (dataClassName == 'TaskAnswerTestCaseResultDto') {
      return deserialize<_i31.TaskAnswerTestCaseResultDto>(data['data']);
    }
    if (dataClassName == 'TaskDto') {
      return deserialize<_i32.TaskDto>(data['data']);
    }
    if (dataClassName == 'TaskOptionDto') {
      return deserialize<_i33.TaskOptionDto>(data['data']);
    }
    if (dataClassName == 'TaskTestCaseDto') {
      return deserialize<_i34.TaskTestCaseDto>(data['data']);
    }
    if (dataClassName == 'UserStatisticsDto') {
      return deserialize<_i35.UserStatisticsDto>(data['data']);
    }
    if (dataClassName == 'WalletBalanceDto') {
      return deserialize<_i36.WalletBalanceDto>(data['data']);
    }
    if (dataClassName == 'AdaptiveLearningPathType') {
      return deserialize<_i37.AdaptiveLearningPathType>(data['data']);
    }
    if (dataClassName == 'CoinTransactionType') {
      return deserialize<_i38.CoinTransactionType>(data['data']);
    }
    if (dataClassName == 'ContentStatus') {
      return deserialize<_i39.ContentStatus>(data['data']);
    }
    if (dataClassName == 'ExternalIntegrationAuthScheme') {
      return deserialize<_i40.ExternalIntegrationAuthScheme>(data['data']);
    }
    if (dataClassName == 'ExternalIntegrationKind') {
      return deserialize<_i41.ExternalIntegrationKind>(data['data']);
    }
    if (dataClassName == 'ExternalIntegrationProvider') {
      return deserialize<_i42.ExternalIntegrationProvider>(data['data']);
    }
    if (dataClassName == 'TaskType') {
      return deserialize<_i43.TaskType>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_i44.UserRole>(data['data']);
    }
    if (dataClassName == 'NotFoundException') {
      return deserialize<_i45.NotFoundException>(data['data']);
    }
    if (dataClassName == 'ValidationException') {
      return deserialize<_i46.ValidationException>(data['data']);
    }
    if (dataClassName == 'CompleteLessonSessionRequest') {
      return deserialize<_i47.CompleteLessonSessionRequest>(data['data']);
    }
    if (dataClassName == 'CreateCoinTransactionRequest') {
      return deserialize<_i48.CreateCoinTransactionRequest>(data['data']);
    }
    if (dataClassName == 'CreateCourseRequest') {
      return deserialize<_i49.CreateCourseRequest>(data['data']);
    }
    if (dataClassName == 'CreateLessonRequest') {
      return deserialize<_i50.CreateLessonRequest>(data['data']);
    }
    if (dataClassName == 'CreateModuleRequest') {
      return deserialize<_i51.CreateModuleRequest>(data['data']);
    }
    if (dataClassName == 'CreateTaskRequest') {
      return deserialize<_i52.CreateTaskRequest>(data['data']);
    }
    if (dataClassName == 'GenerateExplanationRequest') {
      return deserialize<_i53.GenerateExplanationRequest>(data['data']);
    }
    if (dataClassName == 'GenerateHintRequest') {
      return deserialize<_i54.GenerateHintRequest>(data['data']);
    }
    if (dataClassName == 'ProvisionExternalVideoSessionRequest') {
      return deserialize<_i55.ProvisionExternalVideoSessionRequest>(
        data['data'],
      );
    }
    if (dataClassName == 'ReorderLessonsRequest') {
      return deserialize<_i56.ReorderLessonsRequest>(data['data']);
    }
    if (dataClassName == 'ReorderModulesRequest') {
      return deserialize<_i57.ReorderModulesRequest>(data['data']);
    }
    if (dataClassName == 'ReorderTasksRequest') {
      return deserialize<_i58.ReorderTasksRequest>(data['data']);
    }
    if (dataClassName == 'SyncCourseToExternalProviderRequest') {
      return deserialize<_i59.SyncCourseToExternalProviderRequest>(
        data['data'],
      );
    }
    if (dataClassName == 'UpdateCourseRequest') {
      return deserialize<_i60.UpdateCourseRequest>(data['data']);
    }
    if (dataClassName == 'UpdateLessonRequest') {
      return deserialize<_i61.UpdateLessonRequest>(data['data']);
    }
    if (dataClassName == 'UpdateModuleRequest') {
      return deserialize<_i62.UpdateModuleRequest>(data['data']);
    }
    if (dataClassName == 'UpdateTaskRequest') {
      return deserialize<_i63.UpdateTaskRequest>(data['data']);
    }
    if (dataClassName == 'UpsertTaskOptionsRequest') {
      return deserialize<_i64.UpsertTaskOptionsRequest>(data['data']);
    }
    if (dataClassName == 'UpsertTaskTestCasesRequest') {
      return deserialize<_i65.UpsertTaskTestCasesRequest>(data['data']);
    }
    if (dataClassName == 'AiResponse') {
      return deserialize<_i66.AiResponse>(data['data']);
    }
    if (dataClassName == 'Achievement') {
      return deserialize<_i67.Achievement>(data['data']);
    }
    if (dataClassName == 'CoinTransaction') {
      return deserialize<_i68.CoinTransaction>(data['data']);
    }
    if (dataClassName == 'Course') {
      return deserialize<_i69.Course>(data['data']);
    }
    if (dataClassName == 'LessonProgress') {
      return deserialize<_i70.LessonProgress>(data['data']);
    }
    if (dataClassName == 'Lesson') {
      return deserialize<_i71.Lesson>(data['data']);
    }
    if (dataClassName == 'Module') {
      return deserialize<_i72.Module>(data['data']);
    }
    if (dataClassName == 'TaskAnswerAttempt') {
      return deserialize<_i73.TaskAnswerAttempt>(data['data']);
    }
    if (dataClassName == 'TaskOption') {
      return deserialize<_i74.TaskOption>(data['data']);
    }
    if (dataClassName == 'Task') {
      return deserialize<_i75.Task>(data['data']);
    }
    if (dataClassName == 'TaskTestCase') {
      return deserialize<_i76.TaskTestCase>(data['data']);
    }
    if (dataClassName == 'UserAchievement') {
      return deserialize<_i77.UserAchievement>(data['data']);
    }
    if (dataClassName == 'UserCourse') {
      return deserialize<_i78.UserCourse>(data['data']);
    }
    if (dataClassName == 'UserStatistics') {
      return deserialize<_i79.UserStatistics>(data['data']);
    }
    if (dataClassName == 'UserWallet') {
      return deserialize<_i80.UserWallet>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
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
      case _i67.Achievement:
        return _i67.Achievement.t;
      case _i68.CoinTransaction:
        return _i68.CoinTransaction.t;
      case _i69.Course:
        return _i69.Course.t;
      case _i70.LessonProgress:
        return _i70.LessonProgress.t;
      case _i71.Lesson:
        return _i71.Lesson.t;
      case _i72.Module:
        return _i72.Module.t;
      case _i73.TaskAnswerAttempt:
        return _i73.TaskAnswerAttempt.t;
      case _i74.TaskOption:
        return _i74.TaskOption.t;
      case _i75.Task:
        return _i75.Task.t;
      case _i76.TaskTestCase:
        return _i76.TaskTestCase.t;
      case _i77.UserAchievement:
        return _i77.UserAchievement.t;
      case _i78.UserCourse:
        return _i78.UserCourse.t;
      case _i79.UserStatistics:
        return _i79.UserStatistics.t;
      case _i80.UserWallet:
        return _i80.UserWallet.t;
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
