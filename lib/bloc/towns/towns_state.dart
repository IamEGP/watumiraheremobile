part of 'towns_bloc.dart';

abstract class TownsState extends Equatable {
  const TownsState();

  @override
  List<Object> get props => [];
}

class TownsInitial extends TownsState {}

class TownsLoadingState extends TownsState {}

class TownsLoadedState extends TownsState {
  final Towns towns;
  final Town userTown;
  TownsLoadedState({this.towns, this.userTown});

  TownsLoadedState copyWith({Towns towns, Town userTown}) {
    return TownsLoadedState(towns: towns ?? this.towns, userTown: userTown ?? this.towns);
  }

  @override
  List<Object> get props => [towns, userTown];
}

class TownsErrorState extends TownsState {
  final String message;
  TownsErrorState({this.message});

  @override
  List<Object> get props => [message];
}
