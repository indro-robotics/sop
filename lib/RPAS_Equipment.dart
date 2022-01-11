import 'package:flutter/material.dart';
import 'text_fields.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'emailNav.dart';
import 'loginNav.dart';
import 'main.dart';

var result1;
var result2;

class ScreenPackUpFlow extends StatefulWidget {
  @override
  _ScreenPackUpFlowState createState() => _ScreenPackUpFlowState();
}
class _ScreenPackUpFlowState extends State<ScreenPackUpFlow> {
  @override
  void _doSomething() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home(result1: result1, result2 : result2)));
  }
  //var _result;
  //var _result2;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          centerTitle: true,
          title: Text(
            'indrorobotics.ca',
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('1. Mission maps downloaded onto ground station if required'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: result1,
                  onChanged: (value) {
                    setState(() {
                      result1 = value;
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: result1,
                  onChanged: (value) {
                    setState(() {
                      result1 = value;
                    });
                  }),
              SizedBox(height: 5),
              Text(result1 == 'yes' ? 'Good' : 'Please get the map downloaded'),

              SizedBox(height: 30),
              Text('2. RPAS securely stored in case'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: result2,
                  onChanged: (value) {
                    setState(() {
                      result2 = value;
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: result2,
                  onChanged: (value) {
                    setState(() {
                      result2 = value;
                    });
                  }),
              SizedBox(height: 5),
              Text(result2 == 'yes' ? 'Good' : 'Please securely store your RPAS in case'),

              SizedBox(height: 30),
              Padding(
                  padding: EdgeInsets.symmetric(vertical:60.0,horizontal: 100.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      onPressed: ((result1 == 'yes' || result1=='no') && (result2 == 'yes'|| result2=='no'))? _doSomething : null,
                      child: Text('Back To Home')))
            ],
          ),
        )
    );
  }
}