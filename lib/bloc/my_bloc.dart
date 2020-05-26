import 'dart:async';
import 'package:naijagospel/bloc_provider/bloc_provider.dart';

class MyBloc implements BlocBase {
  int _counter;

  // strem to handle the counter
  StreamController<int> _counterController = StreamController<int>();
  Sink<int> get _inAdd => _counterController.sink;
  Stream<int> get outCounter => _counterController.stream;
  MyBloc() {
    _counter = 0;
    // _counterController.stream.listen(onData);
  }
  onData(int a) {
    _counter = _counter + 1;
    _inAdd.add(_counter);
  }

  void increment() {
    _counter = _counter + 1;
    _inAdd.add(_counter);
  }

  @override
  void dispose() {
    _counterController.close();
  }
}
