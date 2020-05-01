extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

extension DateTimeExtension on DateTime{
  DateTime startOfMonth(DateTime date){
    return DateTime(date.year, date.month).add(Duration());
  }
}