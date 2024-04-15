extension MapExtension on Map<String, dynamic> {
  T getOrDefault<T>(String key, T value) {
    return containsKey(key) ? this[key] : value;
  }
}