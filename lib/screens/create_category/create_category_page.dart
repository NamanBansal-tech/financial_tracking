import 'package:finance_tracking/models/category_model/category_model.dart';
import 'package:finance_tracking/screens/create_category/ui/create_category_body.dart';
import 'package:flutter/material.dart';

class CreateCategoryPage extends StatelessWidget {
  const CreateCategoryPage({
    super.key,
    required this.fromOtherPage,
    this.categoryModel,
  });

  final bool fromOtherPage;
  final CategoryModel? categoryModel;

  static Route<dynamic> route({
    required bool fromOtherPage,
    CategoryModel? categoryModel,
  }) {
    return MaterialPageRoute(
      builder: (_) => CreateCategoryPage(
        fromOtherPage: fromOtherPage,
        categoryModel: categoryModel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CreateCategoryBody(
      fromOtherPage: fromOtherPage,
      categoryModel: categoryModel,
    );
  }
}
