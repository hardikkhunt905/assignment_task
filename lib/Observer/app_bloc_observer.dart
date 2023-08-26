import 'package:flutter_bloc/flutter_bloc.dart';

import '../Constants/constants.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    // Debug.setLog('BLOC EVENT ${event}');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    Debug.setLog('BLOC ERROR ${error}' );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // Debug.setLog('BLOC TRANSITION ${transition.event}' );
    super.onTransition(bloc, transition);
  }
}