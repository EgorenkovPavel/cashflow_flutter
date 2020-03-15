abstract class Mapper<D,S>{
  const Mapper();

  S mapToSql(D c);

  D mapToDart(S c);

  List<S> mapListToSql(List<D> list) => list.map((a) => mapToSql(a)).toList();

  List<D> mapListToDart(List<S> list) => list.map((a) => mapToDart(a)).toList();
}