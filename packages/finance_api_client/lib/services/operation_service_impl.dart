import 'package:uuid/uuid.dart';

import '../models/models.dart';
import 'network_client.dart';
import 'operation_service.dart';

class OperationServiceImpl implements OperationService {
  final NetworkClient _connector;

  OperationServiceImpl(this._connector);

  String get _path => 'user-groups/${_connector.user!.groupId}/operations';

  @override
  Future<OperationResponse> getById(UuidValue id) => _connector.get<OperationResponse>(
        '$_path/$id',
        (e) => OperationResponse.fromJson(e),
      );

  @override
  Future<List<OperationResponse>> getAll() => _connector.get<List<OperationResponse>>(
        _path,
        (data) => data.map<OperationResponse>((e) => OperationResponse.fromJson(e)).toList(),
      );

  @override
  Future<OperationResponse> create(CreateOperationRequest req){
    return _postOperation(req);
  }

  @override
  Future<OperationResponse> update(UpdateOperationRequest req) {
    return _connector.update(
      path: '$_path/${req.id}',
      body: req.toJson(),
    );
  }
  @override
  Future<OperationResponse> delete(UuidValue id) =>
      _connector.delete<OperationResponse>('$_path/$id');

  @override
  Future<OperationResponse> recover(UuidValue id) =>
      _connector.delete<OperationResponse>('$_path/$id');

  Future<OperationResponse> _postOperation(CreateOperationRequest req) =>
      _connector.post(_path, req.toJson());

}
