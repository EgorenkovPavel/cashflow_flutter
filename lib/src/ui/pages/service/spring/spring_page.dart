import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/src/domain/interfaces/data_repository.dart';
import 'package:money_tracker/src/domain/models.dart' as model;
import 'package:money_tracker/src/injection_container.dart';
import 'package:spring1/spring.dart';

class SpringPage extends StatelessWidget {
  const SpringPage({super.key});

  Future<void> _upload(String idToken) async {
    if (idToken.isEmpty) {
      return;
    }

    final connector = SpringConnector(idToken);
    await connector.connect();

    Map<model.BaseAccount, BaseAccount> addedAccounts = {};
    final accounts = await sl<DataRepository>().getAllAccounts();
    accounts.forEach((account) async {
      switch (account) {
        case model.Account():
          addedAccounts[account] =
              await connector.accounts.createAccount(account.title);
        case model.Debt():
          addedAccounts[account] =
              await connector.accounts.createDebt(account.title);
      }
    });

    Map<model.Category, Category> addedCategories = {};
    final categories = await sl<DataRepository>().getAllCategories();
    categories.forEach((category) async {
      switch (category) {
        case model.InputCategoryItem():
          addedCategories[category] = await connector.categories
              .createInputCategoryItem(
                  category.title, category.budget, category.parent?.id);
        case model.OutputCategoryItem():
          addedCategories[category] = await connector.categories
              .createOutputCategoryItem(
                  category.title, category.budget, category.parent?.id);
        case model.InputCategoryGroup():
          addedCategories[category] = await connector.categories
              .createInputCategoryGroup(category.title);
        case model.OutputCategoryGroup():
          addedCategories[category] = await connector.categories
              .createOutputCategoryGroup(category.title);
      }
    });

    final operations = await sl<DataRepository>().getAllOperations();
    operations.forEach((operation) async {
      switch (operation) {
        case model.InputOperation():
          await connector.operations.createInputOperation(
            operation.date,
            addedAccounts[operation.account] as Account,
            addedCategories[operation.category] as InputCategoryItem,
            operation.sum.sum,
            _mapCurrency(operation.sum.currency),
          );
        case model.OutputOperation():
          await connector.operations.createOutputOperation(
            operation.date,
            addedAccounts[operation.account] as Account,
            addedCategories[operation.category] as OutputCategoryItem,
            operation.sum.sum,
            _mapCurrency(operation.sum.currency),
          );
        case model.TransferOperation():
          await connector.operations.createTransferOperation(
            operation.date,
            addedAccounts[operation.account] as BaseAccount,
            addedAccounts[operation.recAccount] as BaseAccount,
            operation.sum.sum,
            operation.recSum.sum,
            _mapCurrency(operation.sum.currency),
            _mapCurrency(operation.recSum.currency),
          );
      }
    });
  }

  Currency _mapCurrency(model.Currency currency) => switch (currency) {
        model.Currency.RUB => Currency.RUB,
        model.Currency.USD => Currency.USD,
        model.Currency.EUR => Currency.EUR,
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spring'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                final user = context.read<AuthBloc>().state.user;
                if (user == null) {
                  return;
                }
                await _upload(context.read<AuthBloc>().state.idToken);
              },
              child: const Text('Upload')),
        ],
      ),
    );
  }
}
