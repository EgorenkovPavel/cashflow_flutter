import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/pages/operation/input_page/operation_input_bloc.dart';
import 'package:money_tracker/src/ui/pages/operation/input_page/widgets/account_card.dart';
import 'package:money_tracker/src/ui/pages/operation/input_page/widgets/category_card.dart';
import 'package:money_tracker/src/ui/pages/operation/input_page/widgets/operation_type_toggle.dart';
import 'package:money_tracker/src/ui/pages/operation/input_page/widgets/sum_field.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../../domain/view_models.dart';
import '../../../../utils/logger.dart';

class OperationInputPage extends StatelessWidget {
  const OperationInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MasterBloc>(
      create: (context) => sl<MasterBloc>(),
      child: BlocListener<MasterBloc, MasterState>(
        listenWhen: (prev, cur) => prev.action != cur.action,
        listener: (context, state) {
          if (state.action == null) return;

          ScaffoldMessenger.of(context).clearSnackBars();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(switch (state.action!) {
                MasterStateAction.SHOW_EMPTY_ACCOUNT_MESSAGE =>
                  context.loc.emptyAccountError,
                MasterStateAction.SHOW_EMPTY_CATEGORY_MESSAGE =>
                  context.loc.emptyCategoryError,
                MasterStateAction.SHOW_EMPTY_REC_ACCOUNT_MESSAGE =>
                  context.loc.emptyRecAccountError,
                MasterStateAction.SHOW_EMPTY_SUM_MESSAGE =>
                  context.loc.emptySumError,
                MasterStateAction.SHOW_EMPTY_REC_SUM_MESSAGE =>
                  context.loc.emptyRecSumError,
                MasterStateAction.SHOW_OPERATION_CREATED_MESSAGE =>
                  context.loc.mesOperationCreated,
                MasterStateAction.SHOW_OPERATION_CANCELED_MESSAGE =>
                  context.loc.mesOperationCanceled,
              }),
              persist: false,
              action: switch (state.action) {
                MasterStateAction.SHOW_OPERATION_CREATED_MESSAGE =>
                  SnackBarAction(
                    label: context.loc.cancel,
                    onPressed: () => context.onCancelOperation(),
                  ),
                _ => null,
              },
            ),
          );

        },
        child: Builder(
          builder: (context) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(title: Text(context.loc.titleMaster)),
              body: SafeArea(
                child: Padding(
                  padding: const .all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(context.loc.titleType),
                          Text(context.loc.operationTypeTitle(context.type())),
                        ],
                      ),
                      OperationTypeToggle(
                        type: context.type(),
                        onChange: context.onChangeOperationType,
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: context
                            .watch<MasterBloc>()
                            .state
                            .map(
                              input: (_) => [
                                context.loc.account,
                                context.loc.category,
                              ],
                              output: (_) => [
                                context.loc.account,
                                context.loc.category,
                              ],
                              transfer: (_) => [
                                context.loc.source,
                                context.loc.receiver,
                              ],
                              exchange: (_) => [context.loc.account],
                            )
                            .map((e) => Text(e))
                            .toList(),
                      ),
                      Row(
                        children: [
                          AccountCard(
                            accountId: context.accountId(),
                            balanceCurrency: context.sum().currency,
                            onChangeAccount: context.onChangeAccount,
                          ),
                          SizedBox(width: 16),
                          context.watch<MasterBloc>().state.map(
                            input: (s) => CategoryCard(
                              categoryId: s.categoryId,
                              categoryType: .INPUT,
                              onChangeCategory: context.onChangeCategory,
                            ),
                            output: (s) => CategoryCard(
                              categoryId: s.categoryId,
                              categoryType: .OUTPUT,
                              onChangeCategory: context.onChangeCategory,
                            ),
                            transfer: (s) => AccountCard(
                              accountId: s.recAccountId,
                              balanceCurrency: context.sum().currency,
                              onChangeAccount: context.onChangeRecAccount,
                            ),
                            exchange: (s) => Expanded(
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Container(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 16),
                              SumField(
                                initialSum: context.sum(),
                                onChange: context.onChangeSum,
                              ),
                              SizedBox(height: 16),
                              if (context.type() == OperationType.EXCHANGE)
                                SumField(
                                  initialSum: context.recSum(),
                                  onChange: context.onChangeRecSum,
                                ),
                              if (context.type() == OperationType.EXCHANGE)
                                SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      context.onNextTap();
                    },
                    child: Text(context.loc.btnSaveAndContinue),
                  )
                ),
              ),
              // bottomNavigationBar: Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       FocusScope.of(context).unfocus();
              //       context.onNextTap();
              //     },
              //     child: Text(context.loc.btnSaveAndContinue),
              //   ),
              // ),
            );
          },
        ),
      ),
    );
  }
}
