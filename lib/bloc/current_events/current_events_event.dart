import './current_events_type.dart';

class CurrentEventsEvent {
  CurrentEventsEvent({this.type, this.error = false, this.payload});

  CurrentEventsType type;
  dynamic payload;
  bool error;
}
