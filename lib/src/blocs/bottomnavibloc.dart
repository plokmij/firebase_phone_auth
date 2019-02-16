import 'dart:async';

class NaviBloc extends Object {
  final _currentIndex = StreamController<int>.broadcast();

  Stream<int> get currentIndex => _currentIndex.stream;

  Function(int) get changeIndex => _currentIndex.sink.add;

  dispose() {
    _currentIndex.close();
  }
}