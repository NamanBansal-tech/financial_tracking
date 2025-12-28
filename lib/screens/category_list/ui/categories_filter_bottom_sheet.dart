import 'package:finance_tracking/components/custom_button.dart';
import 'package:finance_tracking/components/custom_text_form_field.dart';
import 'package:finance_tracking/providers/category/category_provider.dart';
import 'package:finance_tracking/providers/transaction/transaction_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesFilterBottomSheet extends ConsumerWidget {
  const CategoriesFilterBottomSheet({super.key, required this.categoryRef});

  final CategoryProviderProvider categoryRef;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(categoryRef.notifier);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Filter Categories',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'Category Name',
            controller: provider.nameController,
            labelText: 'Category Name',
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: CustomButton(
                  label: 'Search',
                  onTap: () {
                    Navigator.pop(context, ESearchType.filter);
                  },
                  isExpanded: true,
                ),
              ),

              SizedBox(width: 20),
              Expanded(
                child: CustomButton(
                  label: 'Reset',
                  onTap: () {
                    Navigator.pop(context, ESearchType.reset);
                  },
                  isExpanded: true,
                  isSecondary: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
