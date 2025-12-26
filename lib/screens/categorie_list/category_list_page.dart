import 'package:finance_tracking/screens/categorie_list/ui/categories_list.dart';
import 'package:flutter/material.dart';

class CategoryListPage extends StatelessWidget {
  const CategoryListPage({
    super.key,
    required this.fromOtherPage,

  });

  final bool fromOtherPage;

  static Route<dynamic> route({
    required bool fromOtherPage,
  }) {
    return MaterialPageRoute(
      builder:
          (_) => CategoryListPage(
            fromOtherPage: fromOtherPage,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CategoriesList(
      fromOtherPage: fromOtherPage,
    );
  }
}
