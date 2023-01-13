import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
part 'drift_database.g.dart';



class UserDataTable extends Table {
  // autoincrement sets this to the primary key
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 5, max: 200)();
  TextColumn get userTitle => text()();
  TextColumn get description => text()();

}

@DriftDatabase(tables: [UserDataTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() :super(_openConnection());

 // AppDatabase(QueryExecutor e): super(e);

  @override
  int get schemaVersion => 1;

  Future<List<UserDataTableData>> getAllUserdata() =>
      select(userDataTable).get();
  Future insertUser(UserDataTableCompanion user) =>
      into(userDataTable).insert(user);
  Future updateUser(UserDataTableData user) =>
      update(userDataTable).replace(user);
  Future deleteUser(UserDataTableData user) =>
      delete(userDataTable).delete(user);
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file , logStatements: true);
  });
}




