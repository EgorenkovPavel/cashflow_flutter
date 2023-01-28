
abstract class SettingsSource{

  DateTime get syncDate;
  Future<void> setSyncDate(DateTime date);

  String get googleDriveFileName;
  Future<void> setGoogleDriveFileName(String name);
}


