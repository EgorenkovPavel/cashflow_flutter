import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/settings_source.dart';

class SettingsSourceImpl implements SettingsSource {
  static const String _KEY_SYNC_DATE = 'sync_date';
  static const String _KEY_GOOGLE_DRIVE_FILE_NAME = 'google_drive_file_name';
  static const String _DEFAULT_GOOGLE_DRIVE_FILE_NAME = 'Cashflow backup';

  final SharedPreferences prefs;

  SettingsSourceImpl(this.prefs);

  @override
  DateTime get syncDate =>
      DateTime.fromMillisecondsSinceEpoch(prefs.getInt(_KEY_SYNC_DATE) ?? 0);

  @override
  Future<void> setSyncDate(DateTime date) async =>
      await prefs.setInt(_KEY_SYNC_DATE, date.millisecondsSinceEpoch);

  @override
  String get googleDriveFileName =>
      prefs.getString(_KEY_GOOGLE_DRIVE_FILE_NAME) ??
          _DEFAULT_GOOGLE_DRIVE_FILE_NAME;

  @override
  Future<void> setGoogleDriveFileName(String name) =>
      prefs.setString(_KEY_GOOGLE_DRIVE_FILE_NAME, name);
}