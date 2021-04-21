import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:watumira/data/models/collectors.dart';
import 'package:watumira/data/repositories/user/user_repository.dart';

part 'collectors_event.dart';
part 'collectors_state.dart';

class CollectorsBloc extends Bloc<CollectorsEvent, CollectorsState> {
  final UserRepository userRepository;
  CollectorsBloc({@required this.userRepository}) : super(CollectorsInitial());

  @override
  Stream<CollectorsState> mapEventToState(
    CollectorsEvent event,
  ) async* {
    if (event is GetMyCollectors) {
      try {
        var collectors = await userRepository.getCollectors();
        yield CollectorsLoadedState(collectors: collectors);
      } catch (e) {
        yield CollectorsErrorState(message: e.message);
      }
    }

    if (event is AddCollector) {
      try {
        await userRepository.addCollector(name: event.name, phoneNumber: event.phoneNumber);
        var collectors = await userRepository.getCollectors();
        yield CollectorsLoadedState(collectors: collectors);
      } catch (e) {
        yield CollectorsErrorState(message: e.message);
      }
    }

    if (event is DeleteCollector) {
      try {
        await userRepository.deleteCollector(event.id);
        var collectors = await userRepository.getCollectors();
        yield CollectorsLoadedState(collectors: collectors);
      } catch (e) {
        yield CollectorsErrorState(message: e.message);
      }
    }
  }
}
