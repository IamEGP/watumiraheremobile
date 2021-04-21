import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    inspect(transition.nextState);
    super.onTransition(bloc, transition);
  }
}
