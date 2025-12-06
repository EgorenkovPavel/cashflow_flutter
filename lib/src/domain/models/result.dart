sealed class Result<T> {
  Result();

  factory Result.success(T result) => _Success<T>(result);

  factory Result.failure(Exception exception) => _Failure<T>(exception);

  /// Returns true if this is a success result.
  bool get isSuccess => this is _Success<T>;

  /// Returns true if this is a failure result.
  bool get isFailure => this is _Failure<T>;

  /// Returns the result value or throws the exception.
  T getOrThrow() {
    return switch (this) {
      _Success<T>(:final result) => result,
      _Failure<T>(:final exception) => throw exception,
    };
  }

  /// Returns the result value or the default value if this is a failure.
  T getOrElse(T Function() defaultValue) {
    return switch (this) {
      _Success<T>(:final result) => result,
      _Failure<T>() => defaultValue(),
    };
  }

  /// Transforms the result using the provided functions.
  P fold<P>({
    required P Function(T result) onSuccess,
    required P Function(Exception exception) onFailure,
  }) {
    return switch (this) {
      _Success<T>(:final result) => onSuccess(result),
      _Failure<T>(:final exception) => onFailure(exception),
    };
  }

  /// Maps the result to a new type using the provided functions.
  P map<P>({
    required P Function(T result) onSuccess,
    required P Function(Exception exception) onFailure,
  }) {
    return fold(onSuccess: onSuccess, onFailure: onFailure);
  }

  Future<Result<P>> asyncMap<P>(P Function(T) mapper) async {
    final result = await this;
    return result.map(
      onSuccess: (value) => Result.success(mapper(value)),
      onFailure: (exception) => Result.failure(exception),
    );
  }

  /// Executes the handler if the result is a failure.
  Future<Result<T>> onError(void Function(Exception) handler) async {
    final result = await this;
    if (result.isFailure) {
      handler((result as _Failure<T>).exception);
    }
    return result;
  }

  /// Executes the handler if the result is a success.
  Future<Result<T>> onSuccess(void Function(T) handler) async {
    final result = await this;
    if (result.isSuccess) {
      handler((result as _Success<T>).result);
    }
    return result;
  }

  /// Returns the result value or null if this is a failure.
  Future<T?> getOrNull() async {
    final result = await this;
    return result.fold(
      onSuccess: (value) => value,
      onFailure: (_) => null,
    );
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