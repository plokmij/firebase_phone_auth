import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators {
  final _phoneNumber = BehaviorSubject<String>();
  String validPhone;
  Stream<String> get phoneNumber => _phoneNumber.stream.transform(validatePhoneNumber);
  //changePhoneNumber = change in phonenumber textfield :)
  Function get changePhoneNumber => _phoneNumber.sink.add;

  dispose(){
    _phoneNumber.close();
  }
}