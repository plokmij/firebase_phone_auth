import 'dart:async';

class Validators {
  final validatePhoneNumber = StreamTransformer<String, String>
  .fromHandlers(
    handleData: (phoneNo, sink){
      if(phoneNo.length == 10) {
        sink.add(phoneNo);
      } else {
        sink.addError('Invalid Number');
      }
    },
  );
}