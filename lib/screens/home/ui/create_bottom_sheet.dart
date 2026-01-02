import 'package:finance_tracking/components/custom_bottom_sheet.dart';
import 'package:finance_tracking/screens/create_budget/create_budget_page.dart';
import 'package:finance_tracking/screens/create_category/create_category_page.dart';
import 'package:finance_tracking/screens/create_transaction/create_transaction_page.dart';
import 'package:flutter/material.dart';

void showCreateBottomSheet(BuildContext context) {
  customBottomSheet(
    context: context,
    isScrollControlled: true,
    topPadding: 0,
    child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Image.asset(
              'assets/images/transaction.png',
              height: MediaQuery.of(context).size.height / 10,
            ),
            title: Text(
              'Add New Transaction',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Add your transactions with ease and keep your finances organized.',
            ),
            onTap: () {
              Navigator.push(context, CreateTransactionPage.route());
            },
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Image.asset(
              'assets/images/budget_category.png',
              height: MediaQuery.of(context).size.height / 10,
            ),
            title: Text(
              'Add New Category',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Add new categories to streamline your financial planning and stay organized.',
            ),
            onTap: () {
              Navigator.push(
                context,
                CreateCategoryPage.route(fromOtherPage: false),
              );
            },
          ),
            SizedBox(height: 20),
          ListTile(
            leading: Image.asset(
              'assets/images/budget.png',
              height: MediaQuery.of(context).size.height / 10,
            ),
            title: Text(
              'Add New Budget',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Create budgets to plan expenses and track your finances better.',
            ),
            onTap: () {
              Navigator.push(
                context,
                CreateBudgetPage.route(fromOtherPage: false),
              );
            },
          ),
        ],
      ),
    ),
  );
}
