import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:watumira/bloc/bloc_functions.dart';
import 'package:watumira/bloc/products_bloc/products_bloc.dart';
import 'package:watumira/data/models/towns.dart';
import 'package:watumira/data/repositories/towns/towns_repository.dart';

part 'towns_event.dart';
part 'towns_state.dart';

class TownsBloc extends Bloc<TownsEvent, TownsState> {
  final TownsRepository townsRepository;
  final ProductsBloc productsBloc;
  TownsBloc({@required this.townsRepository, @required this.productsBloc}) : super(TownsInitial());

  @override
  Stream<TownsState> mapEventToState(
    TownsEvent event,
  ) async* {
    if (event is LoadTownsEvent) {
      try {
        yield TownsLoadingState();
        var towns = await townsRepository.getTowns(
          page: event.page,
          limit: event.limit,
          query: event.query,
        );
        var userTown = await townsRepository.getUserTown();
        if (userTown != null) {
          productsBloc.add(FetchProductsEvent(limit: 100, town: userTown.slug));
        }

        yield TownsLoadedState(towns: towns, userTown: userTown);
      } catch (e) {
        var message = BlocFunctions.getErrorMessage(e);
        yield TownsErrorState(message: message);
      }
    }

    if (event is SaveTownEvent) {
      try {
        await townsRepository.saveUserTown(slug: event.slug);
        var town = await townsRepository.getUserTown();
        productsBloc.add(FetchProductsEvent(limit: 100, town: town.slug));
        var currentState = state;
        if (currentState is TownsLoadedState) {
          yield currentState.copyWith(userTown: town);
        }
      } catch (e) {
        var message = BlocFunctions.getErrorMessage(e);
        yield TownsErrorState(message: message);
      }
    }
  }
}
