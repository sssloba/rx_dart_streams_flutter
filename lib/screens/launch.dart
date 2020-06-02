import 'package:flutter/material.dart';
import 'package:rx_dart_streams_flutter/screens/read.dart';

class Launch extends StatefulWidget {
  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300.0,
          child: Column(children: <Widget>[
            Text('Shakespeare\'s Sonnets', style: TextStyle(fontSize: 26.0),),
            Text('Sonnet 64',  style: TextStyle(fontSize: 15.0),),
            SizedBox(height: 80.0),
            RaisedButton(
              color: Colors.red,
              child: Text('Engage',style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Read()));
              })
          ],
            
          ),
        ),
      ),
    );
  }
}