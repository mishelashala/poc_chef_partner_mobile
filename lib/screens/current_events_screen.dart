import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chef_admin_mobile/bloc/current_events/index.dart';
import 'package:poc_chef_admin_mobile/models/event.dart';
import 'package:poc_chef_admin_mobile/models/order.dart';

class CurrentEventsScreen extends StatefulWidget {
  @override
  _CurrentEventsScreen createState() => _CurrentEventsScreen();
}

class _CurrentEventsScreen extends State<CurrentEventsScreen> {
  void initState() {
    super.initState();
    currentEventsBloc.fetchCurrentEvents();
  }

  @override
  Widget build(BuildContext _) {
    return BlocBuilder(
      bloc: currentEventsBloc,
      builder: (BuildContext context, CurrentEventsState state) {
        return Scaffold(
            appBar: AppBar(title: Text('Current Events')),
            body: SafeArea(
                child: state.loading
                    ? Center(child: Text('Loading...'))
                    : ListView(
                        children: state.data.map<Card>((Event event) {
                        return Card(
                          child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(children: <Widget>[
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      event.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                Divider(),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(_formatDate(event.eventDate))),
                                Divider(),
                                OrdersTableHeader(),
                                OrdersTableBody(orders: event.orders),
                              ])),
                        );
                      }).toList())));
      },
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString()}/${date.month.toString().padLeft(2, "0")}/${date.year.toString()}';
  }
}

class OrdersTableHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(children: [
      TableRow(children: [
        Text('Tortas',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        Text('Price', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Units', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Amount', style: TextStyle(fontWeight: FontWeight.bold)),
      ]),
      TableRow(children: [
        Divider(),
        Divider(),
        Divider(),
        Divider(),
      ]),
    ]);
  }
}

class OrdersTableBody extends StatelessWidget {
  final List<Order> orders;

  OrdersTableBody({this.orders});

  @override
  Widget build(BuildContext context) {
    if (orders.length == 0) {
      return Text('No orders yet');
    }

    return Table(
        children: orders.map((Order order) {
      return TableRow(children: [
        Text('${order.productName}'),
        Text('\$${order.price}'),
        Text('${order.units}'),
        Text('\$${order.units}'),
      ]);
    }).toList());
  }
}
