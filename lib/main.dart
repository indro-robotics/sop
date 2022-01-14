import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'text_fields.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'emailNav.dart';
import 'loginNav.dart';
import 'RPAS_Equipment.dart';
import 'Mission_Equipment.dart';
import 'PPE.dart';
import 'MissionDocuments.dart';
import 'PreFlightBriefing.dart';
import 'PPAS_Setup_Flow.dart';
import 'Payload_Setup_Flow.dart';
import 'Pre_Flight_PowerOn_Flow.dart';
import 'Pre_TakeOff_Checklist.dart';
import 'TakeOff_Flow.dart';
import 'Landing_Checklist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'LoginPage.dart';

//void main() => runApp(MyApp());
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  //FirebaseAuth auth = FirebaseAuth.instance;
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

class Home extends StatefulWidget {
  @override
  var HeaderOneResults;
  var result3;
  var result4;
  var rPASSetupFlow;
  Home({Key? key, this.HeaderOneResults, this.result3, this.result4, this.rPASSetupFlow}) : super(key: key);

  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {
  //int count = 0;
  final auth = FirebaseAuth.instance;

  void NavigateScrean2() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Screen2(HeaderOneResults:HeaderOneResults, result3: result3, result4: result4)));
  }

  void _enterPackUpFlow() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenPackUpFlow()));
  }
  void _enterMissionEquipments() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenMissionEquipments()));
  }
  void _enterPPE() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenPPE()));
  }
  void _enterMissionDocuments() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenMissionDocuments()));
  }
  void _enterPreFlightBriefing() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenPreFlightBriefing()));
  }
  void _enterPPASFlow() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenPPASFlow()));
  }
  void _enterPayloadFlow() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenPayloadFlow()));
  }
  void _enterPreFlightFlow() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenPreFlightFlow()));
  }
  void _enterPreTakeOffChecklist() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenPreTakeOffChecklist()));
  }
  void _enterTakeOffFlow() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenTakeOffFlow()));
  }
  void _enterLandingChecklist() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenLandingChecklist()));
  }

  void _signOut(){
    auth.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>LoginNav()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //leading: Icon(Icons.accessibility),
          backgroundColor: Colors.orange,
          centerTitle: true,
          title: Text(
            'indrorobotics.ca',
          ),
          actions:<Widget>[
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: _signOut,
            ),
          ],
        ),
        /*floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.fullscreen_exit),
          onPressed: () {
            auth.signOut();
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>LoginNav()));
            },
        ),*/
        body:
        SingleChildScrollView(
          padding: EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),

              SizedBox(
                  width: 370,
                  //padding: EdgeInsets.symmetric(vertical:0.0,horizontal: 50.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center,
                          backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if ((result1 == 'yes' || result1 == 'no') && (result2 == 'yes' || result2 == 'no'))
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
                      child: Text('RPAS Equipment'))),
              SizedBox(height: 5),
              SizedBox(
                  width: 370,
                  //padding: EdgeInsets.symmetric(vertical:0.0,horizontal: 70.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center,
                          backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if ((result3 == 'yes' || result3 == 'no') && (result4 == 'yes' || result4 == 'no'))
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
              SizedBox(height: 5),
              SizedBox(
                  width: 370,
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      onPressed:  _enterPPE,
                      child: Text('PPE'))),
              SizedBox(height: 5),
              SizedBox(
                  width: 370,
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      onPressed:  _enterMissionDocuments,
                      child: Text('Mission Documents'))),
              SizedBox(height: 5),
              SizedBox(
                  width: 370,
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      onPressed:  _enterPreFlightBriefing,
                      child: Text('Pre-Flight Setup and Crew Briefing'))),
              SizedBox(height: 5),
              SizedBox(
                  width: 370,
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center,
                          backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (rPASSetupFlow == 'complete')
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
                      onPressed:  _enterPPASFlow,
                      child: Text('RPAS Setup Flow'))),
              SizedBox(height: 5),
              SizedBox(
                  width: 370,
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      onPressed:  _enterPayloadFlow,
                      child: Text('Payload Setup Flow'))),
              SizedBox(height: 5),
              SizedBox(
                  width: 370,
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      onPressed:  _enterPreFlightFlow,
                      child: Text('Pre-Flight Power On Flow'))),
              SizedBox(height: 5),
              SizedBox(
                  width: 370,
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      onPressed:  _enterPreTakeOffChecklist,
                      child: Text('Pre-Take Off Checklist'))),
              SizedBox(height: 5),
              SizedBox(
                  width: 370,
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      onPressed:  _enterTakeOffFlow,
                      child: Text('Take Off Flow'))),
              SizedBox(height: 5),
              SizedBox(
                  width: 370,
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      onPressed:  _enterLandingChecklist,
                      child: Text('Landing Checklist'))),
              SizedBox(height: 10),
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

