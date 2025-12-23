import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLite {
  static final SQLite instance = SQLite._init();
  static Database? _database;
  SQLite._init();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('PrimeDerma.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  FutureOr<void> _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE User (UserID INTEGER PRIMARY KEY, Email TEXT, Password TEXT, TouchID INTEGER)
    ''');

    await db.rawInsert("""
        INSERT INTO User
        (UserID, Email, Password, TouchID)
        VALUES (0, '', '', 0)
        """);

    // await db.execute('''
    // CREATE TABLE AppSetting (SettingID INTEGER PRIMARY KEY, SettingName TEXT, SettingValue TEXT)
    // ''');
    // await db.rawInsert("""
    //     INSERT INTO AppSetting
    //     (SettingID, SettingName, SettingValue)
    //     VALUES (1, 'CityLastDate', '2000-01-01 00:00:00')
    //   """);

    //  await db.execute('''
    //       CREATE TABLE User (
    //         $columnId INTEGER PRIMARY KEY,
    //         $columnEmail TEXT NOT NULL,
    //         $columnPassword TEXT NOT NULL
    //       )
    //       ''');

    //  await db.execute(
    //     '''
    // CREATE TABLE Admin (AdminID INTEGER PRIMARY KEY, AdminName TEXT, Email TEXT,
    // Password TEXT, Mobile TEXT, LoginType TEXT, AutoLogin INTEGER)
    // ''');

    // await db.execute(
    //     '''
    // CREATE TABLE AppSetting (SettingID INTEGER PRIMARY KEY, SettingName TEXT, SettingValue TEXT)
    // ''');
    // await db.execute(
    //     '''
    // CREATE TABLE SubCategory
    // (SubCatID INTEGER PRIMARY KEY, CatID INTEGER, SubCatName TEXT, OnIndex INTEGER, LastEdit TEXT)
    // ''');
    // await db.rawInsert(
    //     """
    //     INSERT INTO AppSetting
    //     (SettingID, SettingName, SettingValue)
    //     VALUES (1, 'SubCatLastDate', '1970-01-01 00:00:00')""");
    // await db.rawInsert(
    //     """
    //     INSERT INTO AppSetting
    //     (SettingID, SettingName, SettingValue)
    //     VALUES (2, 'TotalDataLastDate', '1970-01-01 00:00:00')
    //     """);
    // await db.execute(
    //     '''
    // CREATE TABLE Cart
    // (CID INTEGER PRIMARY KEY, ProductID INTEGER, TypeID INTEGER, ProductName Text, Price Text, MaxQuantity INTEGER, Shipping TEXT, Image TEXT, DeliveryCharges Text, PriceIDs INTEGER)
    // ''');
    // await db.execute(
    //     '''
    // CREATE TABLE Country
    // (CountryID INTEGER PRIMARY KEY, CountryName TEXT, CountryCode TEXT, LastEdit TEXT)
    // ''');
    // await db.execute(
    //     '''
    // CREATE TABLE Currency
    // (CurrencyID INTEGER PRIMARY KEY, CurrencyName TEXT, CurrencySymbol TEXT, CurrencyFlag TEXT, LastEdit TEXT)
    // ''');
    // await db.rawInsert(
    //     """
    //     INSERT INTO AppSetting
    //     (SettingID, SettingName, SettingValue)
    //     VALUES (3, 'CountryLastDate', '1970-01-01 00:00:00')""");
    // await db.rawInsert(
    //     """
    //     INSERT INTO AppSetting
    //     (SettingID, SettingName, SettingValue)
    //     VALUES (4, 'CountryName', '')
    //     """);
    // await db.rawInsert(
    //     """
    //     INSERT INTO AppSetting
    //     (SettingID, SettingName, SettingValue)
    //     VALUES (5, 'CurrencyLastDate', '1970-01-01 00:00:00')
    //     """);
    // await db.rawInsert(
    //     """
    //     INSERT INTO AppSetting
    //     (SettingID, SettingName, SettingValue)
    //     VALUES (6, 'CurrencyName', 'GBP (Rs)')
    //     """);
    // await db.rawInsert(
    //     """
    //     INSERT INTO AppSetting
    //     (SettingID, SettingName, SettingValue)
    //     VALUES (7, 'CurrencyID', '2')
    //     """);
  }

  // Future<void> _upgradeDB(Database db, int oldVersion, int newVersion) async {
  //   if (oldVersion < newVersion) {
  //     await db.execute(
  //       '''ALTER TABLE Consultation ADD COLUMN DoctorID INTEGER''',
  //     );
  //   }
  //   if (kDebugMode) {
  //     print(
  //       "Database upgraded from version $oldVersion to version $newVersion",
  //     );
  //   }
  // }

  static Future<String> getValue(
    String field,
    String table,
    String where,
  ) async {
    String value = "";
    try {
      final db = await instance.database;
      var queryData = await db.rawQuery(
        "SELECT $field FROM $table WHERE $where",
      );
      value = (queryData.first[field]).toString();
    } catch (e) {
      if (kDebugMode) {
        print('GetValue EXP: $e');
      }
    }
    return value;
  }

  static updateValue(
    String field,
    String table,
    String where,
    String value,
  ) async {
    try {
      final db = await instance.database;
      await db.rawQuery("""
               UPDATE $table SET
               $field = '$value'
               WHERE $where
               """);
    } catch (e) {
      if (kDebugMode) {
        print('UpdateValue EXP: $e');
      }
    }
  }

  static Future<int> insertUser(String email, String password) async {
    final db = await SQLite.instance.database;
    Map<String, dynamic> row = {'Email': email, 'Password': password};
    return await db.insert('User', row);
  }

  static Future<Map<String, dynamic>?> getUser() async {
    final db = await SQLite.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('User');
    if (maps.isNotEmpty) {
      final user = maps.first;
      return user;
    }
    return null;
  }

  static Future<void> deleteUser() async {
    try {
      final db = await SQLite.instance.database;
      final int rowsDeleted = await db.delete('User');
      if (rowsDeleted > 0) {
        debugPrint('User deleted successfully');
      } else {
        debugPrint('No user found to delete');
      }
    } catch (e) {
      debugPrint('Error deleting user: $e');
    }
  }

  // static updateLastEdit(value, settingName) async {
  //   try {
  //     final db = await instance.database;
  //     await db.rawQuery(
  //         "UPDATE AppSetting SET SettingValue = '$value' WHERE SettingName = '$settingName'");
  //   } catch (e) {}
  // }

  // static Future<String> getLastDate(String settingName) async {
  //   var lastEdited = "";
  //   final db = await instance.database;
  //   var queryData = await db.rawQuery(
  //       "SELECT * FROM AppSetting WHERE SettingName = '$settingName' ");
  //   var dataRow = queryData.first;
  //   lastEdited = dataRow['SettingValue'].toString();
  //   return lastEdited;
  // }
}
