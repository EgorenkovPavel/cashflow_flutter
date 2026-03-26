
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:money_tracker/data/sources/settings_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'settings_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main(){

  late SettingsSource settingsSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp((){
    mockSharedPreferences = MockSharedPreferences();
    settingsSource = SharedPrefs(mockSharedPreferences);
  });

  group('should forward call to shared prefs', (){

    test('get sync date', (){
      final date = DateTime(2021, 1,1);

      when(mockSharedPreferences.getInt(any)).thenReturn(date.millisecondsSinceEpoch);

      final result = settingsSource.syncDate;

      expect(result, date);
    });

    test('set sync date', () async {
      final date = DateTime(2021, 1,1);

      when(mockSharedPreferences.setInt(any, any)).thenAnswer((_) => Future.value(true));

      await settingsSource.setSyncDate(date);

      verify(mockSharedPreferences.setInt(any, date.millisecondsSinceEpoch));
    });

    test('get drive file name', (){
      const name = 'drive file name';

      when(mockSharedPreferences.getString(any)).thenReturn(name);

      final result = settingsSource.googleDriveFileName;

      expect(result, name);
    });

    test('set drive file name', () async {
      const name = 'drive file name';

      when(mockSharedPreferences.setString(any, any)).thenAnswer((_) => Future.value(true));

      await settingsSource.setGoogleDriveFileName(name);

      verify(mockSharedPreferences.setString(any, name));
    });


  });

}