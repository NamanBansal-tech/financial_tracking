class DatabaseTableQueries {
  static String createTransactionTable = '''
CREATE TABLE ${EDatabaseTableNames.transactionTable.name}(
id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
amount FLOAT,
categoryId INTEGER,
budgetId INTEGER,
date TEXT,
name TEXT,
type INTEGER
)
''';
  static String createCategoryTable = '''
CREATE TABLE ${EDatabaseTableNames.categoryTable.name}(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT,
  budgetId INTEGER
)
''';
  static String createBudgetTable = '''
CREATE TABLE ${EDatabaseTableNames.budgetTable.name}(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT,
  budgetAmount REAL,
  totalExpense REAL,
  startDate TEXT,
  endDate TEXT
)
''';
}

enum EDatabaseTableNames { transactionTable, categoryTable, budgetTable }
