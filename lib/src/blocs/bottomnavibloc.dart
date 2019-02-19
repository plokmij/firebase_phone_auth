import 'dart:async';
import 'package:rxdart/rxdart.dart';

class NaviBloc extends Object {

  final _currentIndex = BehaviorSubject<int>();

  Stream<int> get currentIndex => _currentIndex.stream;

  Function(int) get changeIndex => _currentIndex.sink.add;

  getCurrenIndex() {
    return _currentIndex.value;
  }

  setCurrentIndex(int index) {
    print("Hell hell");
    _currentIndex.sink.add(index);
  }
  dispose() {
    _currentIndex.close();
  }
}