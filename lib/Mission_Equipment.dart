import 'package:flutter/material.dart';
import 'main.dart';


var HeaderTwoResults = ['incomplete', 'incomplete','incomplete', 'incomplete','incomplete', 'incomplete','incomplete',
    'incomplete','incomplete','incomplete','incomplete','incomplete','incomplete','incomplete','incomplete','incomplete',];

class ScreenMissionEquipments extends StatefulWidget {
  @override
  _ScreenMissionEquipmentsState createState() => _ScreenMissionEquipmentsState();
}
class _ScreenMissionEquipmentsState extends State<ScreenMissionEquipments> {
  @override
  void _doSomething() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home(HeaderTwoResults: HeaderTwoResults)));
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
              Text('1. First aid kit'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderTwoResults[0],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[0] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderTwoResults[0],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[0] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderTwoResults[0] == 'yes' ? 'Good' : 'Please bring first aid kit'),

              SizedBox(height: 30),
              Text('2. Fire extinguisher(s)'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderTwoResults[1],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[1] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderTwoResults[1],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[1] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderTwoResults[1] == 'yes' ? 'Good' : 'Please retrieve fire extinguisher(s)'),

              SizedBox(height: 30),
              Text('3. Anemometer'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderTwoResults[2],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[2] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderTwoResults[2],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[2] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderTwoResults[1] == 'yes' ? 'Good' : 'Please retrieve Anemometer'),


              SizedBox(height: 30),
              Text('4. Cell Phone(s) or Satellite Phone charged with correct cables'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderTwoResults[3],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[3] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderTwoResults[3],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[3] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderTwoResults[3] == 'yes' ? 'Good' : 'Please charge phone(s)'),


              SizedBox(height: 30),
              Text('5. 4 to 8 x red or yellow cones'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderTwoResults[4],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[4] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderTwoResults[4],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[4] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderTwoResults[4] == 'yes' ? 'Good' : 'Retrieve cones'),


              SizedBox(height: 30),
              Text('6. RPAS and payload specific items (e.g. base station, battery case, tripod)'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderTwoResults[5],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[5] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderTwoResults[5],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[5] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderTwoResults[5] == 'yes' ? 'Good' : 'Retrieve payload specific items'),

              SizedBox(height: 30),
              Text('7. Landing pad'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderTwoResults[6],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[6] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderTwoResults[6],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[6] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderTwoResults[6] == 'yes' ? 'Good' : 'Retrieve landing pad'),

              SizedBox(height: 30),
              Text('8. Battery warmer equipment'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderTwoResults[7],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[7] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderTwoResults[7],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[7] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderTwoResults[7] == 'yes' ? 'Good' : 'Get equipment'),

              SizedBox(height: 30),
              Text('9. Canopy, table and chairs'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderTwoResults[8],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[8] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderTwoResults[8],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[8] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderTwoResults[8] == 'yes' ? 'Good' : 'Please get Canopy, table and chairs'),

              SizedBox(height: 30),
              Text('10. Spectrum analyser with charger battery'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderTwoResults[9],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[9] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderTwoResults[9],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[9] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderTwoResults[6] == 'yes' ? 'Good' : 'Retrieve spectrum analyser with battery'),

              SizedBox(height: 30),
              Text('11. Tool box'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderTwoResults[10],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[10] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderTwoResults[10],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[10] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderTwoResults[10] == 'yes' ? 'Good' : 'Retrieve tool box'),

              SizedBox(height: 30),
              Text('12. Portable power pack charged'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderTwoResults[11],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[11] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderTwoResults[11],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[11] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderTwoResults[11] == 'yes' ? 'Good' : 'Retrieve charged power pack'),

              SizedBox(height: 30),
              Text('13. Extension cord and power bar'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderTwoResults[12],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[12] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderTwoResults[12],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[12] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderTwoResults[12] == 'yes' ? 'Good' : 'Retrieve extension cord'),

              SizedBox(height: 30),
              Text('14. 12 VDC to 110 VAC inverter'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderTwoResults[13],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[13] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderTwoResults[13],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[13] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderTwoResults[13] == 'yes' ? 'Good' : 'Need inverter'),

              SizedBox(height: 30),
              Text('15. Inter-crew comms radios charged and tested'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderTwoResults[14],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[14] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderTwoResults[14],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[14] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderTwoResults[14] == 'yes' ? 'Good' : 'Need inter-crew comms'),

              SizedBox(height: 30),
              Text('16. Aviation radio(s) charged and tested'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderTwoResults[15],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[15] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderTwoResults[15],
                  onChanged: (value) {
                    setState(() {
                      HeaderTwoResults[15] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderTwoResults[15] == 'yes' ? 'Good' : 'Need aviation radio(s)'),

              SizedBox(height: 30),
              Padding(
                  padding: EdgeInsets.symmetric(vertical:60.0,horizontal: 100.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      //onPressed: ((HeaderTwoResults[1] == 'yes' || result3 == 'no') && (result4 == 'yes' || result4 == 'no'))? _doSomething : null,
                      onPressed: (HeaderTwoResults[0] != 'incomplete' && HeaderTwoResults[1] != 'incomplete'
                          && HeaderTwoResults[2] != 'incomplete'
                          && HeaderTwoResults[3] != 'incomplete'
                          && HeaderTwoResults[4] != 'incomplete'
                          && HeaderTwoResults[5] != 'incomplete'
                          && HeaderTwoResults[6] != 'incomplete'
                          && HeaderTwoResults[7] != 'incomplete'
                          && HeaderTwoResults[8] != 'incomplete'
                          && HeaderTwoResults[9] != 'incomplete'
                          && HeaderTwoResults[10] != 'incomplete'
                          && HeaderTwoResults[11] != 'incomplete'
                          && HeaderTwoResults[12] != 'incomplete'
                          && HeaderTwoResults[13] != 'incomplete'
                          && HeaderTwoResults[14] != 'incomplete'
                          && HeaderTwoResults[15] != 'incomplete'
                      )? _doSomething : null,
                      child: Text('Back To Home')))
            ],
          ),
        )
    );
  }
}
