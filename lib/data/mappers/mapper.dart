abstract class Mapper<D,S>{
  const Mapper();

  S mapToSql(D c);

  D mapToDart(S c);
}