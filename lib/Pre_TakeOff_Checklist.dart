import 'package:flutter/material.dart';
import 'text_fields.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'emailNav.dart';
import 'loginNav.dart';
import 'main.dart';

var HeaderNineResults = ['incomplete', 'incomplete','incomplete', 'incomplete','incomplete', 'incomplete','incomplete', 'incomplete'];


class ScreenPreTakeOffChecklist extends StatefulWidget {
  @override
  _ScreenPreTakeOffChecklistState createState() => _ScreenPreTakeOffChecklistState();
}
class _ScreenPreTakeOffChecklistState extends State<ScreenPreTakeOffChecklist> {
  @override
  void _doSomething() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home(HeaderNineResults: HeaderNineResults)));
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          centerTitle: true,
          title: Text(
            'indrorobotics.ca',
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('1. Wind and Weather'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderNineResults[0],
                  onChanged: (value) {
                    setState(() {
                      HeaderNineResults[0] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderNineResults[0],
                  onChanged: (value) {
                    setState(() {
                      HeaderNineResults[0] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderNineResults[0] == 'yes' ? 'Good' : 'Within limits or NO GO'),

              SizedBox(height: 30),
              Text('2. Air Vehicle Batteries above 50%'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderNineResults[1],
                  onChanged: (value) {
                    setState(() {
                      HeaderNineResults[1] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderNineResults[1],
                  onChanged: (value) {
                    setState(() {
                      HeaderNineResults[1] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderNineResults[1] == 'yes' ? 'Good' : 'NO GO if <50%'),

              SizedBox(height: 30),
              Text('3. Hand Controller above 50%'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderNineResults[2],
                  onChanged: (value) {
                    setState(() {
                      HeaderNineResults[2] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderNineResults[2],
                  onChanged: (value) {
                    setState(() {
                      HeaderNineResults[2] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderNineResults[2] == 'yes' ? 'Good' : 'NO GO if <50%'),

              SizedBox(height: 30),
              Text('4. Ground Control Station'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderNineResults[3],
                  onChanged: (value) {
                    setState(() {
                      HeaderNineResults[3] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderNineResults[3],
                  onChanged: (value) {
                    setState(() {
                      HeaderNineResults[3] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderNineResults[3] == 'yes' ? 'Good' : 'State GCS software running'),

              SizedBox(height: 30),
              Text('5. Cameras'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderNineResults[4],
                  onChanged: (value) {
                    setState(() {
                      HeaderNineResults[4] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderNineResults[4],
                  onChanged: (value) {
                    setState(() {
                      HeaderNineResults[4] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderNineResults[4] == 'yes' ? 'Good' : 'NO GO if latency >1 second'),

              SizedBox(height: 30),
              Text('6. Take-Off Mode'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderNineResults[5],
                  onChanged: (value) {
                    setState(() {
                      HeaderNineResults[5] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderNineResults[5],
                  onChanged: (value) {
                    setState(() {
                      HeaderNineResults[5] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderNineResults[5] == 'yes' ? 'Good' : 'P-GPS'),

              SizedBox(height: 30),
              Text('7. Area and Air Traffic'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderNineResults[6],
                  onChanged: (value) {
                    setState(() {
                      HeaderNineResults[6] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderNineResults[6],
                  onChanged: (value) {
                    setState(() {
                      HeaderNineResults[6] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderNineResults[6] == 'yes' ? 'Good' : 'NO GO if area and air traffic not clear'),

              SizedBox(height: 30),
              Text('8. Cleared Take-Off'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderNineResults[7],
                  onChanged: (value) {
                    setState(() {
                      HeaderNineResults[7] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderNineResults[7],
                  onChanged: (value) {
                    setState(() {
                      HeaderNineResults[7] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderNineResults[7] == 'yes' ? 'Good' : 'Clear, Take OFF!'),

              SizedBox(height: 30),
              Padding(
                  padding: EdgeInsets.symmetric(vertical:60.0,horizontal: 100.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      //onPressed: ((result1 == 'yes' || result1=='no') && (result2 == 'yes'|| result2=='no'))? _doSomething : null,
                      onPressed: (HeaderNineResults[0] != 'incomplete' && HeaderNineResults[1] != 'incomplete'
                          && HeaderNineResults[2] != 'incomplete'
                          && HeaderNineResults[3] != 'incomplete'
                          && HeaderNineResults[4] != 'incomplete'
                          && HeaderNineResults[5] != 'incomplete'
                          && HeaderNineResults[6] != 'incomplete'
                          && HeaderNineResults[7] != 'incomplete')? _doSomething : null,
                      child: Text('Back To Home')))
            ],
          ),
        )
    );
  }
}


