class DatabaseTableQueries {
  static String createTransactionTable = '''
CREATE TABLE ${EDatabaseTableNames.transactionTable.name}(
id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
amount FLOAT,
categoryId INTEGER,
date TEXT,
notes TEXT,
type INTEGER
)
''';
static String createCategoryTable = '''
CREATE TABLE ${EDatabaseTableNames.categoryTable.name}(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  categoryName TEXT,
  budgetAmount REAL,
  totalExpense REAL,
  startDate TEXT,
  endDate TEXT
)
''';
}


enum EDatabaseTableNames {
  transactionTable,
  categoryTable,
}
