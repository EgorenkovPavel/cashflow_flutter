// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class PrefsRepository {
  static const String _KEY_SYNC_DATE = 'sync_date';
  static const String _KEY_GOOGLE_DRIVE_FILE_NAME = 'google_drive_file_name';
  static const String _DEFAULT_GOOGLE_DRIVE_FILE_NAME = 'Cashflow backup';

  final SharedPreferences prefs;

  PrefsRepository(this.prefs);

  DateTime get syncDate =>
      DateTime.fromMillisecondsSinceEpoch(prefs.getInt(_KEY_SYNC_DATE) ?? 0);

  Future<void> setSyncDate(DateTime date) async =>
      await prefs.setInt(_KEY_SYNC_DATE, date.millisecondsSinceEpoch);

  String get googleDriveFileName =>
      prefs.getString(_KEY_GOOGLE_DRIVE_FILE_NAME) ??
      _DEFAULT_GOOGLE_DRIVE_FILE_NAME;

  Future<void> setGoogleDriveFileName(String name) =>
      prefs.setString(_KEY_GOOGLE_DRIVE_FILE_NAME, name);
}
