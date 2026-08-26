import 'package:uuid/uuid.dart';

import '../models/models.dart';

abstract interface class OperationService {
  Future<OperationResponse> getById(UuidValue id);

  Future<List<OperationResponse>> getAll();

  Future<OperationResponse> create(CreateOperationRequest req);

  Future<OperationResponse> update(UpdateOperationRequest req);

  Future<OperationResponse> delete(UuidValue id);

  Future<OperationResponse> recover(UuidValue id);
}
