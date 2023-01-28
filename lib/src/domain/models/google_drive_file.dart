import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_drive_file.freezed.dart';

@freezed
class DriveFile with _$DriveFile {
  const factory DriveFile({
    required String title,
    required String id,
    required bool isFolder,
    required DateTime lastChanges,
    required bool enabled,
  }) = _DriveFile;

  static DriveFile root() {
    return DriveFile(
      id: 'root',
      title: 'root',
      isFolder: true,
      lastChanges: DateTime.now(),
      enabled: false,
    );
  }
}
