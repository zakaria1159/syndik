import 'package:syndik_app/models/apt.dart';
import 'package:flutter/material.dart';

class AptTile extends StatelessWidget {

  final Apt apt;
  AptTile({ this.apt });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[apt.number],
        //    backgroundImage: AssetImage('assets/coffee_icon.png'),
          ),
          title: Text(apt.building),
          subtitle: Text('Numero ${apt.number}'),
        ),
      ),
    );
  }
}