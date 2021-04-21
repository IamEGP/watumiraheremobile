part of 'home_selected_tab_bloc.dart';

abstract class HomeSelectedTabState extends Equatable {
  const HomeSelectedTabState();

  @override
  List<Object> get props => [];
}

class SelectedHomeTab extends HomeSelectedTabState {
  final int tab;

  SelectedHomeTab({@required this.tab});

  @override
  List<Object> get props => [tab];
}
