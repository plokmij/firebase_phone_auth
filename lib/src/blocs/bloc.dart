import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators {
  final _phoneNumber = BehaviorSubject<String>();
  String validPhone;
  Stream<String> get phoneNumber => _phoneNumber.stream.transform(validatePhoneNumber);
  //changePhoneNumber = change in phonenumber textfield :)
  Function(String) get changePhoneNumber => _phoneNumber.sink.add;

  submit() {
   validPhone = _phoneNumber.value; 
  }

  dispose(){
    _phoneNumber.close();
  }
}