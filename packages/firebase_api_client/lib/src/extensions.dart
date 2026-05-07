extension MapExtension on Map<String, dynamic> {
  T getOrDefault<T>(String key, T value) {
    return containsKey(key) ? this[key] as T : value;
  }

  T? getOrNull<T>(String key){
    return containsKey(key) ? this[key] as T : null;
  }
}