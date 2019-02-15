import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

class phoneVerification extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Yo-No-Here'),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: <Widget>[textPart(), pinEntryField()],
      ),
    );
  }

  Widget textPart() {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(25.0),
            child: Text(
              'We have sent a SMS with a code +91-Number Here-',
              style: TextStyle(
                fontSize: 17.0,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  Widget pinEntryField() {
    return PinEntryTextField(
      fields: 4,
      onSubmit: (String pin){
        print(pin);
      },
    );
  }
}