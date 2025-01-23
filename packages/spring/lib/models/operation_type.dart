enum OperationType {
  input,
  output,
  transfer;

  static OperationType fromString(String name) => switch (name) {
        'INPUT' => input,
        'OUTPUT' => output,
        'TRANSFER' => transfer,
        String() => throw UnimplementedError(),
      };

  String toString() => switch(this){
    OperationType.input => 'INPUT',
    OperationType.output => 'OUTPUT',
    OperationType.transfer => 'TRANSFER',
  };
}
