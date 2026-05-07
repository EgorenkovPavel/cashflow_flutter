abstract class TypeConverter<D, S> {
  const TypeConverter();

  S toCloud(D value);

  D fromCloud(S fromDb);
}