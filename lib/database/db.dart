import 'drift_database.dart';

class DB {
  static AppDatabase? database;

  AppDatabase getDataBase(){
    if(database == null){
     return database = AppDatabase();
    }else{
      return database!;
    }
  }
}