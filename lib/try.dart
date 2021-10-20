abstract class Try<T>{
  bool isSuccess() => this is Success<T>;
  bool isFailure() => !isSuccess();

  R fold<R>(R Function(T success) fnL, R Function(Exception failure) fnR);

  T? getOrNull() => fold((success) => success, (failure) => null);

  T getOrDefault(T def) => fold((success) => success, (failure) => def);
}

class Success<T> extends Try<T>{
  final T value;

  Success(this.value);

  @override
  R fold<R>(R Function(T success) fnL, R Function(Exception failure) fnR) {
    return fnL(value);
  }
}

class Failure<T> extends Try<T>{
  final Exception value;

  Failure(this.value);

  @override
  R fold<R>(R Function(T success) fnL, R Function(Exception failure) fnR) {
    return fnR(value);
  }
}