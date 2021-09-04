import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/data/google_http_client.dart';

abstract class BackupPageState {}

class InitialState extends BackupPageState {}

class ProgressState extends BackupPageState {}

class GetHttpClientError extends BackupPageState {}

class BackupSuccessState extends BackupPageState {}

class RestoreSuccessState extends BackupPageState {}

class DeleteSuccessState extends BackupPageState {}

class BackupPageBloc extends Cubit<BackupPageState> {
  final Repository _repository;

  BackupPageBloc(this._repository) : super(InitialState());

  Future<void> backup(GoogleHttpClient client, String catalogId, String fileName) async {
    emit(ProgressState());
    await _repository.backup(client, catalogId, fileName);
    emit(BackupSuccessState());
    emit(InitialState());
  }

  Future<void> restore(GoogleHttpClient client, String fileId) async {
    emit(ProgressState());
    await _repository.restore(client, fileId);
    emit(RestoreSuccessState());
    emit(InitialState());
  }

  Future<void> deleteAll() async {
    emit(ProgressState());
    await _repository.deleteAll();
    emit(DeleteSuccessState());
    emit(InitialState());
  }

  Future<GoogleHttpClient?> getHttpClient() async {
    GoogleHttpClient? httpClient;
    try {
      httpClient = await GoogleHttpClient.getClient();
    } catch (e) {
      return null;
    }
    return httpClient;
  }
}
