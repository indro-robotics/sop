import 'package:flutter/material.dart';
import 'main.dart';

var HeaderElevenResults = ['incomplete', 'incomplete','incomplete', 'incomplete','incomplete', 'incomplete'];

class ScreenLandingChecklist extends StatefulWidget {
  @override
  _ScreenLandingChecklistState createState() => _ScreenLandingChecklistState();
}
class _ScreenLandingChecklistState extends State<ScreenLandingChecklist> {
  @override
  void _doSomething() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home(HeaderElevenResults:HeaderElevenResults)));
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
              Text('1. Disarm RPA'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderElevenResults[0],
                  onChanged: (value) {
                    setState(() {
                      HeaderElevenResults[0] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderElevenResults[0],
                  onChanged: (value) {
                    setState(() {
                      HeaderElevenResults[0] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderElevenResults[0] == 'yes' ? 'Good' : 'incomplete'),

              SizedBox(height: 30),
              Text('2. Ensure propellers have fully stopped'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderElevenResults[1],
                  onChanged: (value) {
                    setState(() {
                      HeaderElevenResults[1] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderElevenResults[1],
                  onChanged: (value) {
                    setState(() {
                      HeaderElevenResults[1] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderElevenResults[1] == 'yes' ? 'Good' : 'incomplete'),

              SizedBox(height: 30),
              Text('3. Final battery percent callout'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderElevenResults[2],
                  onChanged: (value) {
                    setState(() {
                      HeaderElevenResults[2] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderElevenResults[2],
                  onChanged: (value) {
                    setState(() {
                      HeaderElevenResults[2] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderElevenResults[2] == 'yes' ? 'Good' : 'incomplete'),

              SizedBox(height: 30),
              Text('4. IF BATTERY SWAP - Insert charged battery and initiate RPAS-specific Power-On flow'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderElevenResults[3],
                  onChanged: (value) {
                    setState(() {
                      HeaderElevenResults[3] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderElevenResults[3],
                  onChanged: (value) {
                    setState(() {
                      HeaderElevenResults[3] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderElevenResults[3] == 'yes' ? 'Good' : 'Incomplete'),

              SizedBox(height: 30),
              Text('5. IF SHUT DOWN, power down GCS'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderElevenResults[4],
                  onChanged: (value) {
                    setState(() {
                      HeaderElevenResults[4] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderElevenResults[4],
                  onChanged: (value) {
                    setState(() {
                      HeaderElevenResults[4] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderElevenResults[4] == 'yes' ? 'Good' : 'incomplete'),

              SizedBox(height: 30),
              Text('6. Turn off flight log'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: HeaderElevenResults[5],
                  onChanged: (value) {
                    setState(() {
                      HeaderElevenResults[5] = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: HeaderElevenResults[5],
                  onChanged: (value) {
                    setState(() {
                      HeaderElevenResults[5] = value.toString();
                    });
                  }),
              SizedBox(height: 5),
              Text(HeaderElevenResults[5] == 'yes' ? 'Good' : 'incomplete'),

              SizedBox(height: 30),
              Padding(
                  padding: EdgeInsets.symmetric(vertical:60.0,horizontal: 100.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      //onPressed: ((result1 == 'yes' || result1=='no') && (result2 == 'yes'|| result2=='no'))? _doSomething : null,
                      onPressed: (HeaderElevenResults[0] != 'incomplete' && HeaderElevenResults[1] != 'incomplete'
                          && HeaderElevenResults[2] != 'incomplete'
                          && HeaderElevenResults[3] != 'incomplete'
                          && HeaderElevenResults[4] != 'incomplete'
                          && HeaderElevenResults[5] != 'incomplete')? _doSomething : null,
                      child: Text('Back To Home')))
            ],
          ),
        )
    );
  }
}


