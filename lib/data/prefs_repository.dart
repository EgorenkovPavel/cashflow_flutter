import 'package:shared_preferences/shared_preferences.dart';

class PrefsRepository {
  static const String _KEY_SYNC_DATE = 'sync_date';

  final SharedPreferences prefs;

  PrefsRepository(this.prefs);

  DateTime get syncDate =>
      DateTime.fromMillisecondsSinceEpoch(prefs.getInt(_KEY_SYNC_DATE) ?? 0);

  Future<void> setSyncDate(DateTime date) async =>
      await prefs.setInt(_KEY_SYNC_DATE, date.millisecondsSinceEpoch);
}
