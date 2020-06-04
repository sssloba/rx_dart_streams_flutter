import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rx_dart_streams_flutter/screens/launch.dart';
import 'package:rx_dart_streams_flutter/blocs/reader_bloc.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ReaderBloc(),
        child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Launch(),
      ),
    );
  }
}
