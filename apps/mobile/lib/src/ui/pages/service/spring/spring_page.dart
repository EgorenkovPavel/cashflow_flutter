import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/src/domain/models.dart' as model;
import 'package:money_tracker/src/injection_container.dart';
// import 'package:spring1/finance_api_client.dart';

import '../../../../domain/interfaces/account_repository.dart';
import '../../../../domain/interfaces/category_repository.dart';
import '../../../../domain/interfaces/operation_repository.dart';
import '../../../../domain/models.dart';

class SpringPage extends StatelessWidget {
  const SpringPage({super.key});

  Future<void> _upload(String idToken) async {
    if (idToken.isEmpty) {
      return;
    }

    final connector = SpringConnector(idToken);
    await connector.connect();


    Map<int, BaseAccount> addedAccounts = {};
    final accounts = await sl<AccountRepository>().getAllAccounts();
    for (final account in accounts) {
      switch (account) {
        case model.Account():
          addedAccounts[account.id] =
              await connector.accounts.createAccount(account.title);
        case model.Debt():
          addedAccounts[account.id] =
              await connector.accounts.createDebt(account.title);
      }
    }
    return;

    Map<int, Category> addedCategories = {};
    final categories = await sl<CategoryRepository>().getAllCategories();
    for (final category in categories.whereType<model.CategoryGroup>()) {
      switch (category.type) {
        case model.CategoryType.INPUT:
          addedCategories[category.id] = await connector.categories
              .createInputCategoryGroup(category.title);
        case model.CategoryType.OUTPUT:
          addedCategories[category.id] = await connector.categories
              .createOutputCategoryGroup(category.title);
      }
    }

    for (final category in categories.whereType<model.CategoryItem>()) {
      switch (category.type) {
        case model.CategoryType.INPUT:
          addedCategories[category.id] =
              await connector.categories.createInputCategoryItem(
            category.title,
            category.budget,
            category.parentId == null
                ? null
                : addedCategories[category.parentId]!.id,
          );
        case model.CategoryType.OUTPUT:
          addedCategories[category.id] =
              await connector.categories.createOutputCategoryItem(
            category.title,
            category.budget,
            category.parentId == null
                ? null
                : addedCategories[category.parentId]!.id,
          );
      }
    }

    final operations = await sl<OperationRepository>().getAllOperations();
    for (final operation in operations) {
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
            _mapCurrency(operation.sum.currency),
          );
        case model.ExchangeOperation():
          await connector.operations.createExchangeOperation(
            operation.date,
            addedAccounts[operation.account] as BaseAccount,
            operation.sum.sum,
            _mapCurrency(operation.sum.currency),
            operation.recSum.sum,
            _mapCurrency(operation.recSum.currency),
          );
      }
    }
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
