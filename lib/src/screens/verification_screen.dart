import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';
import 'newscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class phoneVerification extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verify ${bloc.validPhone}',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: <Widget>[textPart(bloc), pinEntryField(bloc)],
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
              'We have sent a SMS with a code ${bloc.validPhone}',
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

  Widget pinEntryField(Bloc bloc) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return PinEntryTextField(
          fieldWidth: 36.0,
          fontSize: 18.0,
          fields: 6,
          onSubmit: (String pin) {
            bloc.smsCode = pin;
            bloc.signIn().then((result) {
              if (result &&
                  snapshot.hasData &&
                  snapshot.data.providerData.length == 1) {
                print(snapshot.data);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
              } else if (!result) {
                print('Sign in failed');
              }
            });
          },
        );
      },
    );
  }
}
