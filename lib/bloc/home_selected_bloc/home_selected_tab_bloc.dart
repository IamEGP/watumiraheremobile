import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_selected_tab_event.dart';
part 'home_selected_tab_state.dart';

class HomeSelectedTabBloc extends Bloc<HomeSelectedTabEvent, HomeSelectedTabState> {
  HomeSelectedTabBloc() : super(SelectedHomeTab(tab: 0));

  @override
  Stream<HomeSelectedTabState> mapEventToState(
    HomeSelectedTabEvent event,
  ) async* {
    if (event is SelectHomeTabEvent) {
      yield SelectedHomeTab(tab: event.tab);
    }
  }
}
