import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/model.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/widgets/operation_type_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MasterPage extends StatefulWidget {
  static const routeName = '/master';

  @override
  _MasterPageState createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  OperationType _type;
  AccountData _account;
  CategoryData _category;
  AccountData _recAccount;
  TextEditingController _sumController = TextEditingController(text: '0');

  Model model;
  List<AccountData> _accountList;
  List<CategoryData> _categoryInList;
  List<CategoryData> _categoryOutList;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    model = Provider.of<Model>(context);

    model.watchAllAccounts().forEach((list) {
      setState(() {
        _accountList = list;
      });
    });

    model.watchAllCategoriesByType(OperationType.INPUT).forEach((list) {
      setState(() {
        _categoryInList = list;
      });
    });

    model.watchAllCategoriesByType(OperationType.OUTPUT).forEach((list) {
      setState(() {
        _categoryOutList = list;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _type = OperationType.INPUT;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operation master'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          title('Operation type'),
          OperationTypeRadioButton(
            type: _type,
            onChange: (newValue) {
              setState(() {
                _type = newValue;
              });
            },
            items: [
              OperationType.INPUT,
              OperationType.OUTPUT,
              OperationType.TRANSFER
            ],
          ),
          title('Account'),
          Expanded(
            flex: 1,
            child: accountList(),
          ),
          title('Category'),
          Expanded(
            flex: _type == OperationType.TRANSFER ? 1 : 3,
            child: analyticList(),
          ),
          Expanded(
            flex: _type == OperationType.TRANSFER ? 2 : 0,
            child: SizedBox(),
          ),
          Builder(builder: (context) {
            return Row(children: <Widget>[
              FlatButton(
                child: Text('MORE'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Expanded(
                child: TextField(
                  controller: _sumController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onEditingComplete: () => _saveOperation(context),
                  inputFormatters: [TextInputFomatter()],
                ),
              ),
              FlatButton(
                child: Text('NEXT'),
                onPressed: () => _saveOperation(context),
              )
            ]);
          }),
        ],
      ),
    );
  }

  void _saveOperation(BuildContext context) {
    int sum = int.parse(_sumController.text);

    if (_type == OperationType.TRANSFER) {
      OperationData operation = OperationData(
          date: DateTime.now(),
          operationType: _type,
          account: _account.id,
          recAccount: _recAccount.id,
          sum: sum);

      model.insertOperation(operation);
    } else {
      OperationData operation = OperationData(
          date: DateTime.now(),
          operationType: _type,
          account: _account.id,
          category: _category.id,
          sum: sum);

      model.insertOperation(operation);
    }

    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Operation created'),
    ));

    _sumController.text = '0';
  }

  Widget title(String text) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Text(text),
    );
  }

  Widget accountList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, pos) {
        return AccountItem(_accountList[pos]);
      },
      itemCount: _accountList?.length ?? 0,
    );
  }

  Widget analyticList() {
    switch (_type) {
      case OperationType.INPUT:
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, pos) {
            return ListTile(
              title: CategoryItem(_categoryInList[pos]),
            );
          },
          itemCount: _categoryInList?.length ?? 0,
        );
      case OperationType.OUTPUT:
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, pos) {
            return ListTile(
              title: CategoryItem(_categoryOutList[pos]),
            );
          },
          itemCount: _categoryOutList?.length ?? 0,
        );
      case OperationType.TRANSFER:
        return accountList();
    }
  }

  Widget AccountItem(AccountData account) {
    Color color = _account == account ? Colors.green : Colors.black26;

    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              border: Border.all(color: color)),
          width: 150.0,
          alignment: Alignment.center,
          child: Text(account.title),
        ),
        onTap: () {
          setState(() {
            _account = account;
          });
        },
      ),
    );
  }

  Widget CategoryItem(CategoryData category) {
    Widget icon = category == _category
        ? Icon(
            Icons.check,
            color: Colors.green,
          )
        : null;

    return ListTile(
      title: Text(category.title),
      leading: icon,
      onTap: () {
        setState(() {
          _category = category;
        });
      },
    );
  }
}

class TextInputFomatter extends TextInputFormatter{
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;
    if(text.isEmpty || text == '0') {
      String newText = '0';
      TextSelection selection = newValue.selection.copyWith(baseOffset: newText.length, extentOffset: newText.length);
      return newValue.copyWith(text: newText, selection: selection);
    }else if (text.startsWith('0')){
      String newText = text.substring(1);
      TextSelection selection = newValue.selection.copyWith(baseOffset: newText.length, extentOffset: newText.length);
      return newValue.copyWith(text: newText, selection: selection);
    }else {
      return newValue;
    }
  }

}