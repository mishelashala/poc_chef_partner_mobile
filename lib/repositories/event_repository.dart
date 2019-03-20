import 'dart:async';
import 'package:poc_chef_admin_mobile/models/event.dart';

class EventRepository {
  Future<List<Event>> getCurrentEvents() {
    return Future.value([
      new Event(name: 'Tortas for the office'),
      new Event(name: 'Enchiladas for the office'),
      new Event(name: 'Lunch for the office'),
    ]);
  }
}
