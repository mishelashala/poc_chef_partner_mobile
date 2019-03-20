import 'order.dart';

class Event {
  String name;
  DateTime eventDate;
  List<Order> orders;
  String total;

  Event({this.name, this.eventDate, this.orders, this.total});
}
