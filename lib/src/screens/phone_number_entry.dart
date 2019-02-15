import 'package:flutter/material.dart';
import 'verification_screen.dart';
import '../blocs/provider.dart';
import '../blocs/bloc.dart';

class PhoneNumberEntry extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify your phone number'),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: <Widget>[
          textPart(),
          phoneField(bloc),
          Spacer(),
          button(bloc),
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

  Widget phoneField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.phoneNumber,
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.only(left: 55.0, right: 55.0),
          child: TextField(
            onChanged: bloc.changePhoneNumber,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Phone number',
              labelText: 'Phone number',
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }

  Widget button(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.phoneNumber,
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.only(top: 45.0, bottom: 25.0),
          child: RaisedButton(
            textColor: Colors.white,
            color: Colors.black,
            child: Text('NEXT'),
            onPressed: snapshot.hasError
                ? null
                : () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => phoneVerification(),
                        ));
                    bloc.submit();
                    bloc.verifyPhone();
                  },
          ),
        );
      },
    );
  }
}
