import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/src/domain/models.dart' as model;
import 'package:money_tracker/src/injection_container.dart';
import 'package:spring1/spring.dart';

class SpringPage extends StatelessWidget {
  const SpringPage({super.key});

  Future<void> _upload(String idToken) async {
    final connector = SpringConnector(idToken);
    await connector.connect();

    Map<model.Account, BaseAccount> addedAccounts = {};
    final accounts = await sl<DataRepository>().accounts.getAll();
    accounts.forEach((account) async {
      if (account.isDebt) {
        addedAccounts[account] =
            await connector.accounts.createDebt(account.title);
      } else {
        addedAccounts[account] =
            await connector.accounts.createAccount(account.title);
      }
    });

    Map<model.Category, Category> addedCategories = {};
    final categories = await sl<DataRepository>().categories.getAll();
    categories.forEach((category) async {
      if (category.operationType == model.OperationType.INPUT) {
        addedCategories[category] = await connector.categories
            .createInputCategoryItem(category.title, category.budget, null);
      } else {
        addedCategories[category] = await connector.categories
            .createOutputCategoryItem(category.title, category.budget, null);
      }
    });

    final operations = await sl<DataRepository>().operations.getAll();
    operations.forEach((operation) async {
      operation.map(input: (operation) async {
        await connector.operations.createInputOperation(
          operation.date,
          addedAccounts[operation.account] as Account,
          addedCategories[operation.category] as InputCategoryItem,
          operation.sum,
          Currency.RUB,
        );
      }, output: (operation) async {
        await connector.operations.createOutputOperation(
          operation.date,
          addedAccounts[operation.account] as Account,
          addedCategories[operation.category] as OutputCategoryItem,
          operation.sum,
          Currency.RUB,
        );
      }, transfer: (operation) async {
        await connector.operations.createTransferOperation(
          operation.date,
          addedAccounts[operation.account] as BaseAccount,
          addedAccounts[operation.recAccount] as BaseAccount,
          operation.sum,
          operation.sum,
          Currency.RUB,
          Currency.RUB,
        );
      });
    });
  }

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
                await _upload(user.idToken);
              },
              child: const Text('Upload')),
        ],
      ),
    );
  }
}
