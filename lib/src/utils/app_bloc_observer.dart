import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {

  final fullStacktrace = true;

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (fullStacktrace) {
      debugPrint('onEvent -- ${bloc.runtimeType}, $event');
    }else{
      debugPrint('onEvent -- ${bloc.runtimeType}, ${event.runtimeType}');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (fullStacktrace) {
      debugPrint('onChange -- ${bloc.runtimeType}, $change');
    }else{
      debugPrint('onChange -- ${bloc.runtimeType}');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (fullStacktrace) {
      debugPrint('onTransition -- ${bloc.runtimeType}, $transition');
    }else{
      debugPrint('onTransition -- ${bloc.runtimeType}');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('onError -- ${bloc.runtimeType}, $error, $stackTrace');
    if (!kDebugMode) {
      FirebaseCrashlytics.instance.recordError(
          error,
          stackTrace,
          reason: 'onError -- ${bloc.runtimeType}, $error',
          fatal: true,
      );
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('onClose -- ${bloc.runtimeType}');
  }
}