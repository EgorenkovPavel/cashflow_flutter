sealed class Result<T> {
  Result();

  factory Result.success(T result) => _Success<T>(result);

  factory Result.failure(Exception exception) => _Failure<T>(exception);

  P map<P>({
    required P Function(T result) onSuccess,
    required P Function(Exception exception) onFailure,
  }) {
    switch (this) {
      case _Success<T>(:final result):
        return onSuccess(result);
      case _Failure(:final exception):
        return onFailure(exception);
    }
  }
}

class _Success<T> extends Result<T> {
  final T result;

  _Success(this.result);
}

class _Failure<T> extends Result<T> {
  final Exception exception;

  _Failure(this.exception);
}