


import 'package:flutter/material.dart';
import 'emailNav.dart';
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
import 'Drone_Type_Page.dart';
import 'RPAS_Wayfinder_Flow.dart';
import 'Matrice_Power_Page.dart';
import 'Wayfinder_Power_Page.dart';
import 'MicaSense_Payload.dart';
import 'Zenmuse_Payload.dart';
import 'Matrice300_Power_Page.dart';
import 'Matrice300_RPAS.dart';
import 'DJI_Mavic_Mini_RPAS.dart';
import 'DJI_Mavic_Mini_PowerOn.dart';
import 'pdf_paragraph_api.dart';
import 'pdf_api.dart';
import 'package:restart_app/restart_app.dart';
import 'package:flutter_restart/flutter_restart.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';




//void main() => runApp(MyApp());
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  //runApp(MyApp());
  runApp(
    RestartWidget(
      child:MyApp(),
    ),
  );
}


class RestartWidget extends StatefulWidget {
  RestartWidget({required this.child});
  final Widget child;

  static void restartApp(BuildContext context) {
    //final _RestartWidgetState state = context.findAncestorStateOfType<State<RestartWidget>>();
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
    //context.findAncestorStateOfType<State<RestartWidget>>();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    //Navigator.of(context).push(
    //    MaterialPageRoute(builder: (context) => ScreenPreTakeOffChecklist(restart:true)));
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}



/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    /*return RestartWidget(
      child: MaterialApp(
        home: Home()
      )
    );*/
    return MaterialApp(
      home: Home(),
      //home: LoginNav(),
    );
  }
}



final _formKey = GlobalKey<FormState>();
bool _enableBtn = false;
TextEditingController emailController = TextEditingController();
TextEditingController subjectController = TextEditingController();
TextEditingController messageController = TextEditingController();
var rPASSetupFlow = 'incomplete';
var poweron = 'incomplete';
var payload = 'incomplete';
//var rPASSetupFlow = 'incomplete';

class Home extends StatefulWidget {

  @override
  var HeaderOneResults;
  var HeaderTwoResults;
  var HeaderThreeResults;
  var HeaderFourResults;
  var HeaderFiveResults;
  var HeaderNineResults;
  var HeaderElevenResults;
  var result3;
  var result4;
  var rPASSetupFlow;
  var matrice;
  var wayfinder;
  var poweron;
  var matricepower;
  var wayfinderpower;
  var payload;
  var micaSense;
  var Zenmuse;
  var flightTime;
  var matrice300power;
  var matrice300;
  var mavicMinipower;
  var mavicMini;

  var flightStart;
  var flightEnd;

  Home({Key? key, this.HeaderOneResults, this.HeaderTwoResults, this.HeaderThreeResults, this.HeaderFourResults, this.HeaderFiveResults,
    this.HeaderNineResults, this.HeaderElevenResults,
    this.rPASSetupFlow, this.matrice, this.wayfinder, this.poweron, this.matricepower, this.wayfinderpower,
  this.payload, this.micaSense, this.Zenmuse, this.flightTime, this.matrice300power, this.matrice300, this.mavicMini, this.mavicMinipower,
  this.flightStart, this.flightEnd}) : super(key: key);

  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {
  //int count = 0;
  //final auth = FirebaseAuth.instance;

  /*Future<void> NavigateScrean2() async {
    final pdfFile = await PdfParagraphApi.generate();
    PdfApi.openFile(pdfFile);

  }*/


  Future<void> NavigateScrean2() async {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Screen2(HeaderOneResults:HeaderOneResults, HeaderTwoResults:HeaderTwoResults,
        HeaderThreeResults:HeaderThreeResults, HeaderFourResults:HeaderFourResults, HeaderFiveResults:HeaderFiveResults,
        HeaderNineResults:HeaderNineResults, HeaderElevenResults:HeaderElevenResults,  rPASSetupFlow: rPASSetupFlow, matrice:matrice,
        wayfinder:wayfinder, poweron:poweron, matricepower:matricepower, wayfinderpower:wayfinderpower,
    payload:payload, micaSense:micaSense, Zenmuse:Zenmuse, timeValue:timeValue, matrice300power:matrice300power, matrice300:matrice300, mavicMinipower:mavicMinipower, mavicMini:mavicMini)));
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
  void _enterRPASFlow() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenDroneType(rPASSetupFlow:rPASSetupFlow, matrice:matrice, wayfinder:wayfinder, matrice300:matrice300,
            mavicMini:mavicMini)));
  }
  void _enterPayloadFlow() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenPayloadFlow(payload:payload, micaSense:micaSense, Zenmuse:Zenmuse)));
  }
  void _enterPreFlightFlow() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenPowerOn(poweron:poweron, matricepower:matricepower, wayfinderpower:wayfinderpower,
            matrice300power:matrice300power, mavicMinipower:mavicMinipower)));
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

  Future<void> _reset() async {
    for(int i=0; i<HeaderOneResults.length; i++){
      HeaderOneResults[i] = 'incomplete';
    }
    for(int i=0; i<HeaderTwoResults.length; i++){
      HeaderTwoResults[i] = 'incomplete';
    }
    for(int i=0; i<HeaderThreeResults.length; i++){
      HeaderThreeResults[i] = 'incomplete';
    }
    for(int i=0; i<HeaderFourResults.length; i++){
      HeaderFourResults[i] = 'incomplete';
    }
    for(int i=0; i<HeaderFiveResults.length; i++){
      HeaderFiveResults[i] = 'incomplete';
    }
    for(int i=0; i<HeaderNineResults.length; i++){
      HeaderNineResults[i] = 'incomplete';
    }
    for(int i=0; i<HeaderElevenResults.length; i++){
      HeaderElevenResults[i] = 'incomplete';
    }
    rPASSetupFlow = 'incomplete';
    matrice = 'incomplete';
    wayfinder = 'incomplete';
    matrice300 = 'incomplete';
    mavicMini = 'incomplete';

    poweron = 'incomplete';
    matricepower = 'incomplete';
    wayfinderpower = 'incomplete';
    payload = 'incomplete';
    micaSense = 'incomplete';
    Zenmuse = 'incomplete';
    flightTime = '';
    matrice300power = 'incomplete';
    mavicMinipower = 'incomplete';

    isStartPressed= false;
    isResetPressed= true;
    isStopPressed= true;
    flightStart = '';
    flightEnd = '';
    timeValue ="00:00:00";
    buttonText='Start';
    buttonColor = Colors.green;
    buttonIcon = Icons.flight_takeoff;
    header = "Ready For Take-Off";
    body = 'Please have pre-flight requirements completed';
    backgroundImage = 'assets/images/bottom2.jpg';
    (context as Element).reassemble();
  }


  void _signOut(){
    //auth.signOut();
    //Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>LoginNav()));
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
              icon: Icon(Icons.refresh),
              onPressed: _reset,
            ),
          ],
        ),
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
                              if ((HeaderOneResults[0] == 'yes' || HeaderOneResults[0] == 'no')
                                  && (HeaderOneResults[1] == 'yes' || HeaderOneResults[1]== 'no')
                                  && (HeaderOneResults[2] == 'yes' || HeaderOneResults[2]== 'no')
                                  && (HeaderOneResults[3] == 'yes' || HeaderOneResults[3]== 'no')
                                  && (HeaderOneResults[4] == 'yes' || HeaderOneResults[4]== 'no')
                                  && (HeaderOneResults[5] == 'yes' || HeaderOneResults[5]== 'no')
                                  && (HeaderOneResults[6] == 'yes' || HeaderOneResults[6]== 'no')
                                  && (HeaderOneResults[7] == 'yes' || HeaderOneResults[7]== 'no')
                                  && (HeaderOneResults[8] == 'yes' || HeaderOneResults[8]== 'no')
                              )
                              {
                                return Colors.green; // Use the component's default. }
                              }
                              else if ((HeaderOneResults[0] == 'yes' || HeaderOneResults[0] == 'no')
                                  || (HeaderOneResults[1] == 'yes' || HeaderOneResults[1]== 'no')
                                  || (HeaderOneResults[2] == 'yes' || HeaderOneResults[2]== 'no')
                                  || (HeaderOneResults[3] == 'yes' || HeaderOneResults[3]== 'no')
                                  || (HeaderOneResults[4] == 'yes' || HeaderOneResults[4]== 'no')
                                  || (HeaderOneResults[5] == 'yes' || HeaderOneResults[5]== 'no')
                                  || (HeaderOneResults[6] == 'yes' || HeaderOneResults[6]== 'no')
                                  || (HeaderOneResults[7] == 'yes' || HeaderOneResults[7]== 'no')
                                  || (HeaderOneResults[8] == 'yes' || HeaderOneResults[8]== 'no')
                              )
                              {
                                return Colors.orangeAccent;
                              }
                              else
                              {
                                return Colors.blue;
                              }
                            },
                          )
                      ),
                      onPressed:  _enterPackUpFlow ,
                      child: Text('Pre-Mission Checklist'))),
              SizedBox(height: 5),
              SizedBox(
                  width: 370,
                  //padding: EdgeInsets.symmetric(vertical:0.0,horizontal: 70.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center,
                          backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if ((HeaderTwoResults[0] == 'yes' || HeaderTwoResults[0] == 'no')
                                      && (HeaderTwoResults[1] == 'yes' || HeaderTwoResults[1]== 'no')
                                      && (HeaderTwoResults[2] == 'yes' || HeaderTwoResults[2]== 'no')
                                      && (HeaderTwoResults[3] == 'yes' || HeaderTwoResults[3]== 'no')
                                      && (HeaderTwoResults[4] == 'yes' || HeaderTwoResults[4]== 'no')
                                      && (HeaderTwoResults[5] == 'yes' || HeaderTwoResults[5]== 'no')
                                      && (HeaderTwoResults[6] == 'yes' || HeaderTwoResults[6]== 'no')
                                      && (HeaderTwoResults[7] == 'yes' || HeaderTwoResults[7]== 'no')
                                      && (HeaderTwoResults[8] == 'yes' || HeaderTwoResults[8]== 'no')
                                      && (HeaderTwoResults[9] == 'yes' || HeaderTwoResults[9]== 'no')
                                      && (HeaderTwoResults[10] == 'yes' || HeaderTwoResults[10]== 'no')
                                      && (HeaderTwoResults[11] == 'yes' || HeaderTwoResults[11]== 'no')
                                      && (HeaderTwoResults[12] == 'yes' || HeaderTwoResults[12]== 'no')
                                      && (HeaderTwoResults[13] == 'yes' || HeaderTwoResults[13]== 'no')
                                      && (HeaderTwoResults[14] == 'yes' || HeaderTwoResults[14]== 'no')
                                      && (HeaderTwoResults[15] == 'yes' || HeaderTwoResults[15]== 'no')
                                  )
                              {
                                return Colors.green; // Use the component's default. }
                              }
                              else if ((HeaderTwoResults[0] == 'yes' || HeaderTwoResults[0] == 'no')
                                      || (HeaderTwoResults[1] == 'yes' || HeaderTwoResults[1]== 'no')
                                      || (HeaderTwoResults[2] == 'yes' || HeaderTwoResults[2]== 'no')
                                      || (HeaderTwoResults[3] == 'yes' || HeaderTwoResults[3]== 'no')
                                      || (HeaderTwoResults[4] == 'yes' || HeaderTwoResults[4]== 'no')
                                      || (HeaderTwoResults[5] == 'yes' || HeaderTwoResults[5]== 'no')
                                      || (HeaderTwoResults[6] == 'yes' || HeaderTwoResults[6]== 'no')
                                      || (HeaderTwoResults[7] == 'yes' || HeaderTwoResults[7]== 'no')
                                      || (HeaderTwoResults[8] == 'yes' || HeaderTwoResults[8]== 'no')
                                      || (HeaderTwoResults[9] == 'yes' || HeaderTwoResults[9]== 'no')
                                      || (HeaderTwoResults[10] == 'yes' || HeaderTwoResults[10]== 'no')
                                      || (HeaderTwoResults[11] == 'yes' || HeaderTwoResults[11]== 'no')
                                      || (HeaderTwoResults[12] == 'yes' || HeaderTwoResults[12]== 'no')
                                      || (HeaderTwoResults[13] == 'yes' || HeaderTwoResults[13]== 'no')
                                      || (HeaderTwoResults[14] == 'yes' || HeaderTwoResults[14]== 'no')
                                      || (HeaderTwoResults[15] == 'yes' || HeaderTwoResults[15]== 'no')
                                  )
                              {
                                return Colors.orangeAccent;
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
                      style: ButtonStyle(alignment: Alignment.center,
                          backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if ((HeaderThreeResults[0] == 'yes' || HeaderThreeResults[0] == 'no')
                                  && (HeaderThreeResults[1] == 'yes' || HeaderThreeResults[1]== 'no')
                                  && (HeaderThreeResults[2] == 'yes' || HeaderThreeResults[2]== 'no')
                                  && (HeaderThreeResults[3] == 'yes' || HeaderThreeResults[3]== 'no')
                                  && (HeaderThreeResults[4] == 'yes' || HeaderThreeResults[4]== 'no')
                                  && (HeaderThreeResults[5] == 'yes' || HeaderThreeResults[5]== 'no')
                                  && (HeaderThreeResults[6] == 'yes' || HeaderThreeResults[6]== 'no')
                                  && (HeaderThreeResults[7] == 'yes' || HeaderThreeResults[7]== 'no')
                                  && (HeaderThreeResults[8] == 'yes' || HeaderThreeResults[8]== 'no')
                              )
                              {
                                return Colors.green; // Use the component's default. }
                              }
                              else if ((HeaderThreeResults[0] == 'yes' || HeaderThreeResults[0] == 'no')
                                  || (HeaderThreeResults[1] == 'yes' || HeaderThreeResults[1]== 'no')
                                  || (HeaderThreeResults[2] == 'yes' || HeaderThreeResults[2]== 'no')
                                  || (HeaderThreeResults[3] == 'yes' || HeaderThreeResults[3]== 'no')
                                  || (HeaderThreeResults[4] == 'yes' || HeaderThreeResults[4]== 'no')
                                  || (HeaderThreeResults[5] == 'yes' || HeaderThreeResults[5]== 'no')
                                  || (HeaderThreeResults[6] == 'yes' || HeaderThreeResults[6]== 'no')
                                  || (HeaderThreeResults[7] == 'yes' || HeaderThreeResults[7]== 'no')
                                  || (HeaderThreeResults[8] == 'yes' || HeaderThreeResults[8]== 'no')
                              )
                                {
                                  return Colors.orangeAccent;
                                }
                              else
                              {
                                return Colors.blue;
                              }
                            },
                          )

                      ),
                      onPressed:  _enterPPE,
                      child: Text('PPE'))),
              SizedBox(height: 5),
              SizedBox(
                  width: 370,
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center,
                          backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if ((HeaderFourResults[0] == 'yes' || HeaderFourResults[0] == 'no')
                                  && (HeaderFourResults[1] == 'yes' || HeaderFourResults[1]== 'no')
                                  && (HeaderFourResults[2] == 'yes' || HeaderFourResults[2]== 'no')
                                  && (HeaderFourResults[3] == 'yes' || HeaderFourResults[3]== 'no')
                                  && (HeaderFourResults[4] == 'yes' || HeaderTwoResults[4]== 'no')
                                  && (HeaderFourResults[5] == 'yes' || HeaderFourResults[5]== 'no')
                                  && (HeaderFourResults[6] == 'yes' || HeaderFourResults[6]== 'no')
                                  && (HeaderFourResults[7] == 'yes' || HeaderFourResults[7]== 'no')
                                  && (HeaderFourResults[8] == 'yes' || HeaderFourResults[8]== 'no')
                                  && (HeaderFourResults[9] == 'yes' || HeaderFourResults[9]== 'no')
                              )
                              {
                                return Colors.green; // Use the component's default. }
                              }
                              else if ((HeaderFourResults[0] == 'yes' || HeaderFourResults[0] == 'no')
                                  || (HeaderFourResults[1] == 'yes' || HeaderFourResults[1]== 'no')
                                  || (HeaderFourResults[2] == 'yes' || HeaderFourResults[2]== 'no')
                                  || (HeaderFourResults[3] == 'yes' || HeaderFourResults[3]== 'no')
                                  || (HeaderFourResults[4] == 'yes' || HeaderFourResults[4]== 'no')
                                  || (HeaderFourResults[5] == 'yes' || HeaderFourResults[5]== 'no')
                                  || (HeaderFourResults[6] == 'yes' || HeaderFourResults[6]== 'no')
                                  || (HeaderFourResults[7] == 'yes' || HeaderFourResults[7]== 'no')
                                  || (HeaderFourResults[8] == 'yes' || HeaderFourResults[8]== 'no')
                                  || (HeaderFourResults[9] == 'yes' || HeaderFourResults[9]== 'no')
                              )
                              {
                                return Colors.orangeAccent;
                              }
                              else
                              {
                                return Colors.blue;
                              }
                            },
                          )

                      ),
                      onPressed:  _enterMissionDocuments,
                      child: Text('Mission Documents'))),
              SizedBox(height: 5),
              SizedBox(
                  width: 370,
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center,
                          backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if ((HeaderFiveResults[0] == 'yes' || HeaderFiveResults[0] == 'no')
                                  && (HeaderFiveResults[1] == 'yes' || HeaderFiveResults[1]== 'no')
                                  && (HeaderFiveResults[2] == 'yes' || HeaderFiveResults[2]== 'no')
                                  && (HeaderFiveResults[3] == 'yes' || HeaderFiveResults[3]== 'no')
                                  && (HeaderFiveResults[4] == 'yes' || HeaderFiveResults[4]== 'no')
                                  && (HeaderFiveResults[5] == 'yes' || HeaderFiveResults[5]== 'no')
                                  && (HeaderFiveResults[6] == 'yes' || HeaderFiveResults[6]== 'no')
                                  && (HeaderFiveResults[7] == 'yes' || HeaderFiveResults[7]== 'no')
                                  && (HeaderFiveResults[8] == 'yes' || HeaderFiveResults[8]== 'no')
                                  && (HeaderFiveResults[9] == 'yes' || HeaderFiveResults[9]== 'no')
                                  && (HeaderFiveResults[10] == 'yes' || HeaderFiveResults[10]== 'no')
                                  && (HeaderFiveResults[11] == 'yes' || HeaderFiveResults[11]== 'no')
                                  && (HeaderFiveResults[12] == 'yes' || HeaderFiveResults[12]== 'no')
                                  && (HeaderFiveResults[13] == 'yes' || HeaderFiveResults[13]== 'no')
                              )
                              {
                                return Colors.green; // Use the component's default. }
                              }
                              else if ((HeaderFiveResults[0] == 'yes' || HeaderFiveResults[0] == 'no')
                                  || (HeaderFiveResults[1] == 'yes' || HeaderFiveResults[1]== 'no')
                                  || (HeaderFiveResults[2] == 'yes' || HeaderFiveResults[2]== 'no')
                                  || (HeaderFiveResults[3] == 'yes' || HeaderFiveResults[3]== 'no')
                                  || (HeaderFiveResults[4] == 'yes' || HeaderFiveResults[4]== 'no')
                                  || (HeaderFiveResults[5] == 'yes' || HeaderFiveResults[5]== 'no')
                                  || (HeaderFiveResults[6] == 'yes' || HeaderFiveResults[6]== 'no')
                                  || (HeaderFiveResults[7] == 'yes' || HeaderFiveResults[7]== 'no')
                                  || (HeaderFiveResults[8] == 'yes' || HeaderFiveResults[8]== 'no')
                                  || (HeaderFiveResults[9] == 'yes' || HeaderFiveResults[9]== 'no')
                                  || (HeaderFiveResults[10] == 'yes' || HeaderFiveResults[10]== 'no')
                                  || (HeaderFiveResults[11] == 'yes' || HeaderFiveResults[11]== 'no')
                                  || (HeaderFiveResults[12] == 'yes' || HeaderFiveResults[12]== 'no')
                                  || (HeaderFiveResults[13] == 'yes' || HeaderFiveResults[13]== 'no')
                              )
                              {
                                return Colors.orangeAccent;
                              }
                              else
                              {
                                return Colors.blue;
                              }
                            },
                          )

                      ),
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
                      onPressed:  _enterRPASFlow,
                      child: Text('RPAS Setup Flow'))),
              SizedBox(height: 5),
              SizedBox(
                  width: 370,
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center,
                      backgroundColor:
                      MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (payload == 'complete')
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
                      onPressed:  _enterPayloadFlow,
                      child: Text('Payload Setup Flow'))),
              SizedBox(height: 5),
              SizedBox(
                  width: 370,
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center,
                          backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (poweron == 'complete')
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
                      onPressed:  _enterPreFlightFlow,
                      child: Text('Pre-Flight Power On Flow'))),
              SizedBox(height: 5),
              SizedBox(
                  width: 370,
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center,
                          backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if ((HeaderNineResults[0] == 'yes' || HeaderNineResults[0] == 'no')
                                  && (HeaderNineResults[1] == 'yes' || HeaderNineResults[1]== 'no')
                                  && (HeaderNineResults[2] == 'yes' || HeaderNineResults[2]== 'no')
                                  && (HeaderNineResults[3] == 'yes' || HeaderNineResults[3]== 'no')
                                  && (HeaderNineResults[4] == 'yes' || HeaderNineResults[4]== 'no')
                                  && (HeaderNineResults[5] == 'yes' || HeaderNineResults[5]== 'no')
                                  && (HeaderNineResults[6] == 'yes' || HeaderNineResults[6]== 'no')
                                  && (HeaderNineResults[7] == 'yes' || HeaderNineResults[7]== 'no')
                              )
                              {
                                return Colors.green; // Use the component's default. }
                              }
                              else if ((HeaderNineResults[0] == 'yes' || HeaderNineResults[0] == 'no')
                                  || (HeaderNineResults[1] == 'yes' || HeaderNineResults[1]== 'no')
                                  || (HeaderNineResults[2] == 'yes' || HeaderNineResults[2]== 'no')
                                  || (HeaderNineResults[3] == 'yes' || HeaderNineResults[3]== 'no')
                                  || (HeaderNineResults[4] == 'yes' || HeaderNineResults[4]== 'no')
                                  || (HeaderNineResults[5] == 'yes' || HeaderNineResults[5]== 'no')
                                  || (HeaderNineResults[6] == 'yes' || HeaderNineResults[6]== 'no')
                                  || (HeaderNineResults[7] == 'yes' || HeaderNineResults[7]== 'no')
                              )
                              {
                                return Colors.orangeAccent;
                              }
                              else
                              {
                                return Colors.blue;
                              }
                            },
                          )

                      ),
                      onPressed:  _enterPreTakeOffChecklist,
                      child: Text('Pre-Take Off Checklist'))),
              SizedBox(height: 5),
              SizedBox(
                  width: 370,
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center,
                          backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (timeValue!="00:00:00" && buttonText=='Complete')
                              {
                                return Colors.green; // Use the component's default. }
                              }
                              else if(timeValue!="00:00:00"){
                                return Colors.orangeAccent;
                              }
                              else
                              {
                                return Colors.blue;
                              }
                            },
                          )

                      ),
                      onPressed:  _enterTakeOffFlow,
                      child: Text('Flight'))),
              SizedBox(height: 5),
              SizedBox(
                  width: 370,
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center,
                          backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if ((HeaderElevenResults[0] == 'yes' || HeaderElevenResults[0] == 'no')
                                  && (HeaderElevenResults[1] == 'yes' || HeaderElevenResults[1]== 'no')
                                  && (HeaderElevenResults[2] == 'yes' || HeaderElevenResults[2]== 'no')
                                  && (HeaderElevenResults[3] == 'yes' || HeaderElevenResults[3]== 'no')
                                  && (HeaderElevenResults[4] == 'yes' || HeaderElevenResults[4]== 'no')
                                  && (HeaderElevenResults[5] == 'yes' || HeaderElevenResults[5]== 'no')
                              )
                              {
                                return Colors.green; // Use the component's default. }
                              }
                              else if ((HeaderElevenResults[0] == 'yes' || HeaderElevenResults[0] == 'no')
                                  || (HeaderElevenResults[1] == 'yes' || HeaderElevenResults[1]== 'no')
                                  || (HeaderElevenResults[2] == 'yes' || HeaderElevenResults[2]== 'no')
                                  || (HeaderElevenResults[3] == 'yes' || HeaderElevenResults[3]== 'no')
                                  || (HeaderElevenResults[4] == 'yes' || HeaderElevenResults[4]== 'no')
                                  || (HeaderElevenResults[5] == 'yes' || HeaderElevenResults[5]== 'no')
                              )
                              {
                                return Colors.orangeAccent;
                              }
                              else
                              {
                                return Colors.blue;
                              }
                            },
                          )

                      ),
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


