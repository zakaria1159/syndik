import 'package:syndik_app/screens/wrapper.dart';
import 'package:syndik_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syndik_app/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
          theme: ThemeData(
            // Define the default brightness and colors.
            brightness: Brightness.light,
            primaryColor: Colors.amber,
            accentColor: Colors.greenAccent,
            backgroundColor: Colors.amberAccent,
            scaffoldBackgroundColor : Colors.amberAccent,
            buttonColor : Colors.cyan,

            // Define the default font family.
            fontFamily: 'Calibri',

            // Define the default TextTheme. Use this to specify the default
            // text styling for headlines, titles, bodies of text, and more.
            textTheme: TextTheme(
              headline5: TextStyle(fontSize: 62.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Calibri'),

            ),
          ),
        home: Wrapper(),
      ),
    );
  }
}