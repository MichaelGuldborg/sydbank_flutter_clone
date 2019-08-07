import 'package:sydbank_flutter_clone/pages/home_page.dart';
import 'package:sydbank_flutter_clone/pages/login_page.dart';
import 'package:sydbank_flutter_clone/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

// TODO WRAP IN STATE PROVIDER
// BLOC ? INHERITED WIDGET ?
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
