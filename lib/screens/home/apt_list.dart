import 'package:syndik_app/models/apt.dart';
import 'package:syndik_app/screens/home/apt_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AptList extends StatefulWidget {
  @override
  _AptListState createState() => _AptListState();
}

class _AptListState extends State<AptList> {
  @override
  Widget build(BuildContext context) {

    final apts = Provider.of<List<Apt>>(context) ?? [];

    return ListView.builder(
      itemCount: apts.length,
      itemBuilder: (context, index) {
        return AptTile(apt: apts[index]);
      },
    );
  }
}