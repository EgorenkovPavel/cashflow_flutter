import 'package:flutter_bloc/flutter_bloc.dart';

import 'logger.dart';

class AppBlocObserver extends BlocObserver {

  final fullStacktrace = false;

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    AppLogger.debug('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (fullStacktrace) {
      AppLogger.debug('onEvent -- ${bloc.runtimeType}, $event');
    }else{
      AppLogger.debug('onEvent -- ${bloc.runtimeType}, ${event.runtimeType}');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (fullStacktrace) {
      AppLogger.debug('onChange -- ${bloc.runtimeType}, $change');
    }else{
      AppLogger.debug('onChange -- ${bloc.runtimeType}');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // if (fullStacktrace) {
    //   AppLogger.debug('onTransition -- ${bloc.runtimeType}, $transition');
    // }else{
    //   AppLogger.debug('onTransition -- ${bloc.runtimeType}');
    // }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    AppLogger.error('onError -- ${bloc.runtimeType}', error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    AppLogger.debug('onClose -- ${bloc.runtimeType}');
  }
}