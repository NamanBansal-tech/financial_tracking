import 'package:finance_tracking/models/category_model/category_model.dart';
import 'package:finance_tracking/models/page_meta/page_meta.dart';
import 'package:finance_tracking/models/transaction_model/transaction_model.dart';
import 'package:finance_tracking/utils/type_def.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

abstract class DatabaseHelper {
  Future<Database?> initAppDatabase();
  ResultOrException<String> addTransaction(TransactionModel transaction);
  ResultOrException<String> editTransaction(TransactionModel transaction);
  ResultOrException<String> deleteTransaction(int transactionId);
  ResultOrException<String> addCategory(CategoryModel category);
  ResultOrException<String> editCategory(CategoryModel category);
  ResultOrException<String> deleteCategory(int categoryId);
  ResultOrException<List<TransactionModel>> getTransactions({
    String? fromDate,
    String? toDate,
    String? transactionDate,
    String? transactionName,
    String? amount,
    int? categoryId,
    int? transactionType,
    PageMeta? pageMeta,
  });
  ResultOrException<List<CategoryModel>> getCategories({
    String? categoryName,
    double? budgetAmount,
    String? startDate,
    String? endDate,
  });
  ResultOrException<CategoryModel> getCategory(int categoryId);
}
