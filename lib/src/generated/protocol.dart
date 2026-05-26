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
import 'dto/cms_media_dto.dart' as _i9;
import 'dto/cms_task_option_input_dto.dart' as _i10;
import 'dto/cms_task_test_case_input_dto.dart' as _i11;
import 'dto/coin_transaction_dto.dart' as _i12;
import 'dto/course_analytics_dashboard_dto.dart' as _i13;
import 'dto/course_analytics_lesson_dto.dart' as _i14;
import 'dto/course_analytics_summary_dto.dart' as _i15;
import 'dto/course_analytics_task_dto.dart' as _i16;
import 'dto/course_analytics_wrong_answer_dto.dart' as _i17;
import 'dto/course_detail_dto.dart' as _i18;
import 'dto/course_dto.dart' as _i19;
import 'dto/course_import_lesson_dto.dart' as _i20;
import 'dto/course_import_module_dto.dart' as _i21;
import 'dto/course_import_result_dto.dart' as _i22;
import 'dto/course_import_task_dto.dart' as _i23;
import 'dto/course_recommendation_dto.dart' as _i24;
import 'dto/course_review_dto.dart' as _i25;
import 'dto/course_structure_dto.dart' as _i26;
import 'dto/course_structure_lesson_dto.dart' as _i27;
import 'dto/course_structure_module_dto.dart' as _i28;
import 'dto/course_structure_task_dto.dart' as _i29;
import 'dto/external_course_sync_dto.dart' as _i30;
import 'dto/external_integration_provider_dto.dart' as _i31;
import 'dto/external_video_session_dto.dart' as _i32;
import 'dto/governance_user_dto.dart' as _i33;
import 'dto/lesson_completion_result_dto.dart' as _i34;
import 'dto/lesson_content_block_dto.dart' as _i35;
import 'dto/lesson_content_document_dto.dart' as _i36;
import 'dto/lesson_dto.dart' as _i37;
import 'dto/lesson_progress_dto.dart' as _i38;
import 'dto/module_dto.dart' as _i39;
import 'dto/task_answer_result_dto.dart' as _i40;
import 'dto/task_answer_test_case_result_dto.dart' as _i41;
import 'dto/task_dto.dart' as _i42;
import 'dto/task_option_dto.dart' as _i43;
import 'dto/task_test_case_dto.dart' as _i44;
import 'dto/user_statistics_dto.dart' as _i45;
import 'dto/wallet_balance_dto.dart' as _i46;
import 'enums/adaptive_learning_path_type.dart' as _i47;
import 'enums/coin_transaction_type.dart' as _i48;
import 'enums/content_status.dart' as _i49;
import 'enums/external_integration_auth_scheme.dart' as _i50;
import 'enums/external_integration_kind.dart' as _i51;
import 'enums/external_integration_provider.dart' as _i52;
import 'enums/lesson_content_block_type.dart' as _i53;
import 'enums/task_type.dart' as _i54;
import 'enums/user_role.dart' as _i55;
import 'exceptions/not_found_exception.dart' as _i56;
import 'exceptions/validation_exception.dart' as _i57;
import 'requests/complete_lesson_session_request.dart' as _i58;
import 'requests/create_coin_transaction_request.dart' as _i59;
import 'requests/create_course_request.dart' as _i60;
import 'requests/create_course_review_request.dart' as _i61;
import 'requests/create_lesson_request.dart' as _i62;
import 'requests/create_module_request.dart' as _i63;
import 'requests/create_task_request.dart' as _i64;
import 'requests/generate_explanation_request.dart' as _i65;
import 'requests/generate_hint_request.dart' as _i66;
import 'requests/import_course_request.dart' as _i67;
import 'requests/provision_external_video_session_request.dart' as _i68;
import 'requests/reorder_lessons_request.dart' as _i69;
import 'requests/reorder_modules_request.dart' as _i70;
import 'requests/reorder_tasks_request.dart' as _i71;
import 'requests/sync_course_to_external_provider_request.dart' as _i72;
import 'requests/update_course_request.dart' as _i73;
import 'requests/update_lesson_request.dart' as _i74;
import 'requests/update_module_request.dart' as _i75;
import 'requests/update_task_request.dart' as _i76;
import 'requests/upload_cms_media_request.dart' as _i77;
import 'requests/upsert_task_options_request.dart' as _i78;
import 'requests/upsert_task_test_cases_request.dart' as _i79;
import 'responses/ai_response.dart' as _i80;
import 'tables/achievement_table.dart' as _i81;
import 'tables/coin_transaction_table.dart' as _i82;
import 'tables/course_review_table.dart' as _i83;
import 'tables/course_table.dart' as _i84;
import 'tables/lesson_progress_table.dart' as _i85;
import 'tables/lesson_table.dart' as _i86;
import 'tables/module_table.dart' as _i87;
import 'tables/task_answer_attempt_table.dart' as _i88;
import 'tables/task_option_table.dart' as _i89;
import 'tables/task_table.dart' as _i90;
import 'tables/task_test_case_table.dart' as _i91;
import 'tables/user_achievement_table.dart' as _i92;
import 'tables/user_course_table.dart' as _i93;
import 'tables/user_statistics_table.dart' as _i94;
import 'tables/user_wallet_table.dart' as _i95;
import 'package:praxis_server/src/generated/dto/achievement_dto.dart' as _i96;
import 'package:praxis_server/src/generated/dto/governance_user_dto.dart'
    as _i97;
import 'package:praxis_server/src/generated/dto/course_dto.dart' as _i98;
import 'package:praxis_server/src/generated/dto/course_recommendation_dto.dart'
    as _i99;
import 'package:praxis_server/src/generated/dto/external_integration_provider_dto.dart'
    as _i100;
import 'package:praxis_server/src/generated/dto/lesson_dto.dart' as _i101;
import 'package:praxis_server/src/generated/dto/lesson_progress_dto.dart'
    as _i102;
import 'package:praxis_server/src/generated/dto/module_dto.dart' as _i103;
import 'package:praxis_server/src/generated/dto/task_dto.dart' as _i104;
import 'package:praxis_server/src/generated/dto/task_option_dto.dart' as _i105;
import 'package:praxis_server/src/generated/dto/task_test_case_dto.dart'
    as _i106;
import 'package:praxis_server/src/generated/dto/coin_transaction_dto.dart'
    as _i107;
export 'dto/access_profile_dto.dart';
export 'dto/achievement_dto.dart';
export 'dto/adaptive_learning_path_dto.dart';
export 'dto/adaptive_topic_mastery_dto.dart';
export 'dto/cms_media_dto.dart';
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
export 'dto/course_import_lesson_dto.dart';
export 'dto/course_import_module_dto.dart';
export 'dto/course_import_result_dto.dart';
export 'dto/course_import_task_dto.dart';
export 'dto/course_recommendation_dto.dart';
export 'dto/course_review_dto.dart';
export 'dto/course_structure_dto.dart';
export 'dto/course_structure_lesson_dto.dart';
export 'dto/course_structure_module_dto.dart';
export 'dto/course_structure_task_dto.dart';
export 'dto/external_course_sync_dto.dart';
export 'dto/external_integration_provider_dto.dart';
export 'dto/external_video_session_dto.dart';
export 'dto/governance_user_dto.dart';
export 'dto/lesson_completion_result_dto.dart';
export 'dto/lesson_content_block_dto.dart';
export 'dto/lesson_content_document_dto.dart';
export 'dto/lesson_dto.dart';
export 'dto/lesson_progress_dto.dart';
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
export 'enums/lesson_content_block_type.dart';
export 'enums/task_type.dart';
export 'enums/user_role.dart';
export 'exceptions/not_found_exception.dart';
export 'exceptions/validation_exception.dart';
export 'requests/complete_lesson_session_request.dart';
export 'requests/create_coin_transaction_request.dart';
export 'requests/create_course_request.dart';
export 'requests/create_course_review_request.dart';
export 'requests/create_lesson_request.dart';
export 'requests/create_module_request.dart';
export 'requests/create_task_request.dart';
export 'requests/generate_explanation_request.dart';
export 'requests/generate_hint_request.dart';
export 'requests/import_course_request.dart';
export 'requests/provision_external_video_session_request.dart';
export 'requests/reorder_lessons_request.dart';
export 'requests/reorder_modules_request.dart';
export 'requests/reorder_tasks_request.dart';
export 'requests/sync_course_to_external_provider_request.dart';
export 'requests/update_course_request.dart';
export 'requests/update_lesson_request.dart';
export 'requests/update_module_request.dart';
export 'requests/update_task_request.dart';
export 'requests/upload_cms_media_request.dart';
export 'requests/upsert_task_options_request.dart';
export 'requests/upsert_task_test_cases_request.dart';
export 'responses/ai_response.dart';
export 'tables/achievement_table.dart';
export 'tables/coin_transaction_table.dart';
export 'tables/course_review_table.dart';
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
          name: 'difficultyLevel',
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
      name: 'course_review',
      dartName: 'CourseReview',
      schema: 'public',
      module: 'praxis',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'course_review_id_seq\'::regclass)',
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
          name: 'rating',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'comment',
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
          indexName: 'course_review_pkey',
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
          indexName: 'course_review_course_id_idx',
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
          indexName: 'course_review_auth_user_id_course_id_unique',
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
          name: 'completionXp',
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
    if (t == _i9.CmsMediaDto) {
      return _i9.CmsMediaDto.fromJson(data) as T;
    }
    if (t == _i10.CmsTaskOptionInputDto) {
      return _i10.CmsTaskOptionInputDto.fromJson(data) as T;
    }
    if (t == _i11.CmsTaskTestCaseInputDto) {
      return _i11.CmsTaskTestCaseInputDto.fromJson(data) as T;
    }
    if (t == _i12.CoinTransactionDto) {
      return _i12.CoinTransactionDto.fromJson(data) as T;
    }
    if (t == _i13.CourseAnalyticsDashboardDto) {
      return _i13.CourseAnalyticsDashboardDto.fromJson(data) as T;
    }
    if (t == _i14.CourseAnalyticsLessonDto) {
      return _i14.CourseAnalyticsLessonDto.fromJson(data) as T;
    }
    if (t == _i15.CourseAnalyticsSummaryDto) {
      return _i15.CourseAnalyticsSummaryDto.fromJson(data) as T;
    }
    if (t == _i16.CourseAnalyticsTaskDto) {
      return _i16.CourseAnalyticsTaskDto.fromJson(data) as T;
    }
    if (t == _i17.CourseAnalyticsWrongAnswerDto) {
      return _i17.CourseAnalyticsWrongAnswerDto.fromJson(data) as T;
    }
    if (t == _i18.CourseDetailDto) {
      return _i18.CourseDetailDto.fromJson(data) as T;
    }
    if (t == _i19.CourseDto) {
      return _i19.CourseDto.fromJson(data) as T;
    }
    if (t == _i20.CourseImportLessonDto) {
      return _i20.CourseImportLessonDto.fromJson(data) as T;
    }
    if (t == _i21.CourseImportModuleDto) {
      return _i21.CourseImportModuleDto.fromJson(data) as T;
    }
    if (t == _i22.CourseImportResultDto) {
      return _i22.CourseImportResultDto.fromJson(data) as T;
    }
    if (t == _i23.CourseImportTaskDto) {
      return _i23.CourseImportTaskDto.fromJson(data) as T;
    }
    if (t == _i24.CourseRecommendationDto) {
      return _i24.CourseRecommendationDto.fromJson(data) as T;
    }
    if (t == _i25.CourseReviewDto) {
      return _i25.CourseReviewDto.fromJson(data) as T;
    }
    if (t == _i26.CourseStructureDto) {
      return _i26.CourseStructureDto.fromJson(data) as T;
    }
    if (t == _i27.CourseStructureLessonDto) {
      return _i27.CourseStructureLessonDto.fromJson(data) as T;
    }
    if (t == _i28.CourseStructureModuleDto) {
      return _i28.CourseStructureModuleDto.fromJson(data) as T;
    }
    if (t == _i29.CourseStructureTaskDto) {
      return _i29.CourseStructureTaskDto.fromJson(data) as T;
    }
    if (t == _i30.ExternalCourseSyncDto) {
      return _i30.ExternalCourseSyncDto.fromJson(data) as T;
    }
    if (t == _i31.ExternalIntegrationProviderDto) {
      return _i31.ExternalIntegrationProviderDto.fromJson(data) as T;
    }
    if (t == _i32.ExternalVideoSessionDto) {
      return _i32.ExternalVideoSessionDto.fromJson(data) as T;
    }
    if (t == _i33.GovernanceUserDto) {
      return _i33.GovernanceUserDto.fromJson(data) as T;
    }
    if (t == _i34.LessonCompletionResultDto) {
      return _i34.LessonCompletionResultDto.fromJson(data) as T;
    }
    if (t == _i35.LessonContentBlockDto) {
      return _i35.LessonContentBlockDto.fromJson(data) as T;
    }
    if (t == _i36.LessonContentDocumentDto) {
      return _i36.LessonContentDocumentDto.fromJson(data) as T;
    }
    if (t == _i37.LessonDto) {
      return _i37.LessonDto.fromJson(data) as T;
    }
    if (t == _i38.LessonProgressDto) {
      return _i38.LessonProgressDto.fromJson(data) as T;
    }
    if (t == _i39.ModuleDto) {
      return _i39.ModuleDto.fromJson(data) as T;
    }
    if (t == _i40.TaskAnswerResultDto) {
      return _i40.TaskAnswerResultDto.fromJson(data) as T;
    }
    if (t == _i41.TaskAnswerTestCaseResultDto) {
      return _i41.TaskAnswerTestCaseResultDto.fromJson(data) as T;
    }
    if (t == _i42.TaskDto) {
      return _i42.TaskDto.fromJson(data) as T;
    }
    if (t == _i43.TaskOptionDto) {
      return _i43.TaskOptionDto.fromJson(data) as T;
    }
    if (t == _i44.TaskTestCaseDto) {
      return _i44.TaskTestCaseDto.fromJson(data) as T;
    }
    if (t == _i45.UserStatisticsDto) {
      return _i45.UserStatisticsDto.fromJson(data) as T;
    }
    if (t == _i46.WalletBalanceDto) {
      return _i46.WalletBalanceDto.fromJson(data) as T;
    }
    if (t == _i47.AdaptiveLearningPathType) {
      return _i47.AdaptiveLearningPathType.fromJson(data) as T;
    }
    if (t == _i48.CoinTransactionType) {
      return _i48.CoinTransactionType.fromJson(data) as T;
    }
    if (t == _i49.ContentStatus) {
      return _i49.ContentStatus.fromJson(data) as T;
    }
    if (t == _i50.ExternalIntegrationAuthScheme) {
      return _i50.ExternalIntegrationAuthScheme.fromJson(data) as T;
    }
    if (t == _i51.ExternalIntegrationKind) {
      return _i51.ExternalIntegrationKind.fromJson(data) as T;
    }
    if (t == _i52.ExternalIntegrationProvider) {
      return _i52.ExternalIntegrationProvider.fromJson(data) as T;
    }
    if (t == _i53.LessonContentBlockType) {
      return _i53.LessonContentBlockType.fromJson(data) as T;
    }
    if (t == _i54.TaskType) {
      return _i54.TaskType.fromJson(data) as T;
    }
    if (t == _i55.UserRole) {
      return _i55.UserRole.fromJson(data) as T;
    }
    if (t == _i56.NotFoundException) {
      return _i56.NotFoundException.fromJson(data) as T;
    }
    if (t == _i57.ValidationException) {
      return _i57.ValidationException.fromJson(data) as T;
    }
    if (t == _i58.CompleteLessonSessionRequest) {
      return _i58.CompleteLessonSessionRequest.fromJson(data) as T;
    }
    if (t == _i59.CreateCoinTransactionRequest) {
      return _i59.CreateCoinTransactionRequest.fromJson(data) as T;
    }
    if (t == _i60.CreateCourseRequest) {
      return _i60.CreateCourseRequest.fromJson(data) as T;
    }
    if (t == _i61.CreateCourseReviewRequest) {
      return _i61.CreateCourseReviewRequest.fromJson(data) as T;
    }
    if (t == _i62.CreateLessonRequest) {
      return _i62.CreateLessonRequest.fromJson(data) as T;
    }
    if (t == _i63.CreateModuleRequest) {
      return _i63.CreateModuleRequest.fromJson(data) as T;
    }
    if (t == _i64.CreateTaskRequest) {
      return _i64.CreateTaskRequest.fromJson(data) as T;
    }
    if (t == _i65.GenerateExplanationRequest) {
      return _i65.GenerateExplanationRequest.fromJson(data) as T;
    }
    if (t == _i66.GenerateHintRequest) {
      return _i66.GenerateHintRequest.fromJson(data) as T;
    }
    if (t == _i67.ImportCourseRequest) {
      return _i67.ImportCourseRequest.fromJson(data) as T;
    }
    if (t == _i68.ProvisionExternalVideoSessionRequest) {
      return _i68.ProvisionExternalVideoSessionRequest.fromJson(data) as T;
    }
    if (t == _i69.ReorderLessonsRequest) {
      return _i69.ReorderLessonsRequest.fromJson(data) as T;
    }
    if (t == _i70.ReorderModulesRequest) {
      return _i70.ReorderModulesRequest.fromJson(data) as T;
    }
    if (t == _i71.ReorderTasksRequest) {
      return _i71.ReorderTasksRequest.fromJson(data) as T;
    }
    if (t == _i72.SyncCourseToExternalProviderRequest) {
      return _i72.SyncCourseToExternalProviderRequest.fromJson(data) as T;
    }
    if (t == _i73.UpdateCourseRequest) {
      return _i73.UpdateCourseRequest.fromJson(data) as T;
    }
    if (t == _i74.UpdateLessonRequest) {
      return _i74.UpdateLessonRequest.fromJson(data) as T;
    }
    if (t == _i75.UpdateModuleRequest) {
      return _i75.UpdateModuleRequest.fromJson(data) as T;
    }
    if (t == _i76.UpdateTaskRequest) {
      return _i76.UpdateTaskRequest.fromJson(data) as T;
    }
    if (t == _i77.UploadCmsMediaRequest) {
      return _i77.UploadCmsMediaRequest.fromJson(data) as T;
    }
    if (t == _i78.UpsertTaskOptionsRequest) {
      return _i78.UpsertTaskOptionsRequest.fromJson(data) as T;
    }
    if (t == _i79.UpsertTaskTestCasesRequest) {
      return _i79.UpsertTaskTestCasesRequest.fromJson(data) as T;
    }
    if (t == _i80.AiResponse) {
      return _i80.AiResponse.fromJson(data) as T;
    }
    if (t == _i81.Achievement) {
      return _i81.Achievement.fromJson(data) as T;
    }
    if (t == _i82.CoinTransaction) {
      return _i82.CoinTransaction.fromJson(data) as T;
    }
    if (t == _i83.CourseReview) {
      return _i83.CourseReview.fromJson(data) as T;
    }
    if (t == _i84.Course) {
      return _i84.Course.fromJson(data) as T;
    }
    if (t == _i85.LessonProgress) {
      return _i85.LessonProgress.fromJson(data) as T;
    }
    if (t == _i86.Lesson) {
      return _i86.Lesson.fromJson(data) as T;
    }
    if (t == _i87.Module) {
      return _i87.Module.fromJson(data) as T;
    }
    if (t == _i88.TaskAnswerAttempt) {
      return _i88.TaskAnswerAttempt.fromJson(data) as T;
    }
    if (t == _i89.TaskOption) {
      return _i89.TaskOption.fromJson(data) as T;
    }
    if (t == _i90.Task) {
      return _i90.Task.fromJson(data) as T;
    }
    if (t == _i91.TaskTestCase) {
      return _i91.TaskTestCase.fromJson(data) as T;
    }
    if (t == _i92.UserAchievement) {
      return _i92.UserAchievement.fromJson(data) as T;
    }
    if (t == _i93.UserCourse) {
      return _i93.UserCourse.fromJson(data) as T;
    }
    if (t == _i94.UserStatistics) {
      return _i94.UserStatistics.fromJson(data) as T;
    }
    if (t == _i95.UserWallet) {
      return _i95.UserWallet.fromJson(data) as T;
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
    if (t == _i1.getType<_i9.CmsMediaDto?>()) {
      return (data != null ? _i9.CmsMediaDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.CmsTaskOptionInputDto?>()) {
      return (data != null ? _i10.CmsTaskOptionInputDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i11.CmsTaskTestCaseInputDto?>()) {
      return (data != null ? _i11.CmsTaskTestCaseInputDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i12.CoinTransactionDto?>()) {
      return (data != null ? _i12.CoinTransactionDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i13.CourseAnalyticsDashboardDto?>()) {
      return (data != null
              ? _i13.CourseAnalyticsDashboardDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i14.CourseAnalyticsLessonDto?>()) {
      return (data != null
              ? _i14.CourseAnalyticsLessonDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i15.CourseAnalyticsSummaryDto?>()) {
      return (data != null
              ? _i15.CourseAnalyticsSummaryDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i16.CourseAnalyticsTaskDto?>()) {
      return (data != null ? _i16.CourseAnalyticsTaskDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i17.CourseAnalyticsWrongAnswerDto?>()) {
      return (data != null
              ? _i17.CourseAnalyticsWrongAnswerDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i18.CourseDetailDto?>()) {
      return (data != null ? _i18.CourseDetailDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.CourseDto?>()) {
      return (data != null ? _i19.CourseDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.CourseImportLessonDto?>()) {
      return (data != null ? _i20.CourseImportLessonDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i21.CourseImportModuleDto?>()) {
      return (data != null ? _i21.CourseImportModuleDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i22.CourseImportResultDto?>()) {
      return (data != null ? _i22.CourseImportResultDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i23.CourseImportTaskDto?>()) {
      return (data != null ? _i23.CourseImportTaskDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i24.CourseRecommendationDto?>()) {
      return (data != null ? _i24.CourseRecommendationDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i25.CourseReviewDto?>()) {
      return (data != null ? _i25.CourseReviewDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.CourseStructureDto?>()) {
      return (data != null ? _i26.CourseStructureDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i27.CourseStructureLessonDto?>()) {
      return (data != null
              ? _i27.CourseStructureLessonDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i28.CourseStructureModuleDto?>()) {
      return (data != null
              ? _i28.CourseStructureModuleDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i29.CourseStructureTaskDto?>()) {
      return (data != null ? _i29.CourseStructureTaskDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i30.ExternalCourseSyncDto?>()) {
      return (data != null ? _i30.ExternalCourseSyncDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i31.ExternalIntegrationProviderDto?>()) {
      return (data != null
              ? _i31.ExternalIntegrationProviderDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i32.ExternalVideoSessionDto?>()) {
      return (data != null ? _i32.ExternalVideoSessionDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i33.GovernanceUserDto?>()) {
      return (data != null ? _i33.GovernanceUserDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.LessonCompletionResultDto?>()) {
      return (data != null
              ? _i34.LessonCompletionResultDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i35.LessonContentBlockDto?>()) {
      return (data != null ? _i35.LessonContentBlockDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i36.LessonContentDocumentDto?>()) {
      return (data != null
              ? _i36.LessonContentDocumentDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i37.LessonDto?>()) {
      return (data != null ? _i37.LessonDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.LessonProgressDto?>()) {
      return (data != null ? _i38.LessonProgressDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.ModuleDto?>()) {
      return (data != null ? _i39.ModuleDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.TaskAnswerResultDto?>()) {
      return (data != null ? _i40.TaskAnswerResultDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i41.TaskAnswerTestCaseResultDto?>()) {
      return (data != null
              ? _i41.TaskAnswerTestCaseResultDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i42.TaskDto?>()) {
      return (data != null ? _i42.TaskDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i43.TaskOptionDto?>()) {
      return (data != null ? _i43.TaskOptionDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i44.TaskTestCaseDto?>()) {
      return (data != null ? _i44.TaskTestCaseDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i45.UserStatisticsDto?>()) {
      return (data != null ? _i45.UserStatisticsDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i46.WalletBalanceDto?>()) {
      return (data != null ? _i46.WalletBalanceDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i47.AdaptiveLearningPathType?>()) {
      return (data != null
              ? _i47.AdaptiveLearningPathType.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i48.CoinTransactionType?>()) {
      return (data != null ? _i48.CoinTransactionType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i49.ContentStatus?>()) {
      return (data != null ? _i49.ContentStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i50.ExternalIntegrationAuthScheme?>()) {
      return (data != null
              ? _i50.ExternalIntegrationAuthScheme.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i51.ExternalIntegrationKind?>()) {
      return (data != null ? _i51.ExternalIntegrationKind.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i52.ExternalIntegrationProvider?>()) {
      return (data != null
              ? _i52.ExternalIntegrationProvider.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i53.LessonContentBlockType?>()) {
      return (data != null ? _i53.LessonContentBlockType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i54.TaskType?>()) {
      return (data != null ? _i54.TaskType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i55.UserRole?>()) {
      return (data != null ? _i55.UserRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i56.NotFoundException?>()) {
      return (data != null ? _i56.NotFoundException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i57.ValidationException?>()) {
      return (data != null ? _i57.ValidationException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i58.CompleteLessonSessionRequest?>()) {
      return (data != null
              ? _i58.CompleteLessonSessionRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i59.CreateCoinTransactionRequest?>()) {
      return (data != null
              ? _i59.CreateCoinTransactionRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i60.CreateCourseRequest?>()) {
      return (data != null ? _i60.CreateCourseRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i61.CreateCourseReviewRequest?>()) {
      return (data != null
              ? _i61.CreateCourseReviewRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i62.CreateLessonRequest?>()) {
      return (data != null ? _i62.CreateLessonRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i63.CreateModuleRequest?>()) {
      return (data != null ? _i63.CreateModuleRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i64.CreateTaskRequest?>()) {
      return (data != null ? _i64.CreateTaskRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i65.GenerateExplanationRequest?>()) {
      return (data != null
              ? _i65.GenerateExplanationRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i66.GenerateHintRequest?>()) {
      return (data != null ? _i66.GenerateHintRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i67.ImportCourseRequest?>()) {
      return (data != null ? _i67.ImportCourseRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i68.ProvisionExternalVideoSessionRequest?>()) {
      return (data != null
              ? _i68.ProvisionExternalVideoSessionRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i69.ReorderLessonsRequest?>()) {
      return (data != null ? _i69.ReorderLessonsRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i70.ReorderModulesRequest?>()) {
      return (data != null ? _i70.ReorderModulesRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i71.ReorderTasksRequest?>()) {
      return (data != null ? _i71.ReorderTasksRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i72.SyncCourseToExternalProviderRequest?>()) {
      return (data != null
              ? _i72.SyncCourseToExternalProviderRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i73.UpdateCourseRequest?>()) {
      return (data != null ? _i73.UpdateCourseRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i74.UpdateLessonRequest?>()) {
      return (data != null ? _i74.UpdateLessonRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i75.UpdateModuleRequest?>()) {
      return (data != null ? _i75.UpdateModuleRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i76.UpdateTaskRequest?>()) {
      return (data != null ? _i76.UpdateTaskRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i77.UploadCmsMediaRequest?>()) {
      return (data != null ? _i77.UploadCmsMediaRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i78.UpsertTaskOptionsRequest?>()) {
      return (data != null
              ? _i78.UpsertTaskOptionsRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i79.UpsertTaskTestCasesRequest?>()) {
      return (data != null
              ? _i79.UpsertTaskTestCasesRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i80.AiResponse?>()) {
      return (data != null ? _i80.AiResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i81.Achievement?>()) {
      return (data != null ? _i81.Achievement.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i82.CoinTransaction?>()) {
      return (data != null ? _i82.CoinTransaction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i83.CourseReview?>()) {
      return (data != null ? _i83.CourseReview.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i84.Course?>()) {
      return (data != null ? _i84.Course.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i85.LessonProgress?>()) {
      return (data != null ? _i85.LessonProgress.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i86.Lesson?>()) {
      return (data != null ? _i86.Lesson.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i87.Module?>()) {
      return (data != null ? _i87.Module.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i88.TaskAnswerAttempt?>()) {
      return (data != null ? _i88.TaskAnswerAttempt.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i89.TaskOption?>()) {
      return (data != null ? _i89.TaskOption.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i90.Task?>()) {
      return (data != null ? _i90.Task.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i91.TaskTestCase?>()) {
      return (data != null ? _i91.TaskTestCase.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i92.UserAchievement?>()) {
      return (data != null ? _i92.UserAchievement.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i93.UserCourse?>()) {
      return (data != null ? _i93.UserCourse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i94.UserStatistics?>()) {
      return (data != null ? _i94.UserStatistics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i95.UserWallet?>()) {
      return (data != null ? _i95.UserWallet.fromJson(data) : null) as T;
    }
    if (t == List<_i55.UserRole>) {
      return (data as List).map((e) => deserialize<_i55.UserRole>(e)).toList()
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
    if (t == List<_i14.CourseAnalyticsLessonDto>) {
      return (data as List)
              .map((e) => deserialize<_i14.CourseAnalyticsLessonDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i16.CourseAnalyticsTaskDto>) {
      return (data as List)
              .map((e) => deserialize<_i16.CourseAnalyticsTaskDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i17.CourseAnalyticsWrongAnswerDto>) {
      return (data as List)
              .map((e) => deserialize<_i17.CourseAnalyticsWrongAnswerDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i39.ModuleDto>) {
      return (data as List).map((e) => deserialize<_i39.ModuleDto>(e)).toList()
          as T;
    }
    if (t == List<_i37.LessonDto>) {
      return (data as List).map((e) => deserialize<_i37.LessonDto>(e)).toList()
          as T;
    }
    if (t == List<_i42.TaskDto>) {
      return (data as List).map((e) => deserialize<_i42.TaskDto>(e)).toList()
          as T;
    }
    if (t == List<_i25.CourseReviewDto>) {
      return (data as List)
              .map((e) => deserialize<_i25.CourseReviewDto>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i25.CourseReviewDto>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i25.CourseReviewDto>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<String>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i23.CourseImportTaskDto>) {
      return (data as List)
              .map((e) => deserialize<_i23.CourseImportTaskDto>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i23.CourseImportTaskDto>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i23.CourseImportTaskDto>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i20.CourseImportLessonDto>) {
      return (data as List)
              .map((e) => deserialize<_i20.CourseImportLessonDto>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i20.CourseImportLessonDto>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i20.CourseImportLessonDto>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i10.CmsTaskOptionInputDto>) {
      return (data as List)
              .map((e) => deserialize<_i10.CmsTaskOptionInputDto>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i10.CmsTaskOptionInputDto>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i10.CmsTaskOptionInputDto>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i11.CmsTaskTestCaseInputDto>) {
      return (data as List)
              .map((e) => deserialize<_i11.CmsTaskTestCaseInputDto>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i11.CmsTaskTestCaseInputDto>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i11.CmsTaskTestCaseInputDto>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i28.CourseStructureModuleDto>) {
      return (data as List)
              .map((e) => deserialize<_i28.CourseStructureModuleDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i29.CourseStructureTaskDto>) {
      return (data as List)
              .map((e) => deserialize<_i29.CourseStructureTaskDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i27.CourseStructureLessonDto>) {
      return (data as List)
              .map((e) => deserialize<_i27.CourseStructureLessonDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i6.AchievementDto>) {
      return (data as List)
              .map((e) => deserialize<_i6.AchievementDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i35.LessonContentBlockDto>) {
      return (data as List)
              .map((e) => deserialize<_i35.LessonContentBlockDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i41.TaskAnswerTestCaseResultDto>) {
      return (data as List)
              .map((e) => deserialize<_i41.TaskAnswerTestCaseResultDto>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i41.TaskAnswerTestCaseResultDto>?>()) {
      return (data != null
              ? (data as List)
                    .map(
                      (e) => deserialize<_i41.TaskAnswerTestCaseResultDto>(e),
                    )
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i43.TaskOptionDto>) {
      return (data as List)
              .map((e) => deserialize<_i43.TaskOptionDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i44.TaskTestCaseDto>) {
      return (data as List)
              .map((e) => deserialize<_i44.TaskTestCaseDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i21.CourseImportModuleDto>) {
      return (data as List)
              .map((e) => deserialize<_i21.CourseImportModuleDto>(e))
              .toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i96.AchievementDto>) {
      return (data as List)
              .map((e) => deserialize<_i96.AchievementDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i97.GovernanceUserDto>) {
      return (data as List)
              .map((e) => deserialize<_i97.GovernanceUserDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i98.CourseDto>) {
      return (data as List).map((e) => deserialize<_i98.CourseDto>(e)).toList()
          as T;
    }
    if (t == List<_i99.CourseRecommendationDto>) {
      return (data as List)
              .map((e) => deserialize<_i99.CourseRecommendationDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i100.ExternalIntegrationProviderDto>) {
      return (data as List)
              .map((e) => deserialize<_i100.ExternalIntegrationProviderDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i101.LessonDto>) {
      return (data as List).map((e) => deserialize<_i101.LessonDto>(e)).toList()
          as T;
    }
    if (t == List<_i102.LessonProgressDto>) {
      return (data as List)
              .map((e) => deserialize<_i102.LessonProgressDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i103.ModuleDto>) {
      return (data as List).map((e) => deserialize<_i103.ModuleDto>(e)).toList()
          as T;
    }
    if (t == List<_i104.TaskDto>) {
      return (data as List).map((e) => deserialize<_i104.TaskDto>(e)).toList()
          as T;
    }
    if (t == List<_i105.TaskOptionDto>) {
      return (data as List)
              .map((e) => deserialize<_i105.TaskOptionDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i106.TaskTestCaseDto>) {
      return (data as List)
              .map((e) => deserialize<_i106.TaskTestCaseDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i107.CoinTransactionDto>) {
      return (data as List)
              .map((e) => deserialize<_i107.CoinTransactionDto>(e))
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
      _i9.CmsMediaDto => 'CmsMediaDto',
      _i10.CmsTaskOptionInputDto => 'CmsTaskOptionInputDto',
      _i11.CmsTaskTestCaseInputDto => 'CmsTaskTestCaseInputDto',
      _i12.CoinTransactionDto => 'CoinTransactionDto',
      _i13.CourseAnalyticsDashboardDto => 'CourseAnalyticsDashboardDto',
      _i14.CourseAnalyticsLessonDto => 'CourseAnalyticsLessonDto',
      _i15.CourseAnalyticsSummaryDto => 'CourseAnalyticsSummaryDto',
      _i16.CourseAnalyticsTaskDto => 'CourseAnalyticsTaskDto',
      _i17.CourseAnalyticsWrongAnswerDto => 'CourseAnalyticsWrongAnswerDto',
      _i18.CourseDetailDto => 'CourseDetailDto',
      _i19.CourseDto => 'CourseDto',
      _i20.CourseImportLessonDto => 'CourseImportLessonDto',
      _i21.CourseImportModuleDto => 'CourseImportModuleDto',
      _i22.CourseImportResultDto => 'CourseImportResultDto',
      _i23.CourseImportTaskDto => 'CourseImportTaskDto',
      _i24.CourseRecommendationDto => 'CourseRecommendationDto',
      _i25.CourseReviewDto => 'CourseReviewDto',
      _i26.CourseStructureDto => 'CourseStructureDto',
      _i27.CourseStructureLessonDto => 'CourseStructureLessonDto',
      _i28.CourseStructureModuleDto => 'CourseStructureModuleDto',
      _i29.CourseStructureTaskDto => 'CourseStructureTaskDto',
      _i30.ExternalCourseSyncDto => 'ExternalCourseSyncDto',
      _i31.ExternalIntegrationProviderDto => 'ExternalIntegrationProviderDto',
      _i32.ExternalVideoSessionDto => 'ExternalVideoSessionDto',
      _i33.GovernanceUserDto => 'GovernanceUserDto',
      _i34.LessonCompletionResultDto => 'LessonCompletionResultDto',
      _i35.LessonContentBlockDto => 'LessonContentBlockDto',
      _i36.LessonContentDocumentDto => 'LessonContentDocumentDto',
      _i37.LessonDto => 'LessonDto',
      _i38.LessonProgressDto => 'LessonProgressDto',
      _i39.ModuleDto => 'ModuleDto',
      _i40.TaskAnswerResultDto => 'TaskAnswerResultDto',
      _i41.TaskAnswerTestCaseResultDto => 'TaskAnswerTestCaseResultDto',
      _i42.TaskDto => 'TaskDto',
      _i43.TaskOptionDto => 'TaskOptionDto',
      _i44.TaskTestCaseDto => 'TaskTestCaseDto',
      _i45.UserStatisticsDto => 'UserStatisticsDto',
      _i46.WalletBalanceDto => 'WalletBalanceDto',
      _i47.AdaptiveLearningPathType => 'AdaptiveLearningPathType',
      _i48.CoinTransactionType => 'CoinTransactionType',
      _i49.ContentStatus => 'ContentStatus',
      _i50.ExternalIntegrationAuthScheme => 'ExternalIntegrationAuthScheme',
      _i51.ExternalIntegrationKind => 'ExternalIntegrationKind',
      _i52.ExternalIntegrationProvider => 'ExternalIntegrationProvider',
      _i53.LessonContentBlockType => 'LessonContentBlockType',
      _i54.TaskType => 'TaskType',
      _i55.UserRole => 'UserRole',
      _i56.NotFoundException => 'NotFoundException',
      _i57.ValidationException => 'ValidationException',
      _i58.CompleteLessonSessionRequest => 'CompleteLessonSessionRequest',
      _i59.CreateCoinTransactionRequest => 'CreateCoinTransactionRequest',
      _i60.CreateCourseRequest => 'CreateCourseRequest',
      _i61.CreateCourseReviewRequest => 'CreateCourseReviewRequest',
      _i62.CreateLessonRequest => 'CreateLessonRequest',
      _i63.CreateModuleRequest => 'CreateModuleRequest',
      _i64.CreateTaskRequest => 'CreateTaskRequest',
      _i65.GenerateExplanationRequest => 'GenerateExplanationRequest',
      _i66.GenerateHintRequest => 'GenerateHintRequest',
      _i67.ImportCourseRequest => 'ImportCourseRequest',
      _i68.ProvisionExternalVideoSessionRequest =>
        'ProvisionExternalVideoSessionRequest',
      _i69.ReorderLessonsRequest => 'ReorderLessonsRequest',
      _i70.ReorderModulesRequest => 'ReorderModulesRequest',
      _i71.ReorderTasksRequest => 'ReorderTasksRequest',
      _i72.SyncCourseToExternalProviderRequest =>
        'SyncCourseToExternalProviderRequest',
      _i73.UpdateCourseRequest => 'UpdateCourseRequest',
      _i74.UpdateLessonRequest => 'UpdateLessonRequest',
      _i75.UpdateModuleRequest => 'UpdateModuleRequest',
      _i76.UpdateTaskRequest => 'UpdateTaskRequest',
      _i77.UploadCmsMediaRequest => 'UploadCmsMediaRequest',
      _i78.UpsertTaskOptionsRequest => 'UpsertTaskOptionsRequest',
      _i79.UpsertTaskTestCasesRequest => 'UpsertTaskTestCasesRequest',
      _i80.AiResponse => 'AiResponse',
      _i81.Achievement => 'Achievement',
      _i82.CoinTransaction => 'CoinTransaction',
      _i83.CourseReview => 'CourseReview',
      _i84.Course => 'Course',
      _i85.LessonProgress => 'LessonProgress',
      _i86.Lesson => 'Lesson',
      _i87.Module => 'Module',
      _i88.TaskAnswerAttempt => 'TaskAnswerAttempt',
      _i89.TaskOption => 'TaskOption',
      _i90.Task => 'Task',
      _i91.TaskTestCase => 'TaskTestCase',
      _i92.UserAchievement => 'UserAchievement',
      _i93.UserCourse => 'UserCourse',
      _i94.UserStatistics => 'UserStatistics',
      _i95.UserWallet => 'UserWallet',
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
      case _i9.CmsMediaDto():
        return 'CmsMediaDto';
      case _i10.CmsTaskOptionInputDto():
        return 'CmsTaskOptionInputDto';
      case _i11.CmsTaskTestCaseInputDto():
        return 'CmsTaskTestCaseInputDto';
      case _i12.CoinTransactionDto():
        return 'CoinTransactionDto';
      case _i13.CourseAnalyticsDashboardDto():
        return 'CourseAnalyticsDashboardDto';
      case _i14.CourseAnalyticsLessonDto():
        return 'CourseAnalyticsLessonDto';
      case _i15.CourseAnalyticsSummaryDto():
        return 'CourseAnalyticsSummaryDto';
      case _i16.CourseAnalyticsTaskDto():
        return 'CourseAnalyticsTaskDto';
      case _i17.CourseAnalyticsWrongAnswerDto():
        return 'CourseAnalyticsWrongAnswerDto';
      case _i18.CourseDetailDto():
        return 'CourseDetailDto';
      case _i19.CourseDto():
        return 'CourseDto';
      case _i20.CourseImportLessonDto():
        return 'CourseImportLessonDto';
      case _i21.CourseImportModuleDto():
        return 'CourseImportModuleDto';
      case _i22.CourseImportResultDto():
        return 'CourseImportResultDto';
      case _i23.CourseImportTaskDto():
        return 'CourseImportTaskDto';
      case _i24.CourseRecommendationDto():
        return 'CourseRecommendationDto';
      case _i25.CourseReviewDto():
        return 'CourseReviewDto';
      case _i26.CourseStructureDto():
        return 'CourseStructureDto';
      case _i27.CourseStructureLessonDto():
        return 'CourseStructureLessonDto';
      case _i28.CourseStructureModuleDto():
        return 'CourseStructureModuleDto';
      case _i29.CourseStructureTaskDto():
        return 'CourseStructureTaskDto';
      case _i30.ExternalCourseSyncDto():
        return 'ExternalCourseSyncDto';
      case _i31.ExternalIntegrationProviderDto():
        return 'ExternalIntegrationProviderDto';
      case _i32.ExternalVideoSessionDto():
        return 'ExternalVideoSessionDto';
      case _i33.GovernanceUserDto():
        return 'GovernanceUserDto';
      case _i34.LessonCompletionResultDto():
        return 'LessonCompletionResultDto';
      case _i35.LessonContentBlockDto():
        return 'LessonContentBlockDto';
      case _i36.LessonContentDocumentDto():
        return 'LessonContentDocumentDto';
      case _i37.LessonDto():
        return 'LessonDto';
      case _i38.LessonProgressDto():
        return 'LessonProgressDto';
      case _i39.ModuleDto():
        return 'ModuleDto';
      case _i40.TaskAnswerResultDto():
        return 'TaskAnswerResultDto';
      case _i41.TaskAnswerTestCaseResultDto():
        return 'TaskAnswerTestCaseResultDto';
      case _i42.TaskDto():
        return 'TaskDto';
      case _i43.TaskOptionDto():
        return 'TaskOptionDto';
      case _i44.TaskTestCaseDto():
        return 'TaskTestCaseDto';
      case _i45.UserStatisticsDto():
        return 'UserStatisticsDto';
      case _i46.WalletBalanceDto():
        return 'WalletBalanceDto';
      case _i47.AdaptiveLearningPathType():
        return 'AdaptiveLearningPathType';
      case _i48.CoinTransactionType():
        return 'CoinTransactionType';
      case _i49.ContentStatus():
        return 'ContentStatus';
      case _i50.ExternalIntegrationAuthScheme():
        return 'ExternalIntegrationAuthScheme';
      case _i51.ExternalIntegrationKind():
        return 'ExternalIntegrationKind';
      case _i52.ExternalIntegrationProvider():
        return 'ExternalIntegrationProvider';
      case _i53.LessonContentBlockType():
        return 'LessonContentBlockType';
      case _i54.TaskType():
        return 'TaskType';
      case _i55.UserRole():
        return 'UserRole';
      case _i56.NotFoundException():
        return 'NotFoundException';
      case _i57.ValidationException():
        return 'ValidationException';
      case _i58.CompleteLessonSessionRequest():
        return 'CompleteLessonSessionRequest';
      case _i59.CreateCoinTransactionRequest():
        return 'CreateCoinTransactionRequest';
      case _i60.CreateCourseRequest():
        return 'CreateCourseRequest';
      case _i61.CreateCourseReviewRequest():
        return 'CreateCourseReviewRequest';
      case _i62.CreateLessonRequest():
        return 'CreateLessonRequest';
      case _i63.CreateModuleRequest():
        return 'CreateModuleRequest';
      case _i64.CreateTaskRequest():
        return 'CreateTaskRequest';
      case _i65.GenerateExplanationRequest():
        return 'GenerateExplanationRequest';
      case _i66.GenerateHintRequest():
        return 'GenerateHintRequest';
      case _i67.ImportCourseRequest():
        return 'ImportCourseRequest';
      case _i68.ProvisionExternalVideoSessionRequest():
        return 'ProvisionExternalVideoSessionRequest';
      case _i69.ReorderLessonsRequest():
        return 'ReorderLessonsRequest';
      case _i70.ReorderModulesRequest():
        return 'ReorderModulesRequest';
      case _i71.ReorderTasksRequest():
        return 'ReorderTasksRequest';
      case _i72.SyncCourseToExternalProviderRequest():
        return 'SyncCourseToExternalProviderRequest';
      case _i73.UpdateCourseRequest():
        return 'UpdateCourseRequest';
      case _i74.UpdateLessonRequest():
        return 'UpdateLessonRequest';
      case _i75.UpdateModuleRequest():
        return 'UpdateModuleRequest';
      case _i76.UpdateTaskRequest():
        return 'UpdateTaskRequest';
      case _i77.UploadCmsMediaRequest():
        return 'UploadCmsMediaRequest';
      case _i78.UpsertTaskOptionsRequest():
        return 'UpsertTaskOptionsRequest';
      case _i79.UpsertTaskTestCasesRequest():
        return 'UpsertTaskTestCasesRequest';
      case _i80.AiResponse():
        return 'AiResponse';
      case _i81.Achievement():
        return 'Achievement';
      case _i82.CoinTransaction():
        return 'CoinTransaction';
      case _i83.CourseReview():
        return 'CourseReview';
      case _i84.Course():
        return 'Course';
      case _i85.LessonProgress():
        return 'LessonProgress';
      case _i86.Lesson():
        return 'Lesson';
      case _i87.Module():
        return 'Module';
      case _i88.TaskAnswerAttempt():
        return 'TaskAnswerAttempt';
      case _i89.TaskOption():
        return 'TaskOption';
      case _i90.Task():
        return 'Task';
      case _i91.TaskTestCase():
        return 'TaskTestCase';
      case _i92.UserAchievement():
        return 'UserAchievement';
      case _i93.UserCourse():
        return 'UserCourse';
      case _i94.UserStatistics():
        return 'UserStatistics';
      case _i95.UserWallet():
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
    if (dataClassName == 'CmsMediaDto') {
      return deserialize<_i9.CmsMediaDto>(data['data']);
    }
    if (dataClassName == 'CmsTaskOptionInputDto') {
      return deserialize<_i10.CmsTaskOptionInputDto>(data['data']);
    }
    if (dataClassName == 'CmsTaskTestCaseInputDto') {
      return deserialize<_i11.CmsTaskTestCaseInputDto>(data['data']);
    }
    if (dataClassName == 'CoinTransactionDto') {
      return deserialize<_i12.CoinTransactionDto>(data['data']);
    }
    if (dataClassName == 'CourseAnalyticsDashboardDto') {
      return deserialize<_i13.CourseAnalyticsDashboardDto>(data['data']);
    }
    if (dataClassName == 'CourseAnalyticsLessonDto') {
      return deserialize<_i14.CourseAnalyticsLessonDto>(data['data']);
    }
    if (dataClassName == 'CourseAnalyticsSummaryDto') {
      return deserialize<_i15.CourseAnalyticsSummaryDto>(data['data']);
    }
    if (dataClassName == 'CourseAnalyticsTaskDto') {
      return deserialize<_i16.CourseAnalyticsTaskDto>(data['data']);
    }
    if (dataClassName == 'CourseAnalyticsWrongAnswerDto') {
      return deserialize<_i17.CourseAnalyticsWrongAnswerDto>(data['data']);
    }
    if (dataClassName == 'CourseDetailDto') {
      return deserialize<_i18.CourseDetailDto>(data['data']);
    }
    if (dataClassName == 'CourseDto') {
      return deserialize<_i19.CourseDto>(data['data']);
    }
    if (dataClassName == 'CourseImportLessonDto') {
      return deserialize<_i20.CourseImportLessonDto>(data['data']);
    }
    if (dataClassName == 'CourseImportModuleDto') {
      return deserialize<_i21.CourseImportModuleDto>(data['data']);
    }
    if (dataClassName == 'CourseImportResultDto') {
      return deserialize<_i22.CourseImportResultDto>(data['data']);
    }
    if (dataClassName == 'CourseImportTaskDto') {
      return deserialize<_i23.CourseImportTaskDto>(data['data']);
    }
    if (dataClassName == 'CourseRecommendationDto') {
      return deserialize<_i24.CourseRecommendationDto>(data['data']);
    }
    if (dataClassName == 'CourseReviewDto') {
      return deserialize<_i25.CourseReviewDto>(data['data']);
    }
    if (dataClassName == 'CourseStructureDto') {
      return deserialize<_i26.CourseStructureDto>(data['data']);
    }
    if (dataClassName == 'CourseStructureLessonDto') {
      return deserialize<_i27.CourseStructureLessonDto>(data['data']);
    }
    if (dataClassName == 'CourseStructureModuleDto') {
      return deserialize<_i28.CourseStructureModuleDto>(data['data']);
    }
    if (dataClassName == 'CourseStructureTaskDto') {
      return deserialize<_i29.CourseStructureTaskDto>(data['data']);
    }
    if (dataClassName == 'ExternalCourseSyncDto') {
      return deserialize<_i30.ExternalCourseSyncDto>(data['data']);
    }
    if (dataClassName == 'ExternalIntegrationProviderDto') {
      return deserialize<_i31.ExternalIntegrationProviderDto>(data['data']);
    }
    if (dataClassName == 'ExternalVideoSessionDto') {
      return deserialize<_i32.ExternalVideoSessionDto>(data['data']);
    }
    if (dataClassName == 'GovernanceUserDto') {
      return deserialize<_i33.GovernanceUserDto>(data['data']);
    }
    if (dataClassName == 'LessonCompletionResultDto') {
      return deserialize<_i34.LessonCompletionResultDto>(data['data']);
    }
    if (dataClassName == 'LessonContentBlockDto') {
      return deserialize<_i35.LessonContentBlockDto>(data['data']);
    }
    if (dataClassName == 'LessonContentDocumentDto') {
      return deserialize<_i36.LessonContentDocumentDto>(data['data']);
    }
    if (dataClassName == 'LessonDto') {
      return deserialize<_i37.LessonDto>(data['data']);
    }
    if (dataClassName == 'LessonProgressDto') {
      return deserialize<_i38.LessonProgressDto>(data['data']);
    }
    if (dataClassName == 'ModuleDto') {
      return deserialize<_i39.ModuleDto>(data['data']);
    }
    if (dataClassName == 'TaskAnswerResultDto') {
      return deserialize<_i40.TaskAnswerResultDto>(data['data']);
    }
    if (dataClassName == 'TaskAnswerTestCaseResultDto') {
      return deserialize<_i41.TaskAnswerTestCaseResultDto>(data['data']);
    }
    if (dataClassName == 'TaskDto') {
      return deserialize<_i42.TaskDto>(data['data']);
    }
    if (dataClassName == 'TaskOptionDto') {
      return deserialize<_i43.TaskOptionDto>(data['data']);
    }
    if (dataClassName == 'TaskTestCaseDto') {
      return deserialize<_i44.TaskTestCaseDto>(data['data']);
    }
    if (dataClassName == 'UserStatisticsDto') {
      return deserialize<_i45.UserStatisticsDto>(data['data']);
    }
    if (dataClassName == 'WalletBalanceDto') {
      return deserialize<_i46.WalletBalanceDto>(data['data']);
    }
    if (dataClassName == 'AdaptiveLearningPathType') {
      return deserialize<_i47.AdaptiveLearningPathType>(data['data']);
    }
    if (dataClassName == 'CoinTransactionType') {
      return deserialize<_i48.CoinTransactionType>(data['data']);
    }
    if (dataClassName == 'ContentStatus') {
      return deserialize<_i49.ContentStatus>(data['data']);
    }
    if (dataClassName == 'ExternalIntegrationAuthScheme') {
      return deserialize<_i50.ExternalIntegrationAuthScheme>(data['data']);
    }
    if (dataClassName == 'ExternalIntegrationKind') {
      return deserialize<_i51.ExternalIntegrationKind>(data['data']);
    }
    if (dataClassName == 'ExternalIntegrationProvider') {
      return deserialize<_i52.ExternalIntegrationProvider>(data['data']);
    }
    if (dataClassName == 'LessonContentBlockType') {
      return deserialize<_i53.LessonContentBlockType>(data['data']);
    }
    if (dataClassName == 'TaskType') {
      return deserialize<_i54.TaskType>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_i55.UserRole>(data['data']);
    }
    if (dataClassName == 'NotFoundException') {
      return deserialize<_i56.NotFoundException>(data['data']);
    }
    if (dataClassName == 'ValidationException') {
      return deserialize<_i57.ValidationException>(data['data']);
    }
    if (dataClassName == 'CompleteLessonSessionRequest') {
      return deserialize<_i58.CompleteLessonSessionRequest>(data['data']);
    }
    if (dataClassName == 'CreateCoinTransactionRequest') {
      return deserialize<_i59.CreateCoinTransactionRequest>(data['data']);
    }
    if (dataClassName == 'CreateCourseRequest') {
      return deserialize<_i60.CreateCourseRequest>(data['data']);
    }
    if (dataClassName == 'CreateCourseReviewRequest') {
      return deserialize<_i61.CreateCourseReviewRequest>(data['data']);
    }
    if (dataClassName == 'CreateLessonRequest') {
      return deserialize<_i62.CreateLessonRequest>(data['data']);
    }
    if (dataClassName == 'CreateModuleRequest') {
      return deserialize<_i63.CreateModuleRequest>(data['data']);
    }
    if (dataClassName == 'CreateTaskRequest') {
      return deserialize<_i64.CreateTaskRequest>(data['data']);
    }
    if (dataClassName == 'GenerateExplanationRequest') {
      return deserialize<_i65.GenerateExplanationRequest>(data['data']);
    }
    if (dataClassName == 'GenerateHintRequest') {
      return deserialize<_i66.GenerateHintRequest>(data['data']);
    }
    if (dataClassName == 'ImportCourseRequest') {
      return deserialize<_i67.ImportCourseRequest>(data['data']);
    }
    if (dataClassName == 'ProvisionExternalVideoSessionRequest') {
      return deserialize<_i68.ProvisionExternalVideoSessionRequest>(
        data['data'],
      );
    }
    if (dataClassName == 'ReorderLessonsRequest') {
      return deserialize<_i69.ReorderLessonsRequest>(data['data']);
    }
    if (dataClassName == 'ReorderModulesRequest') {
      return deserialize<_i70.ReorderModulesRequest>(data['data']);
    }
    if (dataClassName == 'ReorderTasksRequest') {
      return deserialize<_i71.ReorderTasksRequest>(data['data']);
    }
    if (dataClassName == 'SyncCourseToExternalProviderRequest') {
      return deserialize<_i72.SyncCourseToExternalProviderRequest>(
        data['data'],
      );
    }
    if (dataClassName == 'UpdateCourseRequest') {
      return deserialize<_i73.UpdateCourseRequest>(data['data']);
    }
    if (dataClassName == 'UpdateLessonRequest') {
      return deserialize<_i74.UpdateLessonRequest>(data['data']);
    }
    if (dataClassName == 'UpdateModuleRequest') {
      return deserialize<_i75.UpdateModuleRequest>(data['data']);
    }
    if (dataClassName == 'UpdateTaskRequest') {
      return deserialize<_i76.UpdateTaskRequest>(data['data']);
    }
    if (dataClassName == 'UploadCmsMediaRequest') {
      return deserialize<_i77.UploadCmsMediaRequest>(data['data']);
    }
    if (dataClassName == 'UpsertTaskOptionsRequest') {
      return deserialize<_i78.UpsertTaskOptionsRequest>(data['data']);
    }
    if (dataClassName == 'UpsertTaskTestCasesRequest') {
      return deserialize<_i79.UpsertTaskTestCasesRequest>(data['data']);
    }
    if (dataClassName == 'AiResponse') {
      return deserialize<_i80.AiResponse>(data['data']);
    }
    if (dataClassName == 'Achievement') {
      return deserialize<_i81.Achievement>(data['data']);
    }
    if (dataClassName == 'CoinTransaction') {
      return deserialize<_i82.CoinTransaction>(data['data']);
    }
    if (dataClassName == 'CourseReview') {
      return deserialize<_i83.CourseReview>(data['data']);
    }
    if (dataClassName == 'Course') {
      return deserialize<_i84.Course>(data['data']);
    }
    if (dataClassName == 'LessonProgress') {
      return deserialize<_i85.LessonProgress>(data['data']);
    }
    if (dataClassName == 'Lesson') {
      return deserialize<_i86.Lesson>(data['data']);
    }
    if (dataClassName == 'Module') {
      return deserialize<_i87.Module>(data['data']);
    }
    if (dataClassName == 'TaskAnswerAttempt') {
      return deserialize<_i88.TaskAnswerAttempt>(data['data']);
    }
    if (dataClassName == 'TaskOption') {
      return deserialize<_i89.TaskOption>(data['data']);
    }
    if (dataClassName == 'Task') {
      return deserialize<_i90.Task>(data['data']);
    }
    if (dataClassName == 'TaskTestCase') {
      return deserialize<_i91.TaskTestCase>(data['data']);
    }
    if (dataClassName == 'UserAchievement') {
      return deserialize<_i92.UserAchievement>(data['data']);
    }
    if (dataClassName == 'UserCourse') {
      return deserialize<_i93.UserCourse>(data['data']);
    }
    if (dataClassName == 'UserStatistics') {
      return deserialize<_i94.UserStatistics>(data['data']);
    }
    if (dataClassName == 'UserWallet') {
      return deserialize<_i95.UserWallet>(data['data']);
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
      case _i81.Achievement:
        return _i81.Achievement.t;
      case _i82.CoinTransaction:
        return _i82.CoinTransaction.t;
      case _i83.CourseReview:
        return _i83.CourseReview.t;
      case _i84.Course:
        return _i84.Course.t;
      case _i85.LessonProgress:
        return _i85.LessonProgress.t;
      case _i86.Lesson:
        return _i86.Lesson.t;
      case _i87.Module:
        return _i87.Module.t;
      case _i88.TaskAnswerAttempt:
        return _i88.TaskAnswerAttempt.t;
      case _i89.TaskOption:
        return _i89.TaskOption.t;
      case _i90.Task:
        return _i90.Task.t;
      case _i91.TaskTestCase:
        return _i91.TaskTestCase.t;
      case _i92.UserAchievement:
        return _i92.UserAchievement.t;
      case _i93.UserCourse:
        return _i93.UserCourse.t;
      case _i94.UserStatistics:
        return _i94.UserStatistics.t;
      case _i95.UserWallet:
        return _i95.UserWallet.t;
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
