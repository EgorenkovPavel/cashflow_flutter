import 'package:spring/services/operation_service.dart';

import '../models/models.dart';
import 'network_client.dart';

class OperationServiceImpl implements OperationService {
  final NetworkClient _connector;
  final _path = 'operations';

  OperationServiceImpl(this._connector);

  @override
  Future<List<Operation>> getAll() => _connector.get<List<Operation>>(_path);

  @override
  Future<Operation> createInputOperation(
          DateTime date, Account account, Category category, int sum) =>
      _postOperation(
          date: date,
          type: OperationType.input,
          account: account.id!,
          analytic: category.id!,
          sumSent: sum,
          sumReceived: sum,
          currencySent: account.currency,
          currencyReceived: account.currency,
          user: _connector.user!.id);

  @override
  Future<Operation> createOutputOperation(
          DateTime date, Account account, Category category, int sum) =>
      _postOperation(
          date: date,
          type: OperationType.output,
          account: account.id!,
          analytic: category.id!,
          sumSent: sum,
          sumReceived: sum,
          currencySent: account.currency,
          currencyReceived: account.currency,
          user: _connector.user!.id);

  @override
  Future<Operation> createTransferOperation(DateTime date, Account account,
          Account accountRec, int sum, int sumRec) =>
      _postOperation(
          date: date,
          type: OperationType.transfer,
          account: account.id!,
          analytic: accountRec.id!,
          sumSent: sum,
          sumReceived: sumRec,
          currencySent: account.currency,
          currencyReceived: accountRec.currency,
          user: _connector.user!.id);


  @override
  Future<void> deleteOperation(OperationId id) => _connector.delete(_path, id);

  Future<Operation> _postOperation(
      {OperationId? id,
      required DateTime date,
      required OperationType type,
      required AccountId account,
      required AnalyticId analytic,
      required int sumSent,
      required int sumReceived,
      required Currency currencySent,
      required Currency currencyReceived,
      required UserId user}) async {
    Operation operation = Operation(
        id: id,
        date: date,
        type: type,
        account: account,
        analytic: analytic,
        sumSent: sumSent,
        sumReceived: sumReceived,
        currencySent: currencySent,
        currencyReceived: currencyReceived,
        user: user);
    Map<String, dynamic> data = await _connector.post(_path, operation);
    return Operation(
        id: data['id'],
        date: operation.date,
        type: operation.type,
        account: operation.account,
        analytic: operation.analytic,
        sumSent: operation.sumSent,
        sumReceived: operation.sumReceived,
        currencySent: operation.currencySent,
        currencyReceived: operation.currencyReceived,
        user: operation.user);
  }

  @override
  Future<Operation> swapToInputOperation(OperationId operationId, DateTime date,
          Account account, Category category, int sum) =>
      _connector.update('$_path/$operationId', {
        'date': date,
        'type': OperationType.input,
        'account': account.id,
        'analytic': category.id,
        'sumSent': sum,
        'sumReceived': sum,
        'currencySent': account.currency,
        'currencyReceived': account.currency,
      });

  @override
  Future<Operation> swapToOutputOperation(OperationId operationId, DateTime date,
      Account account, Category category, int sum)=>
      _connector.update('$_path/$operationId', {
        'date': date,
        'type': OperationType.output,
        'account': account.id,
        'analytic': category.id,
        'sumSent': sum,
        'sumReceived': sum,
        'currencySent': account.currency,
        'currencyReceived': account.currency,
      });

  @override
  Future<Operation> swapToTransferOperation(OperationId operationId, DateTime date,
      Account account, Account accountRec, int sum, int sumRec) =>
      _connector.update('$_path/$operationId', {
        'date': date,
        'type': OperationType.transfer,
        'account': account.id,
        'analytic': accountRec.id,
        'sumSent': sum,
        'sumReceived': sumRec,
        'currencySent': account.currency,
        'currencyReceived': accountRec.currency,
      });
}
