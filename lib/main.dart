import 'package:flutter/material.dart';
void main() => runApp(MyApp());
/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Navigate to a new screen on Button click'),
          backgroundColor: Colors.teal),
      body: Center(
        child: FlatButton(
          color: Colors.teal,
          textColor: Colors.white,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Screen2()));
          },
          child: Text('GO TO SCREEN 2'),
        ),
      ),
    );
  }
}
class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}
class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Navigate to a new screen on Button click'),
          backgroundColor: Colors.blueAccent),
      body: Center(
        child: FlatButton(
          color: Colors.blueAccent,
          textColor: Colors.white,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
          },
          child: Text('GO TO HOME'),
        ),
      ),
    );
  }
}