import 'operation_service.dart';

import '../models/models.dart';
import 'network_client.dart';

class OperationServiceImpl implements OperationService {
  final NetworkClient _connector;

  OperationServiceImpl(this._connector);

  String get _path => 'user-groups/${_connector.user!.userGroup}/operations';

  @override
  Future<Operation> getById(OperationId id) => _connector.get<Operation>(
        '$_path/$id',
        (e) => Operation.fromJson(e),
      );

  @override
  Future<List<Operation>> getAll() => _connector.get<List<Operation>>(
        _path,
        (data) => data.map<Operation>((e) => Operation.fromJson(e)).toList(),
      );

  @override
  Future<InputOperation> createInputOperation(
    DateTime date,
    Account account,
    InputCategoryItem category,
    int sum,
    Currency currency,
  ) async {
    InputOperation operation = InputOperation(
      date: date,
      account: account.id!,
      analytic: category.id!,
      sum: sum,
      currency: currency,
      user: _connector.user!.id,
    );
    final id = await _postOperation(operation);
    return operation.copyWithId(id);
  }

  @override
  Future<OutputOperation> createOutputOperation(
    DateTime date,
    Account account,
    OutputCategoryItem category,
    int sum,
    Currency currency,
  ) async {
    OutputOperation operation = OutputOperation(
      date: date,
      account: account.id!,
      analytic: category.id!,
      sum: sum,
      currency: currency,
      user: _connector.user!.id,
    );
    final id = await _postOperation(operation);
    return operation.copyWithId(id);
  }

  @override
  Future<TransferOperation> createTransferOperation(
    DateTime date,
    BaseAccount account,
    BaseAccount accountRec,
    int sumSent,
    int sumReceived,
    Currency currencySent,
    Currency currencyReceived,
  ) async {
    TransferOperation operation = TransferOperation(
      date: date,
      account: account.id!,
      analytic: accountRec.id!,
      sumSent: sumSent,
      sumReceived: sumReceived,
      currencySent: currencySent,
      currencyReceived: currencyReceived,
      user: _connector.user!.id,
    );
    final id = await _postOperation(operation);
    return operation.copyWithId(id);
  }

  @override
  Future<void> deleteOperation(OperationId id) =>
      _connector.delete('$_path/$id');

  Future<OperationId> _postOperation(Operation operation) =>
      _connector.post(_path, operation.toJson());

  @override
  Future<InputOperation> swapToInputOperation(
    Operation operation,
    DateTime date,
    Account account,
    InputCategoryItem category,
    int sum,
    Currency currency,
  ) async {
    InputOperation newOperation = InputOperation(
      id: operation.id,
      date: date,
      account: account.id!,
      analytic: category.id!,
      sum: sum,
      currency: currency,
      user: _connector.user!.id,
    );
    return await _connector.update(
      path: '$_path/${operation.id}',
      body: newOperation.toJson(),
      mapper: (e) => Operation.fromJson(e) as InputOperation,
    );
  }

  @override
  Future<OutputOperation> swapToOutputOperation(
    Operation operation,
    DateTime date,
    Account account,
    OutputCategoryItem category,
    int sum,
    Currency currency,
  ) async {
    OutputOperation newOperation = OutputOperation(
      id: operation.id,
      date: date,
      account: account.id!,
      analytic: category.id!,
      sum: sum,
      currency: currency,
      user: _connector.user!.id,
    );
    return await _connector.update(
      path: '$_path/${operation.id}',
      body: newOperation.toJson(),
      mapper: (e) => Operation.fromJson(e) as OutputOperation,
    );
  }

  @override
  Future<TransferOperation> swapToTransferOperation(
    Operation operation,
    DateTime date,
    BaseAccount account,
    BaseAccount accountRec,
    int sumSent,
    int sumReceived,
    Currency currencySent,
    Currency currencyReceived,
  ) async {
    TransferOperation newOperation = TransferOperation(
      id: operation.id,
      date: date,
      account: account.id!,
      analytic: accountRec.id!,
      sumSent: sumSent,
      sumReceived: sumReceived,
      currencySent: currencySent,
      currencyReceived: currencyReceived,
      user: _connector.user!.id,
    );
    return await _connector.update(
      path: '$_path/${operation.id}',
      body: newOperation.toJson(),
      mapper: (e) => Operation.fromJson(e) as TransferOperation,
    );
  }
}
