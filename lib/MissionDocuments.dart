import 'package:flutter/material.dart';
import 'main.dart';

var HeaderFourResults = ['incomplete', 'incomplete','incomplete', 'incomplete','incomplete', 'incomplete','incomplete',
  'incomplete','incomplete','incomplete'];


class ScreenMissionDocuments extends StatefulWidget {
  @override
  _ScreenMissionDocumentsState createState() => _ScreenMissionDocumentsState();
}
class _ScreenMissionDocumentsState extends State<ScreenMissionDocuments> {
  @override
  void _doSomething() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home(HeaderFourResults: HeaderFourResults)));
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
              Text('1. Canada Flight Supplement and VTA/VNC charts (can be digital)'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFourResults[0],
                  onChanged: (value) {
                    setState(() {
                      HeaderFourResults[0] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFourResults[0],
                  onChanged: (value) {
                    setState(() {
                      HeaderFourResults[0] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFourResults[0] == 'yes' ? 'Good' : 'Please bring supplement and VTA/VNC charts'),

              SizedBox(height: 30),
              Text('2. Company Operations Manual'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFourResults[1],
                  onChanged: (value) {
                    setState(() {
                      HeaderFourResults[1] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFourResults[1],
                  onChanged: (value) {
                    setState(() {
                      HeaderFourResults[1] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFourResults[1] == 'yes' ? 'Good' : 'Please have company operations manual'),

              SizedBox(height: 30),
              Text('3. RPAS Flight Manual'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFourResults[2],
                  onChanged: (value) {
                    setState(() {
                      HeaderFourResults[2] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFourResults[2],
                  onChanged: (value) {
                    setState(() {
                      HeaderFourResults[2] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFourResults[1] == 'yes' ? 'Good' : 'Please get RPAS Flight Manual'),


              SizedBox(height: 30),
              Text('4. Notices to Airmen (NOTAMS) via NavDrone'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFourResults[3],
                  onChanged: (value) {
                    setState(() {
                      HeaderFourResults[3] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFourResults[3],
                  onChanged: (value) {
                    setState(() {
                      HeaderFourResults[3] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFourResults[3] == 'yes' ? 'Good' : 'Please notify'),


              SizedBox(height: 30),
              Text('5. METARs'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFourResults[4],
                  onChanged: (value) {
                    setState(() {
                      HeaderFourResults[4] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFourResults[4],
                  onChanged: (value) {
                    setState(() {
                      HeaderFourResults[4] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFourResults[4] == 'yes' ? 'Good' : 'Need'),


              SizedBox(height: 30),
              Text('6. Proof of insurance (policy number)'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFourResults[5],
                  onChanged: (value) {
                    setState(() {
                      HeaderFourResults[5] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFourResults[5],
                  onChanged: (value) {
                    setState(() {
                      HeaderFourResults[5] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFourResults[5] == 'yes' ? 'Good' : 'Please get IN'),

              SizedBox(height: 30),
              Text('7. SFOC'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFourResults[6],
                  onChanged: (value) {
                    setState(() {
                      HeaderFourResults[6] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFourResults[6],
                  onChanged: (value) {
                    setState(() {
                      HeaderFourResults[6] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFourResults[6] == 'yes' ? 'Good' : 'Need SFOC'),

              SizedBox(height: 30),
              Text('8. SFOC Application'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFourResults[7],
                  onChanged: (value) {
                    setState(() {
                      HeaderFourResults[7] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFourResults[7],
                  onChanged: (value) {
                    setState(() {
                      HeaderFourResults[7] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFourResults[7] == 'yes' ? 'Good' : 'Need SFOC Application'),

              SizedBox(height: 30),
              Text('9. NavCan airspace approval and ATC approval if required'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFourResults[8],
                  onChanged: (value) {
                    setState(() {
                      HeaderFourResults[8] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFourResults[8],
                  onChanged: (value) {
                    setState(() {
                      HeaderFourResults[8] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFourResults[8] == 'yes' ? 'Good' : 'Need approval'),

              SizedBox(height: 30),
              Text('10. InDro operational clearance'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFourResults[9],
                  onChanged: (value) {
                    setState(() {
                      HeaderFourResults[9] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFourResults[9],
                  onChanged: (value) {
                    setState(() {
                      HeaderFourResults[9] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFourResults[9] == 'yes' ? 'Good' : 'Clearance required'),

              SizedBox(height: 30),
              Padding(
                  padding: EdgeInsets.symmetric(vertical:60.0,horizontal: 100.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      //onPressed: ((HeaderTwoResults[1] == 'yes' || result3 == 'no') && (result4 == 'yes' || result4 == 'no'))? _doSomething : null,
                      onPressed: (HeaderFourResults[0] != 'incomplete' && HeaderFourResults[1] != 'incomplete'
                          && HeaderFourResults[2] != 'incomplete'
                          && HeaderFourResults[3] != 'incomplete'
                          && HeaderFourResults[4] != 'incomplete'
                          && HeaderFourResults[5] != 'incomplete'
                          && HeaderFourResults[6] != 'incomplete'
                          && HeaderFourResults[7] != 'incomplete'
                          && HeaderFourResults[8] != 'incomplete'
                          && HeaderFourResults[9] != 'incomplete'
                      )? _doSomething : null,
                      child: Text('Back To Home')))
            ],
          ),
        )
    );
  }
}



