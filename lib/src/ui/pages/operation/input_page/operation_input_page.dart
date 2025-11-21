import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/blocs/account_balance_bloc.dart';
import 'package:money_tracker/src/ui/pages/operation/input_page/operation_input_bloc.dart';
import 'package:money_tracker/src/ui/pages/operation/input_page/widgets/category_group.dart';
import 'package:money_tracker/src/ui/widgets/type_radio_button.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../../domain/view_models.dart';
import '../../../../utils/sum.dart';
import '../../../blocs/category_cashflow_bloc.dart';
import '../../../widgets/currency_menu.dart';
import '../../../widgets/dropdown_list.dart';
import '../../../widgets/keyboard.dart';
import 'widgets/account_item.dart';
import 'widgets/carousel_list.dart';
import 'widgets/category_item.dart';
import 'widgets/sum_field.dart';

class OperationInputPage extends StatefulWidget {
  const OperationInputPage({super.key});

  @override
  State<OperationInputPage> createState() => _OperationInputPageState();
}

class _OperationInputPageState extends State<OperationInputPage> {
  OperationType _type = .INPUT;
  int? _accountId;
  int? _categoryInId;

  void setType(OperationType type) {
    setState(() {
      _type = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MasterBloc>(
      create: (context) => sl<MasterBloc>(),
      child: Builder(
        builder: (context) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(title: Text(context.loc.titleMaster)),
              body: Padding(
                padding: const .all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(context.loc.titleType),
                        Text(context.loc.operationTypeTitle(_type)),
                      ],
                    ),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return ToggleButtons(
                          constraints: BoxConstraints.expand(
                            width:
                                constraints.maxWidth / 4 -
                                4, // делим на количество кнопок
                          ),
                          isSelected: OperationType.values
                              .map((e) => e == _type)
                              .toList(),
                          borderRadius: const .all(.circular(14.0)),
                          borderColor: Theme.of(context).colorScheme.primary,
                          selectedColor: Colors.white,
                          fillColor: Theme.of(context).colorScheme.primary,
                          onPressed: (index) =>
                              setType(OperationType.values[index]),
                          children: OperationType.values
                              .map((e) => Icon(e.icon))
                              .toList(),
                        );
                      },
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [Text('Account'), Text('Category')],
                    ),
                    Row(
                      children: [
                        AccountCard(
                          accountId: _accountId,
                          onChangeAccount: (accountId) {
                            setState(() {
                              _accountId = accountId;
                            });
                          },
                        ),
                        SizedBox(width: 16),
                        CategoryCard(
                          categoryId: _categoryInId,
                          categoryType: .INPUT,
                          onChangeCategory: (id) {
                            setState(() {
                              _categoryInId = id;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    SumField(
                      onChange: (sum) {
                        print(sum);
                      },
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus(); //TODO add awhereware
                      },
                      child: Text('Save and continue'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SumField extends StatefulWidget {
  final void Function(Sum) onChange;
  final Sum? initialSum;

  const SumField({super.key, required this.onChange, this.initialSum});

  @override
  State<SumField> createState() => _SumFieldState();
}

class _SumFieldState extends State<SumField> {
  final TextEditingController _controller = TextEditingController();
  Currency _currency = Currency.RUB;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.initialSum != null) {
      _controller.text = widget.initialSum!.sum.toString();
      _currency = widget.initialSum!.currency;
    } else {
      _currency = Currency.RUB;
    }

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _notifyChange();
      }
    });
  }

  void _notifyChange() {
    widget.onChange(Sum(int.tryParse(_controller.text) ?? 0, _currency));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              autofocus: false,
              textAlign: .center,
              decoration: InputDecoration(border: InputBorder.none),
              onSubmitted: (text) => _notifyChange(),
            ),
          ),
          SizedBox(width: 16),
          CurrencyMenu(
            currency: _currency,
            onChange: (cur) {
              setState(() {
                _currency = cur;
              });
              _notifyChange();
            },
          ),
        ],
      ),
    );
  }
}

class AccountCard extends StatelessWidget {
  final int? accountId;
  final void Function(int) onChangeAccount;

  const AccountCard({
    super.key,
    required this.accountId,
    required this.onChangeAccount,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return ListView(
                  children: context
                      .watchAllBalances()
                      .map(
                        (e) => InkWell(
                          onTap: () {
                            onChangeAccount(e.accountId);
                            context.pop();
                          },
                          child: ListTile(title: Text(e.accountTitle)),
                        ),
                      )
                      .toList(),
                );
              },
            );
          },
          child: Card(
            child: Center(
              child: Text(
                accountId == null
                    ? 'Choose account'
                    : AccountBalanceBlocExt(context).getTitleById(accountId!),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final int? categoryId;
  final CategoryType categoryType;
  final void Function(int) onChangeCategory;

  const CategoryCard({
    super.key,
    required this.categoryId,
    required this.onChangeCategory,
    required this.categoryType,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => CategoryDialog(
                type: categoryType,
                onChangeCategory: onChangeCategory,
              ),
            );
          },
          child: Card(
            child: Center(
              child: Text(
                categoryId == null
                    ? 'Choose category'
                    : CategoryCashFlowBlocExt(
                        context,
                      ).getTitleById(categoryId!),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryDialog extends StatefulWidget {
  final CategoryType type;
  final void Function(int) onChangeCategory;

  const CategoryDialog({
    super.key,
    required this.type,
    required this.onChangeCategory,
  });

  @override
  State<CategoryDialog> createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {
  int? _parentId;

  @override
  Widget build(BuildContext context) {
    final noParentsItemsCount = context.watchItemsAmountNoParent(widget.type);

    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: .horizontal,
          child: Row(
            children: [
              ...context
                  .watchCategoryGroups(widget.type)
                  .map(
                    (e) => InkWell(
                      onTap: () {
                        setState(() {
                          _parentId = e.id;
                        });
                      },
                      child: CircleAvatar(child: Text(e.title)),
                    ),
                  ),
              if (noParentsItemsCount > 0)
                InkWell(
                  onTap: () {
                    setState(() {
                      _parentId = null;
                    });
                  },
                  child: CircleAvatar(child: Text('...')),
                ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: context
                .watchCategoryItems(widget.type, _parentId)
                .map(
                  (e) => InkWell(
                    onTap: () {
                      widget.onChangeCategory(e.id);
                      context.pop();
                    },
                    child: ListTile(title: Text(e.title)),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

// class OperationInputPage extends StatefulWidget {
//   const OperationInputPage({super.key});
//
//   @override
//   _OperationInputPageState createState() => _OperationInputPageState();
// }
//
// class _OperationInputPageState extends State<OperationInputPage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 400),
//     )..addListener(() => setState(() {}));
//     _animation = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     );
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   void _stateListener(BuildContext context, MasterState state) {
//     switch (state.action) {
//       case MasterStateAction.CLOSE:
//         {
//           Navigator.of(context).pop();
//         }
//       case MasterStateAction.SHOW_KEYBOARD:
//         {
//           _animationController.forward();
//         }
//       case MasterStateAction.HIDE_KEYBOARD:
//         {
//           _animationController.reverse();
//         }
//       case MasterStateAction.SHOW_EMPTY_ACCOUNT_MESSAGE:
//         {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(context.loc.emptyAccountError)),
//           );
//         }
//       case MasterStateAction.SHOW_EMPTY_CATEGORY_MESSAGE:
//         {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(context.loc.emptyCategoryError)),
//           );
//         }
//       case MasterStateAction.SHOW_EMPTY_REC_ACCOUNT_MESSAGE:
//         {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(context.loc.emptyRecAccountError)),
//           );
//         }
//       case MasterStateAction.SHOW_EMPTY_SUM_MESSAGE:
//         {
//           ScaffoldMessenger.of(
//             context,
//           ).showSnackBar(SnackBar(content: Text(context.loc.emptySumError)));
//         }
//       case MasterStateAction.SHOW_OPERATION_CREATED_MESSAGE:
//         {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(context.loc.mesOperationCreated),
//               action: SnackBarAction(
//                 label: context.loc.cancel,
//                 onPressed: () => context.onCancelOperation(),
//               ),
//             ),
//           );
//         }
//       case MasterStateAction.SHOW_OPERATION_CANCELED_MESSAGE:
//         {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(context.loc.mesOperationCanceled)),
//           );
//         }
//       case MasterStateAction.DATA:
//       case MasterStateAction.SET_ACCOUNT:
//       case MasterStateAction.SET_IN_CATEGORY:
//       case MasterStateAction.SET_OUT_CATEGORY:
//       case MasterStateAction.SET_REC_ACCOUNT:
//     }
//   }
//
//   Future<bool> _onBackPressed(BuildContext context) {
//     context.read<MasterBloc>().add(const MasterEvent.backPressed());
//
//     return Future.value(false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<MasterBloc>(
//       create: (context) => sl<MasterBloc>(),
//       child: Builder(
//         builder: (context) {
//           return BlocListener<MasterBloc, MasterState>(
//             listener: (context, state) => _stateListener(context, state),
//             child: WillPopScope(
//               onWillPop: () => _onBackPressed(context),
//               child: Scaffold(
//                 appBar: AppBar(
//                   title: Text(context.loc.titleMaster),
//                   forceMaterialTransparency: true,
//                 ),
//                 body: SafeArea(
//                   child: Column(
//                     children: <Widget>[
//                       _Title(
//                         context.operationType() != OperationType.TRANSFER
//                             ? context.loc.account
//                             : context.loc.source,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                         child: DropdownList<AccountBalanceView>(
//                           value: context
//                               .watchAllBalances()
//                               .where((e) => e.accountId == context.accountId())
//                               .firstOrNull,
//                           hint: context.loc.hintAccount,
//                           items: context.watchAllBalances(),
//                           onChange: (a) =>
//                               context.onChangeAccount(a!.accountId),
//                           getListItem: (data) => AccountItem(account: data),
//                         ),
//                       ),
//                       _Title(context.loc.titleType),
//                       Builder(
//                         builder: (context) {
//                           return TypeRadioButton<OperationType>(
//                             type: context.operationType(),
//                             items: OperationType.values,
//                             onChange: context.onChangeOperationType,
//                           );
//                         },
//                       ),
//                       context.operationType().map(
//                         input: () => const _CategoryList(CategoryType.INPUT),
//                         output: () => const _CategoryList(CategoryType.OUTPUT),
//                         transfer: () => const AccountRecList(),
//                         exchange: () => SizedBox(), // TODO
//                       ),
//                       Builder(
//                         builder: (BuildContext context) {
//                           return ClipRRect(
//                             borderRadius: BorderRadius.circular(5.0),
//                             child: Container(
//                               margin: const EdgeInsets.only(top: 6.0),
//                               //Same as `blurRadius` i guess
//                               decoration: BoxDecoration(
//                                 borderRadius: const BorderRadius.vertical(
//                                   top: Radius.circular(16.0),
//                                 ),
//                                 color: Theme.of(
//                                   context,
//                                 ).dialogBackgroundColor, //Colors.white,
//                                 boxShadow: const [
//                                   BoxShadow(
//                                     color: Colors.grey,
//                                     offset: Offset(0.0, 1.0), //(x,y)
//                                     blurRadius: 6.0,
//                                   ),
//                                 ],
//                               ),
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: <Widget>[
//                                   BarButton(
//                                     onPressed: context.onMoreTap,
//                                     title: context.loc.more,
//                                   ),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: <Widget>[
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                             vertical: 8.0,
//                                           ),
//                                           child: Row(
//                                             children: [
//                                               Flexible(
//                                                 flex: 1,
//                                                 child: SumField(
//                                                   highlight: context
//                                                       .highlightSum(),
//                                                   sum: context.sum(),
//                                                   onTap: context.onSumTap,
//                                                 ),
//                                               ),
//                                               if (context.showRecSum())
//                                                 const SizedBox(width: 8),
//                                               if (context.showRecSum())
//                                                 Flexible(
//                                                   flex: 1,
//                                                   child: SumField(
//                                                     highlight: context
//                                                         .highlightRecSum(),
//                                                     sum: context.recSum(),
//                                                     onTap: context.onRecSumTap,
//                                                   ),
//                                                 ),
//                                             ],
//                                           ),
//                                         ),
//                                         SizeTransition(
//                                           axis: Axis.vertical,
//                                           sizeFactor: _animation,
//                                           child: Keyboard(
//                                             onChangeCurrency: context
//                                                 .onChangeHighlightCurrency,
//                                             currency: context
//                                                 .highlightCurrency(),
//                                             onDigitPressed:
//                                                 context.onDigitKeyTap,
//                                             onBackPressed: context.onBackKeyTap,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   BarButton(
//                                     onPressed: context.onNextTap,
//                                     title: context.loc.create,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class _Title extends StatelessWidget {
  final String title;

  const _Title(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Text(title, style: Theme.of(context).textTheme.titleSmall)],
      ),
    );
  }
}

class BarButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;

  const BarButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title.toUpperCase(),
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  final CategoryType type;

  const _CategoryList(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    return ItemsList(
      title: context.loc.categories,
      onAddItem: () => context.addNewCategoryItem(type),
      onAddGroup: () => context.addNewCategoryGroup(type),
      list: Row(
        children: [
          Builder(
            builder: (context) => Flexible(
              child: CategoryGroupList(
                type: type,
                initialParent: context.readCategoryGroupId(type),
                onChange: (e) => context.onChangeCategoryGroup(e?.id, type),
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Builder(
            builder: (context) => Flexible(
              child: CategoryItemList(
                type: type,
                parent: context.watchCategoryGroupId(type),
                initialItem: context.categoryId(type),
                onChange: (e) => context.onChangeCategory(e?.id, type),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItemList extends StatelessWidget {
  final CategoryType type;
  final int? initialItem;
  final int? parent;
  final void Function(CategoryView?) onChange;

  const CategoryItemList({
    super.key,
    required this.type,
    required this.initialItem,
    required this.onChange,
    required this.parent,
  });

  @override
  Widget build(BuildContext context) {
    final items = context.watchCategoryItems(type, parent);

    if (items.isEmpty) {
      onChange(null);
    }

    return CarouselList<CategoryView>(
      items: items,
      emptyListMessage: context.loc.noCategories,
      initialValue: initialItem == null
          ? null
          : items.where((e) => e.id == initialItem).firstOrNull,
      onItemChanged: onChange,
      itemBuilder: (context, category) => CategoryListItem(category: category),
    );
  }
}

class CategoryGroupList extends StatelessWidget {
  final CategoryType type;
  final int? initialParent;
  final void Function(CategoryView?) onChange;

  const CategoryGroupList({
    super.key,
    required this.type,
    this.initialParent,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final items = context.watchCategoryGroups(type)
      ..add(CategoryView.groupNoParent());

    return CarouselList<CategoryView>(
      items: items,
      emptyListMessage: context.loc.noCategories,
      initialValue: initialParent == null
          ? items.where((e) => e == CategoryView.groupNoParent()).firstOrNull
          : items.where((e) => e.id == initialParent).firstOrNull,
      onItemChanged: (e) {
        onChange(e == CategoryView.groupNoParent() ? null : e);
      },
      itemBuilder: (context, category) =>
          CategoryListGroup(category: category, type: type),
    );
  }
}

class AccountRecList extends StatelessWidget {
  const AccountRecList({super.key});

  @override
  Widget build(BuildContext context) {
    final accounts = context
        .watchAllBalances()
        .where((e) => e.accountId != context.accountId())
        .toList();

    return ItemsList(
      title: context.loc.receiver,
      onAddItem: context.addNewRecAccount,
      onAddGroup: null,
      list: AccountPageView(
        accounts: accounts,
        initialValue: accounts
            .where((e) => e.accountId == context.recAccountId())
            .firstOrNull,
        onItemChanged: (item) => context.onChangeRecAccount(item.accountId),
      ),
    );
  }
}

class ItemsList extends StatelessWidget {
  final String title;
  final void Function() onAddItem;
  final void Function()? onAddGroup;
  final Widget list;

  const ItemsList({
    super.key,
    required this.title,
    required this.onAddItem,
    required this.list,
    required this.onAddGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(title, style: Theme.of(context).textTheme.titleSmall),
                Spacer(),
                if (onAddGroup != null)
                  IconButton(
                    icon: const Icon(Icons.create_new_folder_outlined),
                    onPressed: onAddGroup,
                  ),
                IconButton(icon: const Icon(Icons.add), onPressed: onAddItem),
              ],
            ),
            const Divider(),
            Flexible(child: Container(child: list)),
          ],
        ),
      ),
    );
  }
}

class AccountPageView extends StatelessWidget {
  final List<AccountBalanceView> accounts;
  final void Function(AccountBalanceView) onItemChanged;
  final AccountBalanceView? initialValue;

  const AccountPageView({
    super.key,
    required this.accounts,
    required this.onItemChanged,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselList<AccountBalanceView>(
      items: accounts,
      emptyListMessage: context.loc.noAccounts,
      initialValue: initialValue,
      onItemChanged: onItemChanged,
      itemBuilder: (context, account) => AccountItem(account: account),
    );
  }
}
