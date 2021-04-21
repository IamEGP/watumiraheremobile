import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watumira/data/models/collectors.dart';
import 'package:watumira/data/models/products.dart';
import 'package:watumira/data/models/towns.dart';

part 'selected_event.dart';
part 'selected_state.dart';

class SelectedBloc extends Bloc<SelectedEvent, SelectedState> {
  SelectedBloc() : super(SelectedDataState());

  @override
  Stream<SelectedState> mapEventToState(
    SelectedEvent event,
  ) async* {
    if (event is SelectTownEvent) {
      var currentState = state;
      if (currentState is SelectedDataState) {
        yield currentState.copyWith(town: event.town);
      }
    }

    if (event is SelectProductEvent) {
      var currentState = state;
      if (currentState is SelectedDataState) {
        yield currentState.copyWith(product: event.product);
      }
    }

    if (event is SelectCollectorEvent) {
      var currentState = state;
      if (currentState is SelectedDataState) {
        yield currentState.copyWith(collector: event.collector);
      }
    }

    if (event is SelectCollectionPointEvent) {
      var currentState = state;
      if (currentState is SelectedDataState) {
        yield currentState.copyWith(collectionPoint: event.collectionPoint);
      }
    }
  }
}
