part of 'home_selected_tab_bloc.dart';

abstract class HomeSelectedTabEvent extends Equatable {
  const HomeSelectedTabEvent();

  @override
  List<Object> get props => [];
}

class SelectHomeTabEvent extends HomeSelectedTabEvent {
  final int tab;

  SelectHomeTabEvent({@required this.tab});

  @override
  List<Object> get props => [tab];
}
