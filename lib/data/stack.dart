
class Stack<T>{

  List<T> list = List();

  void push(T item){
    list.add(item);
  }

  T pop(){
    return list.removeLast();
  }

  T top(){
    return list.last;
  }

  bool isEmpty(){
    return list.isEmpty;
  }

}