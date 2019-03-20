import 'dart:async';
import 'package:poc_chef_admin_mobile/models/event.dart';
import 'package:poc_chef_admin_mobile/models/order.dart';

class EventRepository {
  List<Event> events = [
    Event(name: 'Tortas for the office', eventDate: DateTime.now(), orders: [
      Order(productName: 'Poc Chuc', units: 10, price: 10, total: '100'),
      Order(productName: 'Camaron', units: 10, price: 15, total: '150'),
    ]),
    Event(
        name: 'Enchiladas for the office',
        eventDate: DateTime.now(),
        orders: [
          Order(productName: 'Poc Chuc', units: 10, price: 10, total: '100')
        ]),
    Event(name: 'Lunch for the office', eventDate: DateTime.now(), orders: []),
  ];

  Future<List<Event>> getCurrentEvents() {
    return Future.value(events);
  }
}
