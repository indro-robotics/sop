import 'package:flutter/material.dart';
import 'text_fields.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'emailNav.dart';
import 'loginNav.dart';



void main() => runApp(MyApp());
/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginNav(),
    );
  }
}

final _formKey = GlobalKey<FormState>();
bool _enableBtn = false;
TextEditingController emailController = TextEditingController();
TextEditingController subjectController = TextEditingController();
TextEditingController messageController = TextEditingController();

var _result1;
var _result2;
var _result3;
var _result4;


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void NavigateScrean2() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Screen2(result1: _result1, result2: _result2, result3: _result3, result4: _result4)));
  }

  void _enterPackUpFlow() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenPackUpFlow()));
  }
  void _enterMissionEquipments() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenMissionEquipments()));
  }
  void _enterUnfinishedPage() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenUnfinishedPage()));
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
        body: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Padding(
                  padding: EdgeInsets.symmetric(vertical:0.0,horizontal: 110.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center,
                          backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if ((_result1 == 'yes') && (_result2 == 'yes'))
                              {
                                return Colors.green; // Use the component's default. }
                              }
                              else
                              {
                                return Colors.blue;
                              }
                            },
                          )
                      ),
                      onPressed:  _enterPackUpFlow ,
                      child: Text('Pack-up Flows'))),
              SizedBox(height: 10),
              Padding(
                  padding: EdgeInsets.symmetric(vertical:0.0,horizontal: 95.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center,
                          backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if ((_result3 == 'yes') && (_result4 == 'yes'))
                              {
                                return Colors.green; // Use the component's default. }
                              }
                              else
                              {
                                return Colors.blue;
                              }
                            },
                          )

                      ),
                      onPressed:  _enterMissionEquipments,
                      child: Text('Mission Equipment'))),
              SizedBox(height: 10),
              Padding(
                  padding: EdgeInsets.symmetric(vertical:0.0,horizontal: 140.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      onPressed:  _enterUnfinishedPage,
                      child: Text('PPE'))),
              SizedBox(height: 10),
              Padding(
                  padding: EdgeInsets.symmetric(vertical:0.0,horizontal: 95.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      onPressed:  _enterUnfinishedPage,
                      child: Text('Mission Documents'))),
              SizedBox(height: 10),
              Padding(
                  padding: EdgeInsets.symmetric(vertical:0.0,horizontal: 50.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      onPressed:  _enterUnfinishedPage,
                      child: Text('Pre-Flight Setup and Crew Briefing'))),
              SizedBox(height: 150),
              SizedBox(
              //Padding(
              //    padding: EdgeInsets.symmetric(vertical:90.0,horizontal: 120.0),
                  width: 370,
                  child:ElevatedButton(

                      style: ButtonStyle(alignment: Alignment.center,
                        backgroundColor:
                      MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                            return Colors.orange; // Use the component's default. }
                        },
                      ),
                          //fixedSize: MaterialStateProperty.all(const Size(500, 50)),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              )
                          ),

                      ),
                      onPressed: NavigateScrean2,
                      child: Text('Send Email')))
            ],
          ),
        )
    );
  }
}


class ScreenPackUpFlow extends StatefulWidget {
  @override
  _ScreenPackUpFlowState createState() => _ScreenPackUpFlowState();
}
class _ScreenPackUpFlowState extends State<ScreenPackUpFlow> {
  @override
  void _doSomething() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home()));
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
                  groupValue: _result1,
                  onChanged: (value) {
                    setState(() {
                      _result1 = value;
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: _result1,
                  onChanged: (value) {
                    setState(() {
                      _result1 = value;
                    });
                  }),
              SizedBox(height: 5),
              Text(_result1 == 'yes' ? 'Good' : 'Please get the map downloaded'),

              SizedBox(height: 30),
              Text('2. RPAS securely stored in case'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: _result2,
                  onChanged: (value) {
                    setState(() {
                      _result2 = value;
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: _result2,
                  onChanged: (value) {
                    setState(() {
                      _result2 = value;
                    });
                  }),
              SizedBox(height: 5),
              Text(_result2 == 'yes' ? 'Good' : 'Please securely store your RPAS in case'),

              SizedBox(height: 30),
              Padding(
                  padding: EdgeInsets.symmetric(vertical:60.0,horizontal: 100.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      onPressed: ((_result1 == 'yes') && (_result2 == 'yes'))? _doSomething : null,
                      child: Text('Back To Home')))
            ],
          ),
        )
    );
  }
}



class ScreenMissionEquipments extends StatefulWidget {
  @override
  _ScreenMissionEquipmentsState createState() => _ScreenMissionEquipmentsState();
}
class _ScreenMissionEquipmentsState extends State<ScreenMissionEquipments> {
  @override
  void _doSomething() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home()));
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
              Text('1. First aid kit'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: _result3,
                  onChanged: (value) {
                    setState(() {
                      _result3 = value;
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: _result3,
                  onChanged: (value) {
                    setState(() {
                      _result3 = value;
                    });
                  }),
              SizedBox(height: 5),
              Text(_result3 == 'yes' ? 'Good' : 'Please bring first aid kit'),

              SizedBox(height: 30),
              Text('2. Cell phone(s) or satellite phone charged with correct cables'),
              RadioListTile(
                  title: Text('Yes'),
                  value: 'yes',
                  groupValue: _result4,
                  onChanged: (value) {
                    setState(() {
                      _result4 = value;
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: 'no',
                  groupValue: _result4,
                  onChanged: (value) {
                    setState(() {
                      _result4 = value;
                    });
                  }),
              SizedBox(height: 5),
              Text(_result4 == 'yes' ? 'Good' : 'Plesase get your cell phone(s) or satellite phone charged'),

              SizedBox(height: 30),
              Padding(
                  padding: EdgeInsets.symmetric(vertical:60.0,horizontal: 100.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      onPressed: ((_result3 == 'yes') && (_result4 == 'yes'))? _doSomething : null,
                      child: Text('Back To Home')))
            ],
          ),
        )
    );
  }
}



class ScreenUnfinishedPage extends StatefulWidget {
  @override
  _ScreenUnfinishedPageState createState() => _ScreenUnfinishedPageState();
}
class _ScreenUnfinishedPageState extends State<ScreenUnfinishedPage> {
  @override
  void _doSomething() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home()));
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
        body: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('This Page Is Not Finished Yet'),
              Padding(
                  padding: EdgeInsets.symmetric(vertical:60.0,horizontal: 100.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      onPressed: _doSomething,
                      child: Text('Back To Home')))
            ],
          ),
        )
    );
  }
}



