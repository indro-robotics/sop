import 'package:flutter/material.dart';
import 'main.dart';

var HeaderFiveResults = ['incomplete', 'incomplete','incomplete', 'incomplete','incomplete', 'incomplete','incomplete',
  'incomplete','incomplete','incomplete','incomplete','incomplete','incomplete','incomplete'];

class ScreenPreFlightBriefing extends StatefulWidget {
  @override
  _ScreenPreFlightBriefingState createState() => _ScreenPreFlightBriefingState();
}
class _ScreenPreFlightBriefingState extends State<ScreenPreFlightBriefing> {
  @override
  void _doSomething() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home(HeaderFiveResults: HeaderFiveResults)));
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
              Text('1. Confirm location suitable for operation'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFiveResults[0],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[0] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFiveResults[0],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[0] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFiveResults[0] == 'yes' ? 'Good' : 'Please find suitable location'),

              SizedBox(height: 30),
              Text('2. Done PPE as required'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFiveResults[1],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[1] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFiveResults[1],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[1] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFiveResults[1] == 'yes' ? 'Good' : 'Please complete PPE'),

              SizedBox(height: 30),
              Text('3. Site survey (secure take-off/landing area, selecting GCS site and check for obstacles)'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFiveResults[2],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[2] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFiveResults[2],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[2] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFiveResults[1] == 'yes' ? 'Good' : 'Please complete site survey'),


              SizedBox(height: 30),
              Text('4. Secure area to ensure no public access'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFiveResults[3],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[3] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFiveResults[3],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[3] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFiveResults[3] == 'yes' ? 'Good' : 'Please secure area'),


              SizedBox(height: 30),
              Text('5. Lay out cones and take-off pad'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFiveResults[4],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[4] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFiveResults[4],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[4] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFiveResults[4] == 'yes' ? 'Good' : 'Please set up take off equipment'),


              SizedBox(height: 30),
              Text('6. Fire extinguisher(s) and first aid kit in an easily accessible location'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFiveResults[5],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[5] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFiveResults[5],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[5] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFiveResults[5] == 'yes' ? 'Good' : 'Please have fire extinguisher(s) and first aid kit'),

              SizedBox(height: 30),
              Text('7. Notification of nearby property owners of mission intentions if required'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFiveResults[6],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[6] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFiveResults[6],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[6] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFiveResults[6] == 'yes' ? 'Good' : 'Please notify nearby property owners'),

              SizedBox(height: 30),
              Text('8. Share mission plans via NavDrone app'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFiveResults[7],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[7] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFiveResults[7],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[7] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFiveResults[7] == 'yes' ? 'Good' : 'Please share mission plans'),

              SizedBox(height: 30),
              Text('9. Wind direction, speed, temp, visibility, cloud ceiling, humidity and pressure and kp-index within limits'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFiveResults[8],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[8] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFiveResults[8],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[8] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFiveResults[8] == 'yes' ? 'Good' : 'Review the weather elements'),

              SizedBox(height: 30),
              Text('10. Review mission objectives and flight plan with crew'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFiveResults[9],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[9] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFiveResults[9],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[9] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFiveResults[6] == 'yes' ? 'Good' : 'Please review with crew'),

              SizedBox(height: 30),
              Text('11. Identify safety egress routes and alternate landing site'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFiveResults[10],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[10] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFiveResults[10],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[10] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFiveResults[10] == 'yes' ? 'Good' : 'please know the safety routs'),

              SizedBox(height: 30),
              Text('12. Emergency numbers'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFiveResults[11],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[11] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFiveResults[11],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[11] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFiveResults[11] == 'yes' ? 'Good' : 'Please have emergency numbers'),

              SizedBox(height: 30),
              Text('13. Review crew responsibilities'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFiveResults[12],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[12] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFiveResults[12],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[12] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFiveResults[12] == 'yes' ? 'Good' : 'Please review with crew'),

              SizedBox(height: 30),
              Text('14. Turn on aviation radio and select appropriate frequency'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderFiveResults[13],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[13] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderFiveResults[13],
                  onChanged: (value) {
                    setState(() {
                      HeaderFiveResults[13] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderFiveResults[13] == 'yes' ? 'Good' : 'please select frequency'),


              SizedBox(height: 30),
              Padding(
                  padding: EdgeInsets.symmetric(vertical:60.0,horizontal: 100.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      //onPressed: ((HeaderTwoResults[1] == 'yes' || result3 == 'no') && (result4 == 'yes' || result4 == 'no'))? _doSomething : null,
                      onPressed: (HeaderFiveResults[0] != 'incomplete' && HeaderFiveResults[1] != 'incomplete'
                          && HeaderFiveResults[2] != 'incomplete'
                          && HeaderFiveResults[3] != 'incomplete'
                          && HeaderFiveResults[4] != 'incomplete'
                          && HeaderFiveResults[5] != 'incomplete'
                          && HeaderFiveResults[6] != 'incomplete'
                          && HeaderFiveResults[7] != 'incomplete'
                          && HeaderFiveResults[8] != 'incomplete'
                          && HeaderFiveResults[9] != 'incomplete'
                          && HeaderFiveResults[10] != 'incomplete'
                          && HeaderFiveResults[11] != 'incomplete'
                          && HeaderFiveResults[12] != 'incomplete'
                          && HeaderFiveResults[13] != 'incomplete'
                      )? _doSomething : null,
                      child: Text('Back To Home')))
            ],
          ),
        )
    );
  }
}


