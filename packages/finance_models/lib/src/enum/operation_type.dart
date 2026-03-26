
enum OperationType {
  INPUT,
  OUTPUT,
  TRANSFER,
  EXCHANGE;

  const OperationType();

  T map<T>({
    required T Function() input,
    required T Function() output,
    required T Function() transfer,
    required T Function() exchange,
  }) =>
      switch (this) {
        OperationType.INPUT => input(),
        OperationType.OUTPUT => output(),
        OperationType.TRANSFER => transfer(),
        OperationType.EXCHANGE => exchange(),
      };
}
