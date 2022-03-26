import 'package:equatable/equatable.dart';

class DriveFile extends Equatable{
  final String title;
  final String id;
  final bool isFolder;
  final DateTime lastChanges;
  final bool enabled;

  const DriveFile({
    required this.enabled,
    required this.lastChanges,
    required this.title,
    required this.id,
    required this.isFolder,
  });

  static DriveFile root() {
    return DriveFile(
      id: 'root',
      title: 'root',
      isFolder: true,
      lastChanges: DateTime.now(),
      enabled: false,
    );
  }

  @override
  List<Object?> get props => [id];
}
