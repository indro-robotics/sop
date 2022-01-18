import 'package:flutter/material.dart';
import 'text_fields.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'emailNav.dart';
import 'loginNav.dart';
import 'main.dart';

var result1;
var result2;
var HeaderOneResults = ['incomplete', 'incomplete','incomplete', 'incomplete','incomplete', 'incomplete','incomplete', 'incomplete','incomplete'];

//var Header2Elements = new List();

class ScreenPackUpFlow extends StatefulWidget {
  @override
  _ScreenPackUpFlowState createState() => _ScreenPackUpFlowState();
}
class _ScreenPackUpFlowState extends State<ScreenPackUpFlow> {
  @override
  void _doSomething() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home(HeaderOneResults: HeaderOneResults)));
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
        body: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('1. Mission maps downloaded onto ground station if required'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderOneResults[0],
                  onChanged: (value) {
                    setState(() {
                      result1 = value;
                      HeaderOneResults[0] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderOneResults[0],
                  onChanged: (value) {
                    setState(() {
                      result1 = value;
                      HeaderOneResults[0] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderOneResults[0] == 'yes' ? 'Good' : 'Please get the map downloaded'),

              SizedBox(height: 30),
              Text('2. Ground Control Station fully charged with latest version'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderOneResults[1],
                  onChanged: (value) {
                    setState(() {
                      result2 = value;
                      HeaderOneResults[1] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderOneResults[1],
                  onChanged: (value) {
                    setState(() {
                      result2 = value;
                      HeaderOneResults[1] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderOneResults[1] == 'yes' ? 'Good' : 'Please charge ground control station with latest version'),

              SizedBox(height: 30),
              Text('3. Hand controller fully charged'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderOneResults[2],
                  onChanged: (value) {
                    setState(() {
                      result2 = value;
                      HeaderOneResults[2] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderOneResults[2],
                  onChanged: (value) {
                    setState(() {
                      result2 = value;
                      HeaderOneResults[2] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderOneResults[2] == 'yes' ? 'Good' : 'Please charge'),

              SizedBox(height: 30),
              Text('4. Back Up hand controller fully charged and linked to RPA if required'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderOneResults[3],
                  onChanged: (value) {
                    setState(() {
                      result2 = value;
                      HeaderOneResults[3] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderOneResults[3],
                  onChanged: (value) {
                    setState(() {
                      result2 = value;
                      HeaderOneResults[3] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderOneResults[3] == 'yes' ? 'Good' : 'Please charge back up'),

              SizedBox(height: 30),
              Text('5. Memory cards empty and ready to be formatted'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderOneResults[4],
                  onChanged: (value) {
                    setState(() {
                      result2 = value;
                      HeaderOneResults[4] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderOneResults[4],
                  onChanged: (value) {
                    setState(() {
                      result2 = value;
                      HeaderOneResults[4] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderOneResults[4] == 'yes' ? 'Good' : 'Please get memory cards formatted'),

              SizedBox(height: 30),
              Text('6. RPAS securely stored in case'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderOneResults[5],
                  onChanged: (value) {
                    setState(() {
                      result2 = value;
                      HeaderOneResults[5] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderOneResults[5],
                  onChanged: (value) {
                    setState(() {
                      result2 = value;
                      HeaderOneResults[5] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderOneResults[5] == 'yes' ? 'Good' : 'Please store RPAS'),

              SizedBox(height: 30),
              Text('7. Spare blades'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderOneResults[6],
                  onChanged: (value) {
                    setState(() {
                      result2 = value;
                      HeaderOneResults[6] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderOneResults[6],
                  onChanged: (value) {
                    setState(() {
                      result2 = value;
                      HeaderOneResults[6] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderOneResults[6] == 'yes' ? 'Good' : 'Please carry spare blades'),

              SizedBox(height: 30),
              Text('8. Sufficient batteries charged with latest firmware'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderOneResults[7],
                  onChanged: (value) {
                    setState(() {
                      result2 = value;
                      HeaderOneResults[7] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderOneResults[7],
                  onChanged: (value) {
                    setState(() {
                      result2 = value;
                      HeaderOneResults[7] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderOneResults[7] == 'yes' ? 'Good' : 'please charge'),

              SizedBox(height: 30),
              Text('9. Battery charger with cables and LiPo bags if in transpor'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderOneResults[8],
                  onChanged: (value) {
                    setState(() {
                      result2 = value;
                      HeaderOneResults[8] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderOneResults[8],
                  onChanged: (value) {
                    setState(() {
                      result2 = value;
                      HeaderOneResults[8] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderOneResults[8] == 'yes' ? 'Good' : 'please equip'),

              SizedBox(height: 30),
              Padding(
                  padding: EdgeInsets.symmetric(vertical:60.0,horizontal: 100.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      //onPressed: ((result1 == 'yes' || result1=='no') && (result2 == 'yes'|| result2=='no'))? _doSomething : null,
                      onPressed: (HeaderOneResults[0] != 'incomplete' && HeaderOneResults[1] != 'incomplete'
                          && HeaderOneResults[2] != 'incomplete'
                          && HeaderOneResults[3] != 'incomplete'
                          && HeaderOneResults[4] != 'incomplete'
                          && HeaderOneResults[5] != 'incomplete'
                          && HeaderOneResults[6] != 'incomplete'
                          && HeaderOneResults[7] != 'incomplete'
                          && HeaderOneResults[8] != 'incomplete')? _doSomething : null,
                      child: Text('Back To Home')))
            ],
          ),
        )
    );
  }
}