import 'package:flutter/material.dart';
import 'main.dart';


var result3;
var result4;


class ScreenMissionEquipments extends StatefulWidget {
  @override
  _ScreenMissionEquipmentsState createState() => _ScreenMissionEquipmentsState();
}
class _ScreenMissionEquipmentsState extends State<ScreenMissionEquipments> {
  @override
  void _doSomething() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home(result3: result3, result4:result4)));
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
                  groupValue: result3,
                  onChanged: (value) {
                    setState(() {
                      result3 = value;
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: result3,
                  onChanged: (value) {
                    setState(() {
                      result3 = value;
                    });
                  }),
              SizedBox(height: 5),
              Text(result3 == 'yes' ? 'Good' : 'Please bring first aid kit'),

              SizedBox(height: 30),
              Text('2. Cell phone(s) or satellite phone charged with correct cables'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: result4,
                  onChanged: (value) {
                    setState(() {
                      result4 = value;
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: result4,
                  onChanged: (value) {
                    setState(() {
                      result4 = value;
                    });
                  }),
              SizedBox(height: 5),
              Text(result4 == 'yes' ? 'Good' : 'Plesase get your cell phone(s) or satellite phone charged'),

              SizedBox(height: 30),
              Padding(
                  padding: EdgeInsets.symmetric(vertical:60.0,horizontal: 100.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      onPressed: ((result3 == 'yes' || result3 == 'no') && (result4 == 'yes' || result4 == 'no'))? _doSomething : null,
                      child: Text('Back To Home')))
            ],
          ),
        )
    );
  }
}
