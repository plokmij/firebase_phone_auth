import 'package:flutter/material.dart';
import 'screens/phone_number_entry.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: PhoneNumberEntry(),
    );
  }
}