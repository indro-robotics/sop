import 'package:flutter/material.dart';
import 'text_fields.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';




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
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Screen2()));
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



class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}
class _Screen2State extends State<Screen2> {
  @override

  int _getPassed() {
    var passed = 0;


    if(_result1=='yes'){
      passed = passed+1;
    }
    if(_result2=='yes'){
      passed = passed+1;
    }
    if(_result3=='yes'){
      passed = passed+1;
    }
    if(_result4=='yes'){
      passed = passed+1;
    }
    return passed;
  }

  int _getFailed() {
    var failed = 0;

    if(_result1=='no'){
      failed = failed+1;
    }
    if(_result2=='no'){
      failed = failed+1;
    }
    if(_result3=='no'){
      failed = failed+1;
    }
    if(_result4=='no'){
      failed = failed+1;
    }
    return failed;
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
      body: Form(
        key: _formKey,
        onChanged: (() {
          setState(() {
            _enableBtn = _formKey.currentState!.validate();
          });
        }),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 50),
              TextFields(
                  controller: subjectController,
                  name: "Subject",
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  })),
              TextFields(
                  controller: emailController,
                  name: "Email",
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  })),
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.5);
                            else if (states.contains(MaterialState.disabled))
                              return Colors.grey;
                            return Colors.green; // Use the component's default.
                          },
                        ),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            )
                        )
                    ),
                    onPressed: _enableBtn
                        ? (() async {

                          var passed = _getPassed();
                          var failed = _getFailed();

                      var message = "SOP results: \n\n"
                          "Passed: ${passed}\n"
                          "Failed: ${failed}\n\n"
                                                     "   Pack-up Flows:\n      1. Mission maps downloaded onto ground station if required: ${_result1}\n"
                                                                       "      2. RPAS securely stored in case: ${_result2}\n\n"
                                                     "   Mission Equipment:\n"
                                                                       "      1. First aid Kit: ${_result3}\n"
                                                                       "      2. Cell phone(s) or satellite phone charged with correct cables: ${_result4}\n\n"
                                                     "   PPE: \n      No Information\n\n"
                                                     "   Mission Documents: \n      No Information\n\n"
                                                     "   Pre-Flight Setup and Crew Briefing: \n      No Information\n\n";

                      final Email email = Email(
                        body: message,
                        subject: subjectController.text,
                        recipients: [emailController.text],
                        isHTML: false,
                      );
                      await FlutterEmailSender.send(email);
                    })
                        : null,
                    child: Text('Submit'),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

