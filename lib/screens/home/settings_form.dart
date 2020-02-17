import 'package:syndik_app/models/user.dart';
import 'package:syndik_app/services/database.dart';
import 'package:syndik_app/shared/constants.dart';
import 'package:syndik_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> buildings = ['0', '1', '2', '3', '4'];
  final List<int> number = [100, 200, 300, 400, 500, 600, 700, 800, 900];

  // form values
  String _currentName;
  String _currentBuilding;
  int _currentNumber;

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update a user appartement',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration,
                    validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(height: 10.0),
                  DropdownButtonFormField(
                    value: _currentBuilding ?? userData.building,
                    decoration: textInputDecoration,
                    items: buildings.map((building) {
                      return DropdownMenuItem(
                        value: building,
                        child: Text('$building'),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _currentBuilding = val ),
                  ),
                  SizedBox(height: 10.0),
                  DropdownButtonFormField(
                    value: _currentNumber ?? userData.number,
                    decoration: textInputDecoration,
                    items: number.map((number) {
                      return DropdownMenuItem(
                        value: number,
                        child: Text('$number'),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _currentNumber = val ),
                  ),

                  RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if(_formKey.currentState.validate()){
                          await DatabaseService(uid: user.uid).updateUserData(
                              _currentBuilding ?? snapshot.data.building,
                              _currentName ?? snapshot.data.name,
                              _currentNumber ?? snapshot.data.number,
                          );
                          Navigator.pop(context);
                        }
                      }
                  ),
                ],
              ),
            );
          } else {
            return Loading();
          }
        }
    );
  }
}