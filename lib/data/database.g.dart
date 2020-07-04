// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class AccountEntityData extends DataClass
    implements Insertable<AccountEntityData> {
  final int id;
  final String title;
  final bool archive;
  AccountEntityData(
      {@required this.id, @required this.title, @required this.archive});
  factory AccountEntityData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return AccountEntityData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      archive:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}archive']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || archive != null) {
      map['archive'] = Variable<bool>(archive);
    }
    return map;
  }

  AccountEntityCompanion toCompanion(bool nullToAbsent) {
    return AccountEntityCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      archive: archive == null && nullToAbsent
          ? const Value.absent()
          : Value(archive),
    );
  }

  factory AccountEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AccountEntityData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      archive: serializer.fromJson<bool>(json['archive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'archive': serializer.toJson<bool>(archive),
    };
  }

  AccountEntityData copyWith({int id, String title, bool archive}) =>
      AccountEntityData(
        id: id ?? this.id,
        title: title ?? this.title,
        archive: archive ?? this.archive,
      );
  @override
  String toString() {
    return (StringBuffer('AccountEntityData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('archive: $archive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(title.hashCode, archive.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is AccountEntityData &&
          other.id == this.id &&
          other.title == this.title &&
          other.archive == this.archive);
}

class AccountEntityCompanion extends UpdateCompanion<AccountEntityData> {
  final Value<int> id;
  final Value<String> title;
  final Value<bool> archive;
  const AccountEntityCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.archive = const Value.absent(),
  });
  AccountEntityCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    this.archive = const Value.absent(),
  }) : title = Value(title);
  static Insertable<AccountEntityData> custom({
    Expression<int> id,
    Expression<String> title,
    Expression<bool> archive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (archive != null) 'archive': archive,
    });
  }

  AccountEntityCompanion copyWith(
      {Value<int> id, Value<String> title, Value<bool> archive}) {
    return AccountEntityCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      archive: archive ?? this.archive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (archive.present) {
      map['archive'] = Variable<bool>(archive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountEntityCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('archive: $archive')
          ..write(')'))
        .toString();
  }
}

class $AccountEntityTable extends AccountEntity
    with TableInfo<$AccountEntityTable, AccountEntityData> {
  final GeneratedDatabase _db;
  final String _alias;
  $AccountEntityTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _archiveMeta = const VerificationMeta('archive');
  GeneratedBoolColumn _archive;
  @override
  GeneratedBoolColumn get archive => _archive ??= _constructArchive();
  GeneratedBoolColumn _constructArchive() {
    return GeneratedBoolColumn('archive', $tableName, false,
        defaultValue: const Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [id, title, archive];
  @override
  $AccountEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'accounts';
  @override
  final String actualTableName = 'accounts';
  @override
  VerificationContext validateIntegrity(Insertable<AccountEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('archive')) {
      context.handle(_archiveMeta,
          archive.isAcceptableOrUnknown(data['archive'], _archiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccountEntityData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return AccountEntityData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $AccountEntityTable createAlias(String alias) {
    return $AccountEntityTable(_db, alias);
  }
}

class CategoryEntityData extends DataClass
    implements Insertable<CategoryEntityData> {
  final int id;
  final String title;
  final bool archive;
  final OperationType operationType;
  CategoryEntityData(
      {@required this.id,
      @required this.title,
      @required this.archive,
      @required this.operationType});
  factory CategoryEntityData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return CategoryEntityData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      archive:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}archive']),
      operationType: $CategoryEntityTable.$converter0.mapToDart(intType
          .mapFromDatabaseResponse(data['${effectivePrefix}operation_type'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || archive != null) {
      map['archive'] = Variable<bool>(archive);
    }
    if (!nullToAbsent || operationType != null) {
      final converter = $CategoryEntityTable.$converter0;
      map['operation_type'] = Variable<int>(converter.mapToSql(operationType));
    }
    return map;
  }

  CategoryEntityCompanion toCompanion(bool nullToAbsent) {
    return CategoryEntityCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      archive: archive == null && nullToAbsent
          ? const Value.absent()
          : Value(archive),
      operationType: operationType == null && nullToAbsent
          ? const Value.absent()
          : Value(operationType),
    );
  }

  factory CategoryEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CategoryEntityData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      archive: serializer.fromJson<bool>(json['archive']),
      operationType: serializer.fromJson<OperationType>(json['operationType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'archive': serializer.toJson<bool>(archive),
      'operationType': serializer.toJson<OperationType>(operationType),
    };
  }

  CategoryEntityData copyWith(
          {int id, String title, bool archive, OperationType operationType}) =>
      CategoryEntityData(
        id: id ?? this.id,
        title: title ?? this.title,
        archive: archive ?? this.archive,
        operationType: operationType ?? this.operationType,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryEntityData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('archive: $archive, ')
          ..write('operationType: $operationType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(title.hashCode, $mrjc(archive.hashCode, operationType.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CategoryEntityData &&
          other.id == this.id &&
          other.title == this.title &&
          other.archive == this.archive &&
          other.operationType == this.operationType);
}

class CategoryEntityCompanion extends UpdateCompanion<CategoryEntityData> {
  final Value<int> id;
  final Value<String> title;
  final Value<bool> archive;
  final Value<OperationType> operationType;
  const CategoryEntityCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.archive = const Value.absent(),
    this.operationType = const Value.absent(),
  });
  CategoryEntityCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    this.archive = const Value.absent(),
    @required OperationType operationType,
  })  : title = Value(title),
        operationType = Value(operationType);
  static Insertable<CategoryEntityData> custom({
    Expression<int> id,
    Expression<String> title,
    Expression<bool> archive,
    Expression<int> operationType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (archive != null) 'archive': archive,
      if (operationType != null) 'operation_type': operationType,
    });
  }

  CategoryEntityCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<bool> archive,
      Value<OperationType> operationType}) {
    return CategoryEntityCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      archive: archive ?? this.archive,
      operationType: operationType ?? this.operationType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (archive.present) {
      map['archive'] = Variable<bool>(archive.value);
    }
    if (operationType.present) {
      final converter = $CategoryEntityTable.$converter0;
      map['operation_type'] =
          Variable<int>(converter.mapToSql(operationType.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryEntityCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('archive: $archive, ')
          ..write('operationType: $operationType')
          ..write(')'))
        .toString();
  }
}

class $CategoryEntityTable extends CategoryEntity
    with TableInfo<$CategoryEntityTable, CategoryEntityData> {
  final GeneratedDatabase _db;
  final String _alias;
  $CategoryEntityTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _archiveMeta = const VerificationMeta('archive');
  GeneratedBoolColumn _archive;
  @override
  GeneratedBoolColumn get archive => _archive ??= _constructArchive();
  GeneratedBoolColumn _constructArchive() {
    return GeneratedBoolColumn('archive', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _operationTypeMeta =
      const VerificationMeta('operationType');
  GeneratedIntColumn _operationType;
  @override
  GeneratedIntColumn get operationType =>
      _operationType ??= _constructOperationType();
  GeneratedIntColumn _constructOperationType() {
    return GeneratedIntColumn(
      'operation_type',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, title, archive, operationType];
  @override
  $CategoryEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'categories';
  @override
  final String actualTableName = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('archive')) {
      context.handle(_archiveMeta,
          archive.isAcceptableOrUnknown(data['archive'], _archiveMeta));
    }
    context.handle(_operationTypeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryEntityData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CategoryEntityData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CategoryEntityTable createAlias(String alias) {
    return $CategoryEntityTable(_db, alias);
  }

  static TypeConverter<OperationType, int> $converter0 =
      const OperationTypeConverter();
}

class OperationEntityData extends DataClass
    implements Insertable<OperationEntityData> {
  final int id;
  final DateTime date;
  final OperationType operationType;
  final int account;
  final int category;
  final int recAccount;
  final int sum;
  OperationEntityData(
      {@required this.id,
      @required this.date,
      @required this.operationType,
      @required this.account,
      this.category,
      this.recAccount,
      @required this.sum});
  factory OperationEntityData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return OperationEntityData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      operationType: $OperationEntityTable.$converter0.mapToDart(intType
          .mapFromDatabaseResponse(data['${effectivePrefix}operation_type'])),
      account:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}account']),
      category:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}category']),
      recAccount: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}rec_account']),
      sum: intType.mapFromDatabaseResponse(data['${effectivePrefix}sum']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || operationType != null) {
      final converter = $OperationEntityTable.$converter0;
      map['operation_type'] = Variable<int>(converter.mapToSql(operationType));
    }
    if (!nullToAbsent || account != null) {
      map['account'] = Variable<int>(account);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int>(category);
    }
    if (!nullToAbsent || recAccount != null) {
      map['rec_account'] = Variable<int>(recAccount);
    }
    if (!nullToAbsent || sum != null) {
      map['sum'] = Variable<int>(sum);
    }
    return map;
  }

  OperationEntityCompanion toCompanion(bool nullToAbsent) {
    return OperationEntityCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      operationType: operationType == null && nullToAbsent
          ? const Value.absent()
          : Value(operationType),
      account: account == null && nullToAbsent
          ? const Value.absent()
          : Value(account),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      recAccount: recAccount == null && nullToAbsent
          ? const Value.absent()
          : Value(recAccount),
      sum: sum == null && nullToAbsent ? const Value.absent() : Value(sum),
    );
  }

  factory OperationEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return OperationEntityData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      operationType: serializer.fromJson<OperationType>(json['operationType']),
      account: serializer.fromJson<int>(json['account']),
      category: serializer.fromJson<int>(json['category']),
      recAccount: serializer.fromJson<int>(json['recAccount']),
      sum: serializer.fromJson<int>(json['sum']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'operationType': serializer.toJson<OperationType>(operationType),
      'account': serializer.toJson<int>(account),
      'category': serializer.toJson<int>(category),
      'recAccount': serializer.toJson<int>(recAccount),
      'sum': serializer.toJson<int>(sum),
    };
  }

  OperationEntityData copyWith(
          {int id,
          DateTime date,
          OperationType operationType,
          int account,
          int category,
          int recAccount,
          int sum}) =>
      OperationEntityData(
        id: id ?? this.id,
        date: date ?? this.date,
        operationType: operationType ?? this.operationType,
        account: account ?? this.account,
        category: category ?? this.category,
        recAccount: recAccount ?? this.recAccount,
        sum: sum ?? this.sum,
      );
  @override
  String toString() {
    return (StringBuffer('OperationEntityData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('operationType: $operationType, ')
          ..write('account: $account, ')
          ..write('category: $category, ')
          ..write('recAccount: $recAccount, ')
          ..write('sum: $sum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          date.hashCode,
          $mrjc(
              operationType.hashCode,
              $mrjc(
                  account.hashCode,
                  $mrjc(category.hashCode,
                      $mrjc(recAccount.hashCode, sum.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is OperationEntityData &&
          other.id == this.id &&
          other.date == this.date &&
          other.operationType == this.operationType &&
          other.account == this.account &&
          other.category == this.category &&
          other.recAccount == this.recAccount &&
          other.sum == this.sum);
}

class OperationEntityCompanion extends UpdateCompanion<OperationEntityData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<OperationType> operationType;
  final Value<int> account;
  final Value<int> category;
  final Value<int> recAccount;
  final Value<int> sum;
  const OperationEntityCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.operationType = const Value.absent(),
    this.account = const Value.absent(),
    this.category = const Value.absent(),
    this.recAccount = const Value.absent(),
    this.sum = const Value.absent(),
  });
  OperationEntityCompanion.insert({
    this.id = const Value.absent(),
    @required DateTime date,
    @required OperationType operationType,
    @required int account,
    this.category = const Value.absent(),
    this.recAccount = const Value.absent(),
    @required int sum,
  })  : date = Value(date),
        operationType = Value(operationType),
        account = Value(account),
        sum = Value(sum);
  static Insertable<OperationEntityData> custom({
    Expression<int> id,
    Expression<DateTime> date,
    Expression<int> operationType,
    Expression<int> account,
    Expression<int> category,
    Expression<int> recAccount,
    Expression<int> sum,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (operationType != null) 'operation_type': operationType,
      if (account != null) 'account': account,
      if (category != null) 'category': category,
      if (recAccount != null) 'rec_account': recAccount,
      if (sum != null) 'sum': sum,
    });
  }

  OperationEntityCompanion copyWith(
      {Value<int> id,
      Value<DateTime> date,
      Value<OperationType> operationType,
      Value<int> account,
      Value<int> category,
      Value<int> recAccount,
      Value<int> sum}) {
    return OperationEntityCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      operationType: operationType ?? this.operationType,
      account: account ?? this.account,
      category: category ?? this.category,
      recAccount: recAccount ?? this.recAccount,
      sum: sum ?? this.sum,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (operationType.present) {
      final converter = $OperationEntityTable.$converter0;
      map['operation_type'] =
          Variable<int>(converter.mapToSql(operationType.value));
    }
    if (account.present) {
      map['account'] = Variable<int>(account.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (recAccount.present) {
      map['rec_account'] = Variable<int>(recAccount.value);
    }
    if (sum.present) {
      map['sum'] = Variable<int>(sum.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OperationEntityCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('operationType: $operationType, ')
          ..write('account: $account, ')
          ..write('category: $category, ')
          ..write('recAccount: $recAccount, ')
          ..write('sum: $sum')
          ..write(')'))
        .toString();
  }
}

class $OperationEntityTable extends OperationEntity
    with TableInfo<$OperationEntityTable, OperationEntityData> {
  final GeneratedDatabase _db;
  final String _alias;
  $OperationEntityTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _operationTypeMeta =
      const VerificationMeta('operationType');
  GeneratedIntColumn _operationType;
  @override
  GeneratedIntColumn get operationType =>
      _operationType ??= _constructOperationType();
  GeneratedIntColumn _constructOperationType() {
    return GeneratedIntColumn(
      'operation_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _accountMeta = const VerificationMeta('account');
  GeneratedIntColumn _account;
  @override
  GeneratedIntColumn get account => _account ??= _constructAccount();
  GeneratedIntColumn _constructAccount() {
    return GeneratedIntColumn('account', $tableName, false,
        $customConstraints: 'NULL REFERENCES account(id)');
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  GeneratedIntColumn _category;
  @override
  GeneratedIntColumn get category => _category ??= _constructCategory();
  GeneratedIntColumn _constructCategory() {
    return GeneratedIntColumn('category', $tableName, true,
        $customConstraints: 'NULL REFERENCES category(id)');
  }

  final VerificationMeta _recAccountMeta = const VerificationMeta('recAccount');
  GeneratedIntColumn _recAccount;
  @override
  GeneratedIntColumn get recAccount => _recAccount ??= _constructRecAccount();
  GeneratedIntColumn _constructRecAccount() {
    return GeneratedIntColumn('rec_account', $tableName, true,
        $customConstraints: 'NULL REFERENCES account(id)');
  }

  final VerificationMeta _sumMeta = const VerificationMeta('sum');
  GeneratedIntColumn _sum;
  @override
  GeneratedIntColumn get sum => _sum ??= _constructSum();
  GeneratedIntColumn _constructSum() {
    return GeneratedIntColumn(
      'sum',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, date, operationType, account, category, recAccount, sum];
  @override
  $OperationEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'operations';
  @override
  final String actualTableName = 'operations';
  @override
  VerificationContext validateIntegrity(
      Insertable<OperationEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    context.handle(_operationTypeMeta, const VerificationResult.success());
    if (data.containsKey('account')) {
      context.handle(_accountMeta,
          account.isAcceptableOrUnknown(data['account'], _accountMeta));
    } else if (isInserting) {
      context.missing(_accountMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category'], _categoryMeta));
    }
    if (data.containsKey('rec_account')) {
      context.handle(
          _recAccountMeta,
          recAccount.isAcceptableOrUnknown(
              data['rec_account'], _recAccountMeta));
    }
    if (data.containsKey('sum')) {
      context.handle(
          _sumMeta, sum.isAcceptableOrUnknown(data['sum'], _sumMeta));
    } else if (isInserting) {
      context.missing(_sumMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OperationEntityData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return OperationEntityData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $OperationEntityTable createAlias(String alias) {
    return $OperationEntityTable(_db, alias);
  }

  static TypeConverter<OperationType, int> $converter0 =
      const OperationTypeConverter();
}

class BalanceEntityData extends DataClass
    implements Insertable<BalanceEntityData> {
  final DateTime date;
  final int operation;
  final int account;
  final int sum;
  BalanceEntityData(
      {@required this.date,
      @required this.operation,
      @required this.account,
      @required this.sum});
  factory BalanceEntityData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    return BalanceEntityData(
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      operation:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}operation']),
      account:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}account']),
      sum: intType.mapFromDatabaseResponse(data['${effectivePrefix}sum']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || operation != null) {
      map['operation'] = Variable<int>(operation);
    }
    if (!nullToAbsent || account != null) {
      map['account'] = Variable<int>(account);
    }
    if (!nullToAbsent || sum != null) {
      map['sum'] = Variable<int>(sum);
    }
    return map;
  }

  BalanceEntityCompanion toCompanion(bool nullToAbsent) {
    return BalanceEntityCompanion(
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      operation: operation == null && nullToAbsent
          ? const Value.absent()
          : Value(operation),
      account: account == null && nullToAbsent
          ? const Value.absent()
          : Value(account),
      sum: sum == null && nullToAbsent ? const Value.absent() : Value(sum),
    );
  }

  factory BalanceEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BalanceEntityData(
      date: serializer.fromJson<DateTime>(json['date']),
      operation: serializer.fromJson<int>(json['operation']),
      account: serializer.fromJson<int>(json['account']),
      sum: serializer.fromJson<int>(json['sum']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<DateTime>(date),
      'operation': serializer.toJson<int>(operation),
      'account': serializer.toJson<int>(account),
      'sum': serializer.toJson<int>(sum),
    };
  }

  BalanceEntityData copyWith(
          {DateTime date, int operation, int account, int sum}) =>
      BalanceEntityData(
        date: date ?? this.date,
        operation: operation ?? this.operation,
        account: account ?? this.account,
        sum: sum ?? this.sum,
      );
  @override
  String toString() {
    return (StringBuffer('BalanceEntityData(')
          ..write('date: $date, ')
          ..write('operation: $operation, ')
          ..write('account: $account, ')
          ..write('sum: $sum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(date.hashCode,
      $mrjc(operation.hashCode, $mrjc(account.hashCode, sum.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is BalanceEntityData &&
          other.date == this.date &&
          other.operation == this.operation &&
          other.account == this.account &&
          other.sum == this.sum);
}

class BalanceEntityCompanion extends UpdateCompanion<BalanceEntityData> {
  final Value<DateTime> date;
  final Value<int> operation;
  final Value<int> account;
  final Value<int> sum;
  const BalanceEntityCompanion({
    this.date = const Value.absent(),
    this.operation = const Value.absent(),
    this.account = const Value.absent(),
    this.sum = const Value.absent(),
  });
  BalanceEntityCompanion.insert({
    @required DateTime date,
    @required int operation,
    @required int account,
    @required int sum,
  })  : date = Value(date),
        operation = Value(operation),
        account = Value(account),
        sum = Value(sum);
  static Insertable<BalanceEntityData> custom({
    Expression<DateTime> date,
    Expression<int> operation,
    Expression<int> account,
    Expression<int> sum,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (operation != null) 'operation': operation,
      if (account != null) 'account': account,
      if (sum != null) 'sum': sum,
    });
  }

  BalanceEntityCompanion copyWith(
      {Value<DateTime> date,
      Value<int> operation,
      Value<int> account,
      Value<int> sum}) {
    return BalanceEntityCompanion(
      date: date ?? this.date,
      operation: operation ?? this.operation,
      account: account ?? this.account,
      sum: sum ?? this.sum,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (operation.present) {
      map['operation'] = Variable<int>(operation.value);
    }
    if (account.present) {
      map['account'] = Variable<int>(account.value);
    }
    if (sum.present) {
      map['sum'] = Variable<int>(sum.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BalanceEntityCompanion(')
          ..write('date: $date, ')
          ..write('operation: $operation, ')
          ..write('account: $account, ')
          ..write('sum: $sum')
          ..write(')'))
        .toString();
  }
}

class $BalanceEntityTable extends BalanceEntity
    with TableInfo<$BalanceEntityTable, BalanceEntityData> {
  final GeneratedDatabase _db;
  final String _alias;
  $BalanceEntityTable(this._db, [this._alias]);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _operationMeta = const VerificationMeta('operation');
  GeneratedIntColumn _operation;
  @override
  GeneratedIntColumn get operation => _operation ??= _constructOperation();
  GeneratedIntColumn _constructOperation() {
    return GeneratedIntColumn('operation', $tableName, false,
        $customConstraints: 'NULL REFERENCES operation(id)');
  }

  final VerificationMeta _accountMeta = const VerificationMeta('account');
  GeneratedIntColumn _account;
  @override
  GeneratedIntColumn get account => _account ??= _constructAccount();
  GeneratedIntColumn _constructAccount() {
    return GeneratedIntColumn('account', $tableName, false,
        $customConstraints: 'NULL REFERENCES account(id)');
  }

  final VerificationMeta _sumMeta = const VerificationMeta('sum');
  GeneratedIntColumn _sum;
  @override
  GeneratedIntColumn get sum => _sum ??= _constructSum();
  GeneratedIntColumn _constructSum() {
    return GeneratedIntColumn(
      'sum',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [date, operation, account, sum];
  @override
  $BalanceEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'balance';
  @override
  final String actualTableName = 'balance';
  @override
  VerificationContext validateIntegrity(Insertable<BalanceEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(_operationMeta,
          operation.isAcceptableOrUnknown(data['operation'], _operationMeta));
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('account')) {
      context.handle(_accountMeta,
          account.isAcceptableOrUnknown(data['account'], _accountMeta));
    } else if (isInserting) {
      context.missing(_accountMeta);
    }
    if (data.containsKey('sum')) {
      context.handle(
          _sumMeta, sum.isAcceptableOrUnknown(data['sum'], _sumMeta));
    } else if (isInserting) {
      context.missing(_sumMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {operation, account};
  @override
  BalanceEntityData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return BalanceEntityData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BalanceEntityTable createAlias(String alias) {
    return $BalanceEntityTable(_db, alias);
  }
}

class CashflowEntityData extends DataClass
    implements Insertable<CashflowEntityData> {
  final DateTime date;
  final int operation;
  final int category;
  final int sum;
  CashflowEntityData(
      {@required this.date,
      @required this.operation,
      @required this.category,
      @required this.sum});
  factory CashflowEntityData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    return CashflowEntityData(
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      operation:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}operation']),
      category:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}category']),
      sum: intType.mapFromDatabaseResponse(data['${effectivePrefix}sum']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || operation != null) {
      map['operation'] = Variable<int>(operation);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int>(category);
    }
    if (!nullToAbsent || sum != null) {
      map['sum'] = Variable<int>(sum);
    }
    return map;
  }

  CashflowEntityCompanion toCompanion(bool nullToAbsent) {
    return CashflowEntityCompanion(
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      operation: operation == null && nullToAbsent
          ? const Value.absent()
          : Value(operation),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      sum: sum == null && nullToAbsent ? const Value.absent() : Value(sum),
    );
  }

  factory CashflowEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CashflowEntityData(
      date: serializer.fromJson<DateTime>(json['date']),
      operation: serializer.fromJson<int>(json['operation']),
      category: serializer.fromJson<int>(json['category']),
      sum: serializer.fromJson<int>(json['sum']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<DateTime>(date),
      'operation': serializer.toJson<int>(operation),
      'category': serializer.toJson<int>(category),
      'sum': serializer.toJson<int>(sum),
    };
  }

  CashflowEntityData copyWith(
          {DateTime date, int operation, int category, int sum}) =>
      CashflowEntityData(
        date: date ?? this.date,
        operation: operation ?? this.operation,
        category: category ?? this.category,
        sum: sum ?? this.sum,
      );
  @override
  String toString() {
    return (StringBuffer('CashflowEntityData(')
          ..write('date: $date, ')
          ..write('operation: $operation, ')
          ..write('category: $category, ')
          ..write('sum: $sum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(date.hashCode,
      $mrjc(operation.hashCode, $mrjc(category.hashCode, sum.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CashflowEntityData &&
          other.date == this.date &&
          other.operation == this.operation &&
          other.category == this.category &&
          other.sum == this.sum);
}

class CashflowEntityCompanion extends UpdateCompanion<CashflowEntityData> {
  final Value<DateTime> date;
  final Value<int> operation;
  final Value<int> category;
  final Value<int> sum;
  const CashflowEntityCompanion({
    this.date = const Value.absent(),
    this.operation = const Value.absent(),
    this.category = const Value.absent(),
    this.sum = const Value.absent(),
  });
  CashflowEntityCompanion.insert({
    @required DateTime date,
    @required int operation,
    @required int category,
    @required int sum,
  })  : date = Value(date),
        operation = Value(operation),
        category = Value(category),
        sum = Value(sum);
  static Insertable<CashflowEntityData> custom({
    Expression<DateTime> date,
    Expression<int> operation,
    Expression<int> category,
    Expression<int> sum,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (operation != null) 'operation': operation,
      if (category != null) 'category': category,
      if (sum != null) 'sum': sum,
    });
  }

  CashflowEntityCompanion copyWith(
      {Value<DateTime> date,
      Value<int> operation,
      Value<int> category,
      Value<int> sum}) {
    return CashflowEntityCompanion(
      date: date ?? this.date,
      operation: operation ?? this.operation,
      category: category ?? this.category,
      sum: sum ?? this.sum,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (operation.present) {
      map['operation'] = Variable<int>(operation.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (sum.present) {
      map['sum'] = Variable<int>(sum.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CashflowEntityCompanion(')
          ..write('date: $date, ')
          ..write('operation: $operation, ')
          ..write('category: $category, ')
          ..write('sum: $sum')
          ..write(')'))
        .toString();
  }
}

class $CashflowEntityTable extends CashflowEntity
    with TableInfo<$CashflowEntityTable, CashflowEntityData> {
  final GeneratedDatabase _db;
  final String _alias;
  $CashflowEntityTable(this._db, [this._alias]);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _operationMeta = const VerificationMeta('operation');
  GeneratedIntColumn _operation;
  @override
  GeneratedIntColumn get operation => _operation ??= _constructOperation();
  GeneratedIntColumn _constructOperation() {
    return GeneratedIntColumn('operation', $tableName, false,
        $customConstraints: 'NULL REFERENCES operation(id)');
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  GeneratedIntColumn _category;
  @override
  GeneratedIntColumn get category => _category ??= _constructCategory();
  GeneratedIntColumn _constructCategory() {
    return GeneratedIntColumn('category', $tableName, false,
        $customConstraints: 'NULL REFERENCES category(id)');
  }

  final VerificationMeta _sumMeta = const VerificationMeta('sum');
  GeneratedIntColumn _sum;
  @override
  GeneratedIntColumn get sum => _sum ??= _constructSum();
  GeneratedIntColumn _constructSum() {
    return GeneratedIntColumn(
      'sum',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [date, operation, category, sum];
  @override
  $CashflowEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cashflow';
  @override
  final String actualTableName = 'cashflow';
  @override
  VerificationContext validateIntegrity(Insertable<CashflowEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(_operationMeta,
          operation.isAcceptableOrUnknown(data['operation'], _operationMeta));
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category'], _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('sum')) {
      context.handle(
          _sumMeta, sum.isAcceptableOrUnknown(data['sum'], _sumMeta));
    } else if (isInserting) {
      context.missing(_sumMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {operation, category};
  @override
  CashflowEntityData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CashflowEntityData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CashflowEntityTable createAlias(String alias) {
    return $CashflowEntityTable(_db, alias);
  }
}

class BudgetData extends DataClass implements Insertable<BudgetData> {
  final DateTime date;
  final int category;
  final int sum;
  BudgetData(
      {@required this.date, @required this.category, @required this.sum});
  factory BudgetData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    return BudgetData(
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      category:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}category']),
      sum: intType.mapFromDatabaseResponse(data['${effectivePrefix}sum']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int>(category);
    }
    if (!nullToAbsent || sum != null) {
      map['sum'] = Variable<int>(sum);
    }
    return map;
  }

  BudgetCompanion toCompanion(bool nullToAbsent) {
    return BudgetCompanion(
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      sum: sum == null && nullToAbsent ? const Value.absent() : Value(sum),
    );
  }

  factory BudgetData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BudgetData(
      date: serializer.fromJson<DateTime>(json['date']),
      category: serializer.fromJson<int>(json['category']),
      sum: serializer.fromJson<int>(json['sum']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<DateTime>(date),
      'category': serializer.toJson<int>(category),
      'sum': serializer.toJson<int>(sum),
    };
  }

  BudgetData copyWith({DateTime date, int category, int sum}) => BudgetData(
        date: date ?? this.date,
        category: category ?? this.category,
        sum: sum ?? this.sum,
      );
  @override
  String toString() {
    return (StringBuffer('BudgetData(')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('sum: $sum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(date.hashCode, $mrjc(category.hashCode, sum.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is BudgetData &&
          other.date == this.date &&
          other.category == this.category &&
          other.sum == this.sum);
}

class BudgetCompanion extends UpdateCompanion<BudgetData> {
  final Value<DateTime> date;
  final Value<int> category;
  final Value<int> sum;
  const BudgetCompanion({
    this.date = const Value.absent(),
    this.category = const Value.absent(),
    this.sum = const Value.absent(),
  });
  BudgetCompanion.insert({
    @required DateTime date,
    @required int category,
    @required int sum,
  })  : date = Value(date),
        category = Value(category),
        sum = Value(sum);
  static Insertable<BudgetData> custom({
    Expression<DateTime> date,
    Expression<int> category,
    Expression<int> sum,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (category != null) 'category': category,
      if (sum != null) 'sum': sum,
    });
  }

  BudgetCompanion copyWith(
      {Value<DateTime> date, Value<int> category, Value<int> sum}) {
    return BudgetCompanion(
      date: date ?? this.date,
      category: category ?? this.category,
      sum: sum ?? this.sum,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (sum.present) {
      map['sum'] = Variable<int>(sum.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BudgetCompanion(')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('sum: $sum')
          ..write(')'))
        .toString();
  }
}

class $BudgetTable extends Budget with TableInfo<$BudgetTable, BudgetData> {
  final GeneratedDatabase _db;
  final String _alias;
  $BudgetTable(this._db, [this._alias]);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  GeneratedIntColumn _category;
  @override
  GeneratedIntColumn get category => _category ??= _constructCategory();
  GeneratedIntColumn _constructCategory() {
    return GeneratedIntColumn('category', $tableName, false,
        $customConstraints: 'NULL REFERENCES category(id)');
  }

  final VerificationMeta _sumMeta = const VerificationMeta('sum');
  GeneratedIntColumn _sum;
  @override
  GeneratedIntColumn get sum => _sum ??= _constructSum();
  GeneratedIntColumn _constructSum() {
    return GeneratedIntColumn(
      'sum',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [date, category, sum];
  @override
  $BudgetTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'budgets';
  @override
  final String actualTableName = 'budgets';
  @override
  VerificationContext validateIntegrity(Insertable<BudgetData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category'], _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('sum')) {
      context.handle(
          _sumMeta, sum.isAcceptableOrUnknown(data['sum'], _sumMeta));
    } else if (isInserting) {
      context.missing(_sumMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {date, category};
  @override
  BudgetData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return BudgetData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BudgetTable createAlias(String alias) {
    return $BudgetTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $AccountEntityTable _accountEntity;
  $AccountEntityTable get accountEntity =>
      _accountEntity ??= $AccountEntityTable(this);
  $CategoryEntityTable _categoryEntity;
  $CategoryEntityTable get categoryEntity =>
      _categoryEntity ??= $CategoryEntityTable(this);
  $OperationEntityTable _operationEntity;
  $OperationEntityTable get operationEntity =>
      _operationEntity ??= $OperationEntityTable(this);
  $BalanceEntityTable _balanceEntity;
  $BalanceEntityTable get balanceEntity =>
      _balanceEntity ??= $BalanceEntityTable(this);
  $CashflowEntityTable _cashflowEntity;
  $CashflowEntityTable get cashflowEntity =>
      _cashflowEntity ??= $CashflowEntityTable(this);
  $BudgetTable _budget;
  $BudgetTable get budget => _budget ??= $BudgetTable(this);
  AccountDao _accountDao;
  AccountDao get accountDao => _accountDao ??= AccountDao(this as Database);
  CategoryDao _categoryDao;
  CategoryDao get categoryDao => _categoryDao ??= CategoryDao(this as Database);
  OperationDao _operationDao;
  OperationDao get operationDao =>
      _operationDao ??= OperationDao(this as Database);
  BudgetDao _budgetDao;
  BudgetDao get budgetDao => _budgetDao ??= BudgetDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        accountEntity,
        categoryEntity,
        operationEntity,
        balanceEntity,
        cashflowEntity,
        budget
      ];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$AccountDaoMixin on DatabaseAccessor<Database> {
  $AccountEntityTable get accountEntity => attachedDatabase.accountEntity;
  $BalanceEntityTable get balanceEntity => attachedDatabase.balanceEntity;
}
mixin _$CategoryDaoMixin on DatabaseAccessor<Database> {
  $CategoryEntityTable get categoryEntity => attachedDatabase.categoryEntity;
  $BudgetTable get budget => attachedDatabase.budget;
  $CashflowEntityTable get cashflowEntity => attachedDatabase.cashflowEntity;
}
mixin _$OperationDaoMixin on DatabaseAccessor<Database> {
  $AccountEntityTable get accountEntity => attachedDatabase.accountEntity;
  $CategoryEntityTable get categoryEntity => attachedDatabase.categoryEntity;
  $OperationEntityTable get operationEntity => attachedDatabase.operationEntity;
  $BalanceEntityTable get balanceEntity => attachedDatabase.balanceEntity;
  $CashflowEntityTable get cashflowEntity => attachedDatabase.cashflowEntity;
}
mixin _$BudgetDaoMixin on DatabaseAccessor<Database> {
  $BudgetTable get budget => attachedDatabase.budget;
}
