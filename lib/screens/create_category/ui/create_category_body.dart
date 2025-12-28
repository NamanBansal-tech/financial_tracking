import 'package:finance_tracking/components/custom_app_bar.dart';
import 'package:finance_tracking/components/custom_button.dart';
import 'package:finance_tracking/components/custom_text_form_field.dart';
import 'package:finance_tracking/models/category_model/category_model.dart';
import 'package:finance_tracking/providers/category/category_provider.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:finance_tracking/utils/listeners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateCategoryBody extends ConsumerWidget {
  const CreateCategoryBody({
    super.key,
    required this.fromOtherPage,
    this.categoryModel,
  });

  final bool fromOtherPage;
  final CategoryModel? categoryModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryProvider = categoryProviderProvider(
      widgetRef: ref,
      category: categoryModel,
    );
    final state = ref.watch(categoryProvider);
    final provider = ref.read(categoryProvider.notifier);
    ref.listen<CategoryState>(
      (categoryProvider),
      (_, next) => Listeners.categoryListener(
        context: context,
        state: next,
        provider: provider,
        fromOtherPage: fromOtherPage,
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if ((state.eState == EState.ready) &&
          (categoryModel != null)) {
        provider.updateValuesForEditCategory();
      }
    });
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(title: "Add Category"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Form(
          key: provider.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: 'Category Name',
                  isMandatoryField: true,
                  enabled: state.eState != EState.loading,
                  controller: provider.nameController,
                  labelText: 'Category Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your category name.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                CustomButton(
                  onTap: () {
                    if (state.category != null) {
                      provider.editCategory();
                    } else {
                      provider.createCategory();
                    }
                  },
                  label: 'Submit',
                  isExpanded: true,
                  isLoading: state.eState == EState.loading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
