enum CategoryType{
  input, output;

  static CategoryType fromString(String name) => switch(name) {
    'INPUT' => input,
    'OUTPUT' => output,
    String() => throw UnimplementedError(),
  };

  @override
  String toString() => switch(this){
    CategoryType.input => 'INPUT',
    CategoryType.output => 'OUTPUT',
  };
}