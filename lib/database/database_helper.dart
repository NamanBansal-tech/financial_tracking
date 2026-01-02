import 'package:finance_tracking/models/budget_model/budget_model.dart';
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
  ResultOrException<String> addBudget(BudgetModel budget);
  ResultOrException<String> editCategory(CategoryModel category);
  ResultOrException<String> editBudget(BudgetModel budget);
  ResultOrException<String> deleteCategory(int categoryId);
  ResultOrException<String> deleteBudget(int budgetId);
  ResultOrException<List<TransactionModel>> getTransactions({
    String? fromDate,
    String? toDate,
    String? transactionDate,
    String? transactionName,
    String? amount,
    int? transactionType,
    PageMeta? pageMeta,
    int? budgetId,
  });
  ResultOrException<List<CategoryModel>> getCategories({String? name, List<int?>? ids});
  ResultOrException<List<BudgetModel>> getBudgetList({
    String? name,
    double? budgetAmount,
    String? startDate,
    String? endDate,
  });
  ResultOrException<CategoryModel> getCategory(int categoryId);
  ResultOrException<BudgetModel> getBudget(int budgetId);
}
