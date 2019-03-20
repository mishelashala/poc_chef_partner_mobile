import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chef_admin_mobile/bloc/current_events/index.dart';
import 'package:poc_chef_admin_mobile/models/event.dart';

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
            appBar: AppBar(title: Text('Poc Chef')),
            body: SafeArea(
                child: state.loading
                    ? Center(child: Text('Loading...'))
                    : ListView(
                        children: state.data.map<Widget>((Event event) {
                        return Card(
                          child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(event.name)),
                        );
                      }).toList())));
      },
    );
  }
}
