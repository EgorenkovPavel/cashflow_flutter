extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension DateTimeExtension on DateTime{
  DateTime startOfMonth(DateTime date){
    return DateTime(date.year, date.month).add(const Duration());
  }
}

extension MapExtension on Map<String, dynamic>{
  dynamic getOrDefault(String key, dynamic value){
    return containsKey(key)
        ? this[key]
        : value;
  }
}