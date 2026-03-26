import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

/// Centralized logger for the application.
/// 
/// In debug mode: uses [debugPrint] for all log levels.
/// In production: uses [FirebaseCrashlytics] for info, warning, and error logs.
class AppLogger {
  AppLogger._();

  /// Log debug message (only in debug mode).
  static void debug(String message, [Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      if (error != null && stackTrace != null) {
        debugPrint('DEBUG: $message\nError: $error\n$stackTrace');
      } else if (error != null) {
        debugPrint('DEBUG: $message\nError: $error');
      } else {
        debugPrint('DEBUG: $message');
      }
    }
  }

  /// Log info message.
  static void info(String message) {
    if (kDebugMode) {
      debugPrint('INFO: $message');
    } else {
      FirebaseCrashlytics.instance.log('INFO: $message');
    }
  }

  /// Log warning message.
  static void warning(String message, [Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      if (error != null && stackTrace != null) {
        debugPrint('WARNING: $message\nError: $error\n$stackTrace');
      } else if (error != null) {
        debugPrint('WARNING: $message\nError: $error');
      } else {
        debugPrint('WARNING: $message');
      }
    } else {
      FirebaseCrashlytics.instance.log('WARNING: $message');
      if (error != null && stackTrace != null) {
        FirebaseCrashlytics.instance.recordError(
          error,
          stackTrace,
          reason: 'WARNING: $message',
          fatal: false,
        );
      }
    }
  }

  /// Log error message with optional exception and stack trace.
  /// 
  /// In debug mode: prints to console.
  /// In production: records to Firebase Crashlytics.
  static void error(
    String message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    if (kDebugMode) {
      if (error != null && stackTrace != null) {
        debugPrint('ERROR: $message\nError: $error\n$stackTrace');
      } else if (error != null) {
        debugPrint('ERROR: $message\nError: $error');
      } else {
        debugPrint('ERROR: $message');
      }
    } else {
      FirebaseCrashlytics.instance.log('ERROR: $message');
      if (error != null && stackTrace != null) {
        FirebaseCrashlytics.instance.recordError(
          error,
          stackTrace,
          reason: 'ERROR: $message',
          fatal: false,
        );
      }
    }
  }
}
