import 'package:finance_tracking/models/category_model/category_model.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:finance_tracking/screens/create_category/create_category_page.dart';
import 'package:flutter/material.dart';

class CategoryOptionsBottomSheet extends StatelessWidget {
  const CategoryOptionsBottomSheet({
    super.key,
    required this.fromOtherPage,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;
  final bool fromOtherPage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (fromOtherPage)
            ListTile(
              leading: Icon(Icons.check),
              title: Text("Select"),
              onTap: () {
                Navigator.pop(context,ECategoryOptions.select);
              },
            ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Edit"),
            onTap: () {
              Navigator.push(
                context,
                CreateCategoryPage.route(
                  fromOtherPage: true,
                  categoryModel: categoryModel,
                ),
              ).then((_) {
                if (context.mounted) {
                Navigator.pop(context,ECategoryOptions.edit);
                }
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text("Delete"),
            onTap: () {
                Navigator.pop(context,ECategoryOptions.delete);
            },
          ),
        ],
      ),
    );
  }
}
