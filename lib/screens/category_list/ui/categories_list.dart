import 'package:finance_tracking/components/common_delete_dialog_box.dart';
import 'package:finance_tracking/components/common_options_bottom_sheet.dart';
import 'package:finance_tracking/components/custom_app_bar.dart';
import 'package:finance_tracking/components/custom_bottom_sheet.dart';
import 'package:finance_tracking/models/category_model/category_model.dart';
import 'package:finance_tracking/providers/category/category_provider.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:finance_tracking/providers/transaction/transaction_state.dart';
import 'package:finance_tracking/screens/category_list/ui/categories_filter_bottom_sheet.dart';
import 'package:finance_tracking/screens/create_category/create_category_page.dart';
import 'package:finance_tracking/screens/transaction_list/transactions_list_page.dart';
import 'package:finance_tracking/utils/extensions.dart';
import 'package:finance_tracking/utils/listeners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesList extends ConsumerWidget {
  const CategoriesList({super.key, required this.fromOtherPage});

  final bool fromOtherPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryRef = categoryProviderProvider(widgetRef: ref);
    final state = ref.watch(categoryRef);
    final provider = ref.read(categoryRef.notifier);
    ref.listen<CategoryState>(
      (categoryRef),
      (_, next) => Listeners.categoryListener(
        context: context,
        state: next,
        provider: provider,
        fromOtherPage: fromOtherPage,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.eState == EState.ready) {
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
              size: context.height * .03,
            ),
          ),
          if (!(fromOtherPage))
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CreateCategoryPage.route(fromOtherPage: false),
                );
              },
              icon: Icon(
                Icons.add,
                size: context.height * .035,
              ),
            ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 12.w),
        children: [
          state.eState == EState.loading || state.eState == EState.ready
              ? SizedBox(
                  height: context.height / 1.5,
                  child: Center(child: CircularProgressIndicator()),
                )
              : state.categories.isEmpty
              ? SizedBox(
                  height: context.height / 1.5,
                  child: Center(child: Text('No categories found.')),
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
                      isDeleting: state.eState == EState.loading,
                      onSuccess: (val) {
                        if (((val != null) && (val is EMoreOptions))) {
                          switch (val) {
                            case EMoreOptions.edit:
                              {
                                provider.getCategories();
                                break;
                              }
                            case EMoreOptions.delete:
                              {
                                if ((item.id != null)) {
                                  deleteDialogBox(
                                    context: context,
                                    title:
                                        "Are you sure want to delete the budget '${item.name ?? ""}'?",
                                  ).then((value) {
                                    if ((value == true)) {
                                      provider.deleteCategory(item.id!);
                                    }
                                  });
                                }
                                break;
                              }
                            case EMoreOptions.select:
                              {
                                Navigator.pop(context, item);
                                break;
                              }
                            case EMoreOptions.viewTransactions:
                              {
                                Navigator.push(
                                  context,
                                  TransactionsListPage.route(
                                    categoryId: item.id,
                                  ),
                                );
                                break;
                              }
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
    required bool isDeleting,
  }) {
    return ListTile(
      title: Text(categoryModel.name ?? 'N/A', style: TextStyle(fontSize: 17.sp)),
      onTap: () {
        customBottomSheet(
          context: parentContext,
          topPadding: 0,
          onSuccess: onSuccess,
          child: CommonOptionsBottomSheet(
            fromOtherPage: fromOtherPage,
            onEdit: () {
              Navigator.push(
                parentContext,
                CreateCategoryPage.route(
                  fromOtherPage: true,
                  categoryModel: categoryModel,
                ),
              ).then((_) {
                if (parentContext.mounted) {
                  Navigator.pop(parentContext, EMoreOptions.edit);
                }
              });
            },
          ),
        );
      },
      trailing: isDeleting
          ? const CircularProgressIndicator()
          : null,
    );
  }
}
