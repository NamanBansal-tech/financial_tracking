import 'package:finance_tracking/models/category_model/category_model.dart';
import 'package:finance_tracking/screens/create_category/ui/create_category_body.dart';
import 'package:flutter/material.dart';

class CreateCategoryPage extends StatelessWidget {
  const CreateCategoryPage({
    super.key,
    required this.fromCreateTransactionsPage,
    this.categoryModel,
  });

  final bool fromCreateTransactionsPage;
  final CategoryModel? categoryModel;

  static Route<dynamic> route({
    required bool fromCreateTransactionsPage,
    CategoryModel? categoryModel,
  }) {
    return MaterialPageRoute(
      builder:
          (_) => CreateCategoryPage(
            fromCreateTransactionsPage: fromCreateTransactionsPage,
            categoryModel: categoryModel,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CreateCategoryBody(
      fromCreateTransactionsPage: fromCreateTransactionsPage,
      categoryModel: categoryModel,
    );
  }
}
