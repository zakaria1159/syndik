import 'package:syndik_app/models/user.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {

  final UserData user;
  UserTile({ this.user });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text(user.name),
          subtitle: Text('Building:  ${user.building}'),
        ),
      ),
    );
  }
}