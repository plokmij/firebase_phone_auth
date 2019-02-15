import 'package:flutter/material.dart';

class PhoneNumberEntry extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify your phone number'),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: <Widget>[
          textPart(),
          phoneField(),
          Spacer(
            flex: 1,
          ),
          button(),
        ],
      ),
    );
  }

  Widget textPart() {
    return Center(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(25.0),
        child: Text(
          'We will send a SMS message to verify your phone number. Enter your phone number',
          style: TextStyle(fontSize: 17.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget phoneField() {
    return Container(
      padding: EdgeInsets.only(left: 55.0, right: 55.0),
      child: TextField(
        onChanged: null,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Phone number',
          labelText: 'Phone number',
        ),
      ),
    );
  }

  Widget button() {
    return Container(
      padding: EdgeInsets.only(top: 45.0, bottom: 25.0),
      child: RaisedButton(
        child: Text('NEXT'),
        onPressed: null,
      ),
    );
  }
}