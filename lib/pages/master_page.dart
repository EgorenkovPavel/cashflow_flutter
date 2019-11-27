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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
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
                child: Text('More'.toUpperCase()),
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
                child: Text('Next'.toUpperCase()),
                onPressed: () => _saveOperation(context),
              )
            ]);
          }),
        ],
      ),
    );
  }

  void _saveOperation(BuildContext context) {

    if(_account == null){
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Choose account'),
      ));
      return;
    }

    if(_type == OperationType.TRANSFER && _recAccount == null){
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Choose recipient account'),
      ));
      return;
    }

    if(_type != OperationType.TRANSFER && (_category == null || _category.operationType != _type)){
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Choose category'),
      ));
      return;
    }

    int sum = int.parse(_sumController.text);
    if(sum == 0){
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Sum is empty'),
      ));
      return;
    }

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
      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
      child: Text(text, style: Theme.of(context).textTheme.caption,),
    );
  }

  Widget accountList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, pos) {
        return AccountItem(_accountList[pos],
            _accountList[pos] == _account,(account){
          setState(() {
            _account = account;
            if(_account == _recAccount){
              _recAccount = null;
            }
          });
        });
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
            return Column(
              children: <Widget>[
                Divider(height: 0.0,),
                ListTile(
                  title: CategoryItem(_categoryInList[pos]),
                ),
                Divider(height: 0.0,)
              ],
            );
          },
          itemCount: _categoryInList?.length ?? 0,
        );
      case OperationType.OUTPUT:
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, pos) {
            return Column(
              children: <Widget>[
                Divider(height: 0.0,),
                ListTile(
                  title: CategoryItem(_categoryOutList[pos]),
                ),
                Divider(height: 0.0,)
              ],
            );
          },
          itemCount: _categoryOutList?.length ?? 0,
        );
      case OperationType.TRANSFER:
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, pos) {
            return AccountItem(_accountList[pos],
                _accountList[pos] == _recAccount,
                    (account){
              if(account != _account)
              setState(() {
                _recAccount = account;
              });
            });
          },
          itemCount: _accountList?.length ?? 0,
        );
    }
  }

  Widget AccountItem(AccountData account, bool mark, Function onTap) {
    Color color = mark ? Theme.of(context).accentColor : Colors.black26;

    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: color,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              border: Border.all(color: color),
          ),
          width: 150.0,
          alignment: Alignment.center,
          child: Text(account.title),
        ),
        onTap: () => onTap(account),
      ),
    );
  }

  Widget CategoryItem(CategoryData category) {
    return ListTile(
      selected: category == _category,
      title: Text(category.title),
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