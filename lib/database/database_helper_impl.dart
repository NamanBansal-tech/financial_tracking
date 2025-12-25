import 'package:dartz/dartz.dart';
import 'package:finance_tracking/database/database_helper.dart';
import 'package:finance_tracking/database/database_table_queries.dart';
import 'package:finance_tracking/models/category_model/category_model.dart';
import 'package:finance_tracking/models/page_meta/page_meta.dart';
import 'package:finance_tracking/models/transaction_model/transaction_model.dart';
import 'package:finance_tracking/utils/sample_budget_data.dart';
import 'package:finance_tracking/utils/sample_transactions.dart';
import 'package:finance_tracking/utils/type_def.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path/path.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

class DatabaseHelperImpl extends DatabaseHelper {
  final FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();

  Database? _database;

  Future<Database?> get database async {
    try {
      if (_database != null) {
        return _database;
      }
      _database = await initAppDatabase();
      return _database;
    } catch (e) {
      debugPrint('Get Database Exception: $e');
    }
    return null;
  }

  @override
  Future<Database?> initAppDatabase() async {
    try {
      final String dbPassword = 'DB_PASSWORD';
      String? password = await _flutterSecureStorage.read(key: dbPassword);
      if (password == null) {
        password = 'FINANCE_${DateTime.now().microsecondsSinceEpoch}_TRACKER';
        await _flutterSecureStorage.write(key: dbPassword, value: password);
      }
      final path = await getDatabasesPath();
      final dbPath = join(path, 'finance_tracker_database.db');
      return await openDatabase(
        dbPath,
        password: password,
        onCreate: onCreate,
        version: 1,
      );
    } catch (e) {
      debugPrint('Init Database Exception: $e');
    }
    return null;
  }

  Future<void>? onCreate(Database db, int version) async {
    try {
      await db.execute(DatabaseTableQueries.createCategoryTable);
      await db.execute(DatabaseTableQueries.createTransactionTable);
      final Batch batch = db.batch();
      for (var e in sampleBudgetData) {
        e.remove('id');
        batch.insert(EDatabaseTableNames.categoryTable.name, e);
      }
      await batch.commit();
    } catch (e) {
      debugPrint('Create Table Exception: $e');
    }
  }

  @override
  ResultOrException<String> addCategory(CategoryModel category) async {
    try {
      final db = await database;
      if (db != null) {
        final count = Sqflite.firstIntValue(
          await db.query(
            EDatabaseTableNames.categoryTable.name,
            where: 'categoryName = ?',
            whereArgs: [category.categoryName],
          ),
        );
        if (count != null && count != 0) {
          return Left('This category already exists.');
        } else {
          final map = category.toJson();
          map.remove('id');
          await db.insert(EDatabaseTableNames.categoryTable.name, map);
          return Right('Category Added Successfully');
        }
      } else {
        return Left('Something went wrong! Please try again later!');
      }
    } catch (e) {
      debugPrint('Add Category Exception: $e');
      return Left('Something went wrong! Please try again later!');
    }
  }

  @override
  ResultOrException<String> addTransaction(TransactionModel transaction) async {
    try {
      final db = await database;
      if (db != null) {
        final map = transaction.toJson();
        map.remove('id');
        await db.insert(EDatabaseTableNames.transactionTable.name, map);
        return Right('Transaction Added Successfully');
      } else {
        return Left('Something went wrong! Please try again later!');
      }
    } catch (e) {
      debugPrint('Add Transaction Exception: $e');
      return Left('Something went wrong! Please try again later!');
    }
  }

  @override
  ResultOrException<List<CategoryModel>> getCategories({
    String? categoryName,
    double? budgetAmount,
    int? duration,
    int? budgetPeriod,
  }) async {
    try {
      final db = await database;
      String? where;
      List<Object?>? whereArgs;
      if (categoryName != null) {
        where = "categoryName LIKE ?";
        whereArgs = ['%$categoryName%'];
      }
      if (budgetAmount != null) {
        if (where != null && whereArgs != null) {
          where = '$where AND budgetAmount = ?';
          whereArgs.add(budgetAmount);
        } else {
          where = "budgetAmount = ?";
          whereArgs = [budgetAmount];
        }
      }
      if (duration != null) {
        if (where != null && whereArgs != null) {
          where = '$where AND duration = ?';
          whereArgs.add(duration);
        } else {
          where = "duration = ?";
          whereArgs = [duration];
        }
      }
      if (budgetPeriod != null) {
        if (where != null && whereArgs != null) {
          where = '$where AND budgetPeriod = ?';
          whereArgs.add(budgetPeriod);
        } else {
          where = "budgetPeriod = ?";
          whereArgs = [budgetPeriod];
        }
      }
      if (db != null) {
        final data = await db.query(
          EDatabaseTableNames.categoryTable.name,
          where: where,
          whereArgs: whereArgs,
        );
        if (data.isNotEmpty) {
          return Right(data.map((e) => CategoryModel.fromJson(e)).toList());
        } else {
          return Left('No categories found in the database.');
        }
      } else {
        return Left('Something went wrong! Please try again later!');
      }
    } catch (e) {
      debugPrint('Get Categories Exception: $e');
      return Left('Something went wrong! Please try again later!');
    }
  }

  @override
  ResultOrException<List<TransactionModel>> getTransactions({
    String? fromDate,
    String? toDate,
    String? transactionDate,
    String? transactionName,
    String? amount,
    int? categoryId,
    int? transactionType,
    PageMeta? pageMeta,
  }) async {
    try {
      final db = await database;
      if (db != null) {
        String? where;
        List<Object?>? whereArgs;
        if (transactionDate != null) {
          where = 'date = ? ';
          whereArgs = [transactionDate];
        }
        if (fromDate != null) {
          where = 'date >= ? ';
          whereArgs = [fromDate];
        }
        if (toDate != null) {
          if (where != null && whereArgs != null) {
            where = '$where AND date <= ?';
            whereArgs.add(toDate);
          } else {
            where = 'date <= ?';
            whereArgs = [toDate];
          }
        }
        if (transactionName != null && transactionName.isNotEmpty) {
          if (where != null && whereArgs != null) {
            where = '$where AND notes LIKE ? ';
            whereArgs.add('%$transactionName%');
          } else {
            where = 'notes LIKE ? ';
            whereArgs = ['%$transactionName%'];
          }
        }
        if (amount != null && amount.isNotEmpty) {
          if (where != null && whereArgs != null) {
            where = '$where AND amount = ? ';
            whereArgs.add(amount);
          } else {
            where = 'amount = ? ';
            whereArgs = [amount];
          }
        }
        if (categoryId != null) {
          if (where != null && whereArgs != null) {
            where = '$where AND categoryId = ? ';
            whereArgs.add(categoryId);
          } else {
            where = 'categoryId = ? ';
            whereArgs = [categoryId];
          }
        }
        if (transactionType != null) {
          if (where != null && whereArgs != null) {
            where = '$where AND type = ? ';
            whereArgs.add(transactionType);
          } else {
            where = 'type = ? ';
            whereArgs = [transactionType];
          }
        }
        if (pageMeta != null && where != null && whereArgs != null) {
          final data = await db.rawQuery(
            'SELECT DISTINCT * FROM ${EDatabaseTableNames.transactionTable.name} WHERE $where ORDER BY date DESC LIMIT ? OFFSET ?',
            [...whereArgs, pageMeta.limit, pageMeta.offset],
          );
          return Right(data.map((e) => TransactionModel.fromJson(e)).toList());
        } else if (pageMeta != null) {
          final data = await db.rawQuery(
            'SELECT DISTINCT * FROM ${EDatabaseTableNames.transactionTable.name} ORDER BY date DESC LIMIT ? OFFSET ?',
            [pageMeta.limit, pageMeta.offset],
          );
          return Right(data.map((e) => TransactionModel.fromJson(e)).toList());
        } else if (where != null && whereArgs != null) {
          final data = await db.rawQuery(
            'SELECT DISTINCT * FROM ${EDatabaseTableNames.transactionTable.name} WHERE $where ORDER BY date DESC',
            [...whereArgs],
          );
          return Right(data.map((e) => TransactionModel.fromJson(e)).toList());
        } else {
          final data = await db.rawQuery(
            'SELECT DISTINCT * FROM ${EDatabaseTableNames.transactionTable.name} ORDER BY date DESC',
          );
          return Right(data.map((e) => TransactionModel.fromJson(e)).toList());
        }
      } else {
        return Left('Something went wrong! Please try again later!');
      }
    } catch (e) {
      debugPrint('Get Transactions Exception: $e');
      return Left('Something went wrong! Please try again later!');
    }
  }

  @override
  ResultOrException<String> deleteCategory(int categoryId) async {
    try {
      final db = await database;
      if (db != null) {
        await db.delete(
          EDatabaseTableNames.categoryTable.name,
          where: 'id = ?',
          whereArgs: [categoryId],
        );
        return Right('Category deleted Successfully');
      } else {
        return Left('Something went wrong! Please try again later!');
      }
    } catch (e) {
      debugPrint('Delete Category Exception: $e');
      return Left('Something went wrong! Please try again later!');
    }
  }

  @override
  ResultOrException<String> deleteTransaction(int transactionId) async {
    try {
      final db = await database;
      if (db != null) {
        await db.delete(
          EDatabaseTableNames.transactionTable.name,
          where: 'id = ?',
          whereArgs: [transactionId],
        );
        return Right('Transaction deleted Successfully');
      } else {
        return Left('Something went wrong! Please try again later!');
      }
    } catch (e) {
      debugPrint('Delete Transaction Exception: $e');
      return Left('Something went wrong! Please try again later!');
    }
  }

  @override
  ResultOrException<String> editTransaction(
    TransactionModel transaction,
  ) async {
    try {
      final db = await database;
      if (db != null) {
        final count = Sqflite.firstIntValue(
          await db.query(
            EDatabaseTableNames.transactionTable.name,
            where: 'id = ?',
            whereArgs: [transaction.id],
          ),
        );
        if (count != null && count != 0) {
          await db.update(
            EDatabaseTableNames.transactionTable.name,
            transaction.toJson(),
            where: 'id = ?',
            whereArgs: [transaction.id],
          );
          return Right('Changes saved Successfully');
        } else {
          await db.insert(
            EDatabaseTableNames.transactionTable.name,
            transaction.toJson(),
          );
          return Right(
            'No Transaction exist with these details. So, New transaction added Successfully',
          );
        }
      } else {
        return Left('Something went wrong! Please try again later!');
      }
    } catch (e) {
      debugPrint('Edit Transaction Exception: $e');
      return Left('Something went wrong! Please try again later!');
    }
  }

  @override
  ResultOrException<CategoryModel> getCategory(int categoryId) async {
    try {
      final db = await database;
      if (db != null) {
        final data = await db.query(
          EDatabaseTableNames.categoryTable.name,
          where: 'id = ?',
          whereArgs: [categoryId],
        );
        if (data.isNotEmpty) {
          return Right(CategoryModel.fromJson(data.first));
        } else {
          return Left('No Category exist with these details.');
        }
      } else {
        return Left('Something went wrong! Please try again later!');
      }
    } catch (e) {
      debugPrint('Get Category Exception: $e');
      return Left('Something went wrong! Please try again later!');
    }
  }

  @override
  ResultOrException<String> editCategory(CategoryModel category) async {
    try {
      final db = await database;
      if (db != null) {
        final count = Sqflite.firstIntValue(
          await db.query(
            EDatabaseTableNames.categoryTable.name,
            where: 'id = ?',
            whereArgs: [category.id],
          ),
        );
        if (count != null && count != 0) {
          await db.update(
            EDatabaseTableNames.categoryTable.name,
            category.toJson(),
            where: 'id = ?',
            whereArgs: [category.id],
          );
          return Right('Changes saved Successfully');
        } else {
          await db.insert(
            EDatabaseTableNames.categoryTable.name,
            category.toJson(),
          );
          return Right(
            'No category exist with these details. So, New category added Successfully',
          );
        }
      } else {
        return Left('Something went wrong! Please try again later!');
      }
    } catch (e) {
      debugPrint('Edit Category Exception: $e');
      return Left('Something went wrong! Please try again later!');
    }
  }
}

final databaseHelperProvider = Provider<DatabaseHelper>(
  (_) => DatabaseHelperImpl(),
);
