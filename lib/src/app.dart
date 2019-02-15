import 'package:flutter/material.dart';
import 'screens/phone_number_entry.dart';
import 'screens/newscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'blocs/bloc.dart';
import 'dart:async';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: _getLandingPage(),
    );
  }
}

Widget _getLandingPage() {
  return StreamBuilder<FirebaseUser>(
    stream: FirebaseAuth.instance.onAuthStateChanged,
    builder: (BuildContext context, AsyncSnapshot snapshot){
      if(snapshot.hasData && snapshot.data.providerData.length == 1){
        return Home();
      }
      else{
        return PhoneNumberEntry();
      }
    },
  );
}