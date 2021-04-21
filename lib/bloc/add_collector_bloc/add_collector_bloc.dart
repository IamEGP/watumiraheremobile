import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'add_collector_event.dart';
part 'add_collector_state.dart';

class AddCollectorBloc extends Bloc<AddCollectorEvent, AddCollectorState> {
  AddCollectorBloc() : super(AddCollectorFormData(name: '', phoneNumber: ''));

  @override
  Stream<AddCollectorState> mapEventToState(
    AddCollectorEvent event,
  ) async* {
    if (event is AddCollectorName) {
      var currentState = state;
      if (currentState is AddCollectorFormData) {
        yield currentState.copyWith(name: event.name);
      }
    }

    if (event is AddCollectorPhoneNumber) {
      var currentState = state;
      if (currentState is AddCollectorFormData) {
        yield currentState.copyWith(phoneNumber: event.phoneNumber);
      }
    }
  }
}
