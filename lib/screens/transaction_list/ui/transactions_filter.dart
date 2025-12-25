import 'package:finance_tracking/components/custom_button.dart';
import 'package:finance_tracking/components/custom_drop_down_button.dart';
import 'package:finance_tracking/components/custom_text_form_field.dart';
import 'package:finance_tracking/models/transaction_model/transaction_model.dart';
import 'package:finance_tracking/providers/transaction/transaction_provider.dart';
import 'package:finance_tracking/providers/transaction/transaction_state.dart';
import 'package:finance_tracking/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionsFilter extends ConsumerWidget {
  const TransactionsFilter({super.key, required this.transactionRef});
  final TransactionProviderProvider transactionRef;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(transactionRef);
    final provider = ref.watch(transactionRef.notifier);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Filter Transactions',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            labelText: 'Notes',
            hintText: 'Enter something..',
            controller: provider.transactionNameController,
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            labelText: 'Date',
            hintText: 'dd/mm/yyyy',
            controller: provider.transactionDateController,
            onTap: () {
              final currentDate = DateTime.now();
              showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: currentDate,
                initialDate: currentDate,
                currentDate: currentDate,
                helpText: 'Select Transaction Date',
              ).then((value) {
                if (value != null) {
                  provider.selectTransactionDate(value);
                }
              });
            },
            readOnly: true,
            suffix: Icon(Icons.calendar_month_rounded),
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            labelText: 'Amount',
            hintText: 'Enter the amount',
            controller: provider.transactionAmountController,
            digitsOnly: true,
          ),
          SizedBox(height: 10),
          CustomDropDownButton(
            selectedValue: state.selectedTransactionType,
            items:
                TransactionType.values.map((e) {
                  return DropdownMenuItem(
                    onTap: () {
                      provider.selectTransactionType(e);
                    },
                    value: e,
                    child: Text(Utility.makeFirstLetterCapital(e.name)),
                  );
                }).toList(),
            labelText: 'Transaction Type',
            isMandatoryField: true,
            hintText: 'Select Transaction Type',
            suffix: IconButton(
              onPressed: () {
                provider.selectTransactionType(null);
              },
              icon: Icon(Icons.close_rounded, color: Colors.amber),
            ),
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
                    Navigator.pop(context,ESearchType.filter);
                  },
                  isExpanded: true,
                ),
              ),

              SizedBox(width: 20),
              Expanded(
                child: CustomButton(
                  label: 'Reset',
                  onTap: () {
                    Navigator.pop(context,ESearchType.reset);
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
