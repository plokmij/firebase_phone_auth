import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Bloc extends Object with Validators {
  final _phoneNumber = BehaviorSubject<String>();
  String validPhone;
  String verificationId;
  String smsCode;

  Stream<String> get phoneNumber =>
      _phoneNumber.stream.transform(validatePhoneNumber);
  //changePhoneNumber = change in phonenumber textfield :)
  Function(String) get changePhoneNumber => _phoneNumber.sink.add;

  submit() {
    validPhone = '+91' + _phoneNumber.value;
  }

  dispose() {
    _phoneNumber.close();
  }

  Future<void> verifyPhone() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verificationId = verId;
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      print('???');
    };

    final PhoneVerificationFailed verificationFailed = (AuthException e) {
      print('${e.message}');
    };

    final PhoneVerificationCompleted verificationSuccess = (FirebaseUser user) {
      print('Verified');
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: validPhone,
      codeAutoRetrievalTimeout: autoRetrieve,
      codeSent: smsCodeSent,
      timeout: const Duration(seconds: 5),
      verificationCompleted: verificationSuccess,
      verificationFailed: verificationFailed,
    );
  }

  bool signIn() {
    bool signedIn = false;
    FirebaseAuth.instance
        .signInWithPhoneNumber(verificationId: verificationId, smsCode: smsCode)
        .then((user) {
          print(user);
          signedIn = true;
        })
        .catchError((e) {
      print('MHDP');
      print(e);
    });
    return signedIn;
  }
}
