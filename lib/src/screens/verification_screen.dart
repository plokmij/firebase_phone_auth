import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';
import 'phone_number_entry.dart';

class phoneVerification extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verify ${bloc.validPhone}',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: <Widget>[textPart(bloc), pinEntryField(bloc, context)],
      ),
    );
  }

  Widget textPart(Bloc bloc) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(25.0),
            child: Text(
              'We have sent a SMS with a code +91${bloc.validPhone}',
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

  Widget pinEntryField(Bloc bloc, BuildContext context) {
    return PinEntryTextField(
      fields: 6,
      onSubmit: (String pin) {
        bloc.smsCode = pin;
        if (true) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhoneNumberEntry(),
              ));
        }
      },
    );
  }
}
