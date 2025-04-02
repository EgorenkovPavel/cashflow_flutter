
abstract class SettingsSource{

  DateTime get rateDate;
  Future<void> setRateDate(DateTime date);
  double get rateUsd;
  Future<void> setRateUsd(double rate);
  double get rateEur;
  Future<void> setRateEur(double rate);

  DateTime get syncDate;
  Future<void> setSyncDate(DateTime date);

  String get googleDriveFileName;
  Future<void> setGoogleDriveFileName(String name);
}


