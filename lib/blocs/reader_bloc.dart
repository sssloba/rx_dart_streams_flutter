import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

class ReaderBloc {
  final _dartStream = StreamController<String>();
  final _publishStream = PublishSubject<String>();
  final _behaviorStream = BehaviorSubject<String>();
  final _replayStream = ReplaySubject<String>(maxSize: 4);

  //Get
  Stream<String> get dartStream => _dartStream.stream.asBroadcastStream();
  Stream<String> get publishStream => _publishStream.stream;
  Stream<String> get behaviorStream => _behaviorStream.stream;
  Stream<String> get replayStream => _replayStream.stream.map((l) => _replayStream.values.join("\n"));

  startReading() async {
    //     var file = await rootBundle.loadString('assets/sonent.txt');
    //     print(file);

    File('E:/flutter/rx_dart_streams_flutter/assets/sonnet.txt').readAsString().then((String contents) => print(contents));
    
    var contents =  await File('E:/flutter/rx_dart_streams_flutter/assets/sonnet.txt')
    .openRead()
    .transform(utf8.decoder)
    .transform(LineSplitter())
    .toList();

    for (String l in contents) {
      print(l);

      //Add line  to Streams
      _dartStream.sink.add(l);
      _publishStream.add(l);
      _behaviorStream.add(l);
      _replayStream.add(l);



      await Future.delayed(Duration(seconds:1));
    }

  }

  dispose() {
    _dartStream.close();
    _publishStream.close();
    _behaviorStream.close();
    _replayStream.close();
  }

}