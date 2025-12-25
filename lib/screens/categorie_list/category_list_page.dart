import 'package:finance_tracking/screens/categorie_list/ui/categories_list.dart';
import 'package:flutter/material.dart';

class CategoryListPage extends StatelessWidget {
  const CategoryListPage({
    super.key,
    required this.fromDashboard,

  });

  final bool fromDashboard;

  static Route<dynamic> route({
    required bool fromDashboard,
  }) {
    return MaterialPageRoute(
      builder:
          (_) => CategoryListPage(
            fromDashboard: fromDashboard,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CategoriesList(
      fromDashboard: fromDashboard,
    );
  }
}
