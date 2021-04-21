part of 'towns_bloc.dart';

abstract class TownsEvent extends Equatable {
  const TownsEvent();

  @override
  List<Object> get props => [];
}

class LoadTownsEvent extends TownsEvent {
  final int page;
  final int limit;
  final String query;

  LoadTownsEvent({this.page, this.limit, this.query});

  @override
  List<Object> get props => [page, limit];
}

class SaveTownEvent extends TownsEvent {
  final String slug;

  SaveTownEvent({@required this.slug});

  @override
  List<Object> get props => [slug];
}

class GetUserTownEvent extends TownsEvent {}
