import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:poc_chef_admin_mobile/repositories/event_repository.dart';
import './current_events_event.dart';
import './current_events_type.dart';
import './current_events_state.dart';

class CurrentEventsBloc extends Bloc<CurrentEventsEvent, CurrentEventsState> {
  final EventRepository eventRepository;

  CurrentEventsBloc({@required this.eventRepository});

  @override
  CurrentEventsState get initialState =>
      CurrentEventsState(error: false, data: [], loading: false);

  void fetchCurrentEvents() {
    dispatch(CurrentEventsEvent(type: CurrentEventsType.FETCH_ALL_SART));
  }

  @override
  Stream<CurrentEventsState> mapEventToState(
      CurrentEventsState currentState, CurrentEventsEvent event) async* {
    switch (event.type) {
      case CurrentEventsType.FETCH_ALL_SART:
        yield* _fetchAllCurrentTodos(currentState, event);
        break;
    }
  }

  /// Sets the status to loading
  /// If events load successfully it sets status to loaded
  /// Else sets the status to fail
  Stream<CurrentEventsState> _fetchAllCurrentTodos(
      CurrentEventsState currentState, CurrentEventsEvent event) async* {
    yield CurrentEventsState(error: null, data: null, loading: false);
    var currentEvents = await eventRepository.getCurrentEvents();
    yield CurrentEventsState(loading: false, error: null, data: currentEvents);
  }
}

final currentEventsBloc = CurrentEventsBloc(eventRepository: EventRepository());
