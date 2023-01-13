// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class UserDataTableData extends DataClass
    implements Insertable<UserDataTableData> {
  final int id;
  final String name;
  final String userTitle;
  final String description;
  const UserDataTableData(
      {required this.id,
      required this.name,
      required this.userTitle,
      required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['user_title'] = Variable<String>(userTitle);
    map['description'] = Variable<String>(description);
    return map;
  }

  UserDataTableCompanion toCompanion(bool nullToAbsent) {
    return UserDataTableCompanion(
      id: Value(id),
      name: Value(name),
      userTitle: Value(userTitle),
      description: Value(description),
    );
  }

  factory UserDataTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDataTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      userTitle: serializer.fromJson<String>(json['userTitle']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'userTitle': serializer.toJson<String>(userTitle),
      'description': serializer.toJson<String>(description),
    };
  }

  UserDataTableData copyWith(
          {int? id, String? name, String? userTitle, String? description}) =>
      UserDataTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        userTitle: userTitle ?? this.userTitle,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('UserDataTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userTitle: $userTitle, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, userTitle, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDataTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.userTitle == this.userTitle &&
          other.description == this.description);
}

class UserDataTableCompanion extends UpdateCompanion<UserDataTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> userTitle;
  final Value<String> description;
  const UserDataTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.userTitle = const Value.absent(),
    this.description = const Value.absent(),
  });
  UserDataTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String userTitle,
    required String description,
  })  : name = Value(name),
        userTitle = Value(userTitle),
        description = Value(description);
  static Insertable<UserDataTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? userTitle,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (userTitle != null) 'user_title': userTitle,
      if (description != null) 'description': description,
    });
  }

  UserDataTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? userTitle,
      Value<String>? description}) {
    return UserDataTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      userTitle: userTitle ?? this.userTitle,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (userTitle.present) {
      map['user_title'] = Variable<String>(userTitle.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDataTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userTitle: $userTitle, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $UserDataTableTable extends UserDataTable
    with TableInfo<$UserDataTableTable, UserDataTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserDataTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 5, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _userTitleMeta =
      const VerificationMeta('userTitle');
  @override
  late final GeneratedColumn<String> userTitle = GeneratedColumn<String>(
      'user_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, userTitle, description];
  @override
  String get aliasedName => _alias ?? 'user_data_table';
  @override
  String get actualTableName => 'user_data_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserDataTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('user_title')) {
      context.handle(_userTitleMeta,
          userTitle.isAcceptableOrUnknown(data['user_title']!, _userTitleMeta));
    } else if (isInserting) {
      context.missing(_userTitleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserDataTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDataTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      userTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $UserDataTableTable createAlias(String alias) {
    return $UserDataTableTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $UserDataTableTable userDataTable = $UserDataTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userDataTable];
}
