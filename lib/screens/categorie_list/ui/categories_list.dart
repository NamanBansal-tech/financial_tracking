import 'package:finance_tracking/components/custom_app_bar.dart';
import 'package:finance_tracking/components/custom_bottom_sheet.dart';
import 'package:finance_tracking/components/custom_button.dart';
import 'package:finance_tracking/models/category_model/category_model.dart';
import 'package:finance_tracking/providers/category/category_provider.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:finance_tracking/providers/transaction/transaction_state.dart';
import 'package:finance_tracking/screens/categorie_list/ui/categories_filter_bottom_sheet.dart';
import 'package:finance_tracking/screens/categorie_list/ui/category_options_bottom_sheet.dart';
import 'package:finance_tracking/screens/home/ui/create_bottom_sheet.dart';
import 'package:finance_tracking/utils/listeners.dart';
import 'package:finance_tracking/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesList extends ConsumerWidget {
  const CategoriesList({super.key, required this.fromDashboard});

  final bool fromDashboard;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryRef = categoryProviderProvider(
      widgetRef: ref,
    );
    final state = ref.watch(categoryRef);
    final provider = ref.watch(categoryRef.notifier);
    ref.listen<CategoryState>(
      (categoryRef),
      (_, next) => Listeners.categoryListener(
        context: context,
        state: next,
        provider: provider,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.eCategoryState == ECategoryState.ready) {
        provider.getCategories();
      }
    });
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: "Categories",
        actions: [
          IconButton(
            onPressed: () {
              customBottomSheet(
                context: context,
                child: CategoriesFilterBottomSheet(categoryRef: categoryRef),
                isDismissible: false,
                enableDrag: false,
                onSuccess: (value) {
                  if (((value != null) && (value is ESearchType))) {
                    switch (value) {
                      case ESearchType.filter:
                        provider.getCategories();
                        break;
                      case ESearchType.reset:
                        provider.resetWidgets();
                        provider.getCategories();
                        break;
                    }
                  }
                },
              );
            },
            icon: Icon(
              Icons.filter_alt_rounded,
              size: MediaQuery.of(context).size.height * .03,
            ),
          ),
          if (!fromDashboard)
            IconButton(
              onPressed: () {
                showCreateBottomSheet(context);
              },
              icon: Icon(
                Icons.add,
                size: MediaQuery.of(context).size.height * .035,
              ),
            ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        children: [
          state.eCategoryState == ECategoryState.loading ||
                  state.eCategoryState == ECategoryState.ready
              ? SizedBox(
                height: MediaQuery.of(context).size.height / 1.5,
                child: Center(child: CircularProgressIndicator()),
              )
              : state.categories.isEmpty
              ? SizedBox(
                height: MediaQuery.of(context).size.height / 1.5,
                child: Center(child: Text('No transaction found.')),
              )
              : ListView.builder(
                shrinkWrap: true,
                itemCount: state.categories.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = state.categories[index];
                  return customCategoryTile(
                    parentContext: context,
                    categoryModel: item,
                    onSuccess: (val) {
                      if (((val != null) && (val is ECategoryOptions))) {
                        switch (val) {
                          case ECategoryOptions.edit:
                            provider.getCategories();
                          case ECategoryOptions.delete:
                            if ((item.id != null)) {
                              deleteCategoryDialogBox(
                                context: context,
                                refProvider: categoryRef,
                                categoryId: item.id!,
                              );
                            }
                            break;
                          case ECategoryOptions.select:
                            Navigator.pop(context, item);
                        }
                      }
                    },
                  );
                },
              ),
        ],
      ),
    );
  }

  Widget customCategoryTile({
    required BuildContext parentContext,
    required CategoryModel categoryModel,
    required dynamic Function(dynamic)? onSuccess,
  }) {
    return ListTile(
      title: Text(
        categoryModel.categoryName ?? 'N/A',
        style: TextStyle(fontSize: 17),
      ),
      onTap: () {
        customBottomSheet(
          context: parentContext,
          topPadding: 0,
          onSuccess: onSuccess,
          child: CategoryOptionsBottomSheet(
            fromDashboard: fromDashboard,
            categoryModel: categoryModel,
          ),
        );
      },
      subtitle: Text(
        categoryModel.budgetSetDate != null &&
                categoryModel.duration != null &&
                categoryModel.budgetPeriod != null
            ? 'This budget is set on: ${Utility.formatDate(DateTime.parse(categoryModel.budgetSetDate!))} for ${categoryModel.duration} ${Utility.getDisplayNameforBudgetPeriod(categoryModel.budgetPeriod!)}'
            : '',
        style: TextStyle(fontSize: 15),
      ),
      trailing: Text(
        '${categoryModel.budgetAmount ?? ''}',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  void deleteCategoryDialogBox({
    required BuildContext context,
    required CategoryProviderProvider refProvider,
    required int categoryId,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          child: Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(refProvider);
              final provider = ref.watch(refProvider.notifier);
              return AlertDialog(
                backgroundColor: Colors.white,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomButton(
                        onTap: () {
                          provider.deleteCategory(categoryId);
                        },
                        label: "Delete",
                        isLoading:
                            state.eCategoryState == ECategoryState.loading,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: CustomButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        label: "Cancel",
                        isDisabled:
                            state.eCategoryState == ECategoryState.loading,
                        isSecondary: true,
                      ),
                    ),
                  ],
                ),
                scrollable: true,
                title: Text(
                  "Are you sure you want to delete this category?",
                  style: TextStyle(fontSize: 18),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
