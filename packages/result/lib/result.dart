library result;

sealed class Result<T> {
  Result();

  factory Result.success(T result) => _Success<T>(result);

  factory Result.failure(Exception exception) => _Failure<T>(exception);

  P map<P>({
    required P Function(T result) onSuccess,
    required P Function(Exception exception) onFailure,
  }) {
    switch (this) {
      case _Success<T>():
        return onSuccess((this as _Success).result);
      case _Failure():
        return onFailure((this as _Failure).exception);
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