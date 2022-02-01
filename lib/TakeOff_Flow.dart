import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:async';
import 'emergencyPage.dart';

var flightTime = '';
enum CustomTimerState { reset, paused, counting, finished }

bool isStartPressed= false;
bool isStopPressed= false;
bool isResetPressed= false;
String timeValue="00:00:00";
Stopwatch stopwatch = Stopwatch();
final duration  = const Duration(seconds:1);
String ButtonVal = 'Begin Flight';


String buttonText = 'Start';
Color buttonColor = Colors.green;
String header = "Ready For Take-Off";
String body = 'Please have pre-flight requirements completed';
String backgroundImage = 'assets/images/bottom2.jpg';
//Icon buttonIcon = Icon(flight_takeoff);

IconData buttonIcon = Icons.airplanemode_on;


class ScreenTakeOffFlow extends StatefulWidget {
  @override
  _ScreenTakeOffFlowState createState() => _ScreenTakeOffFlowState();
}

var flightVal = 0;
class _ScreenTakeOffFlowState extends State<ScreenTakeOffFlow> with TickerProviderStateMixin{
  //var flightVal = 0;


  void callTimer(){
    Timer(duration, keepRunningStopWatch);
  }

  void keepRunningStopWatch(){
    setState((){
      timeValue =getStopwatchValue();
    });
    callTimer();

  }

  String getStopwatchValue(){
    return (
        stopwatch.elapsed.inHours.toString().padLeft(2,"0") + ":"
            + (stopwatch.elapsed.inMinutes%60).toString().padLeft(2,"0")+":"
            +(stopwatch.elapsed.inSeconds%60).toString().padLeft(2,"0")
    );
  }

  void startStopWatch(){
    //int flightVal = 0;


    setState((){
      isStartPressed=true;
    });
    stopwatch.start();
    callTimer();
    // window.console.debug('startStopwatch called');
  }

  void stopStopWatch(){
    stopwatch.stop();
  }

  void resetStopWatch(){
    stopwatch.reset();
  }

  void _emergency(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>EmergencyScreen()));
  }

  @override
  Widget build(BuildContext context) {
    if (isStartPressed) {
      startStopWatch();
    }
    return Material(
    child: Container(
        width: 450,
        height: 800,
        child: Column(
            children: <Widget>[
              Expanded(
                flex: 14,
                child: Container(
                    constraints: BoxConstraints.expand(),
                  decoration:BoxDecoration(
                    image:DecorationImage(
                      image:AssetImage(backgroundImage),
                      fit: BoxFit.cover
                    )
                  ),
                  //color: buttonColor,
                    width: 450,
                  child: Column(
                      children: <Widget>[
                      Expanded(
                      flex: 1,
                      child: Container(
                        //color: buttonColor,
                      )//child: Text("top"))
                      ),

                      Expanded(
                          flex: 7,
                          child: Container(
                              width: 450,
                              child: Row(
                                  children: <Widget>[
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            //color: buttonColor,
                                        )//child: Text("left"))
                                    ),
                                    Expanded(
                                        flex: 6,
                                        child: Column(
                                            children: <Widget>[
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                      //color: buttonColor,
                                                      child: Text(
                                                          header, style: const TextStyle(
                                                          fontSize: 25.0
                                                      ))
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 7,
                                                  child: Container(
                                                      //color: buttonColor,
                                                      child: Text(
                                                          body, style: const TextStyle(
                                                          fontSize: 12.0
                                                      ))
                                                  )
                                              )
                                            ])
                                        /*child: Container(
                                            color: buttonColor,
                                            child: Text(
                                                ButtonVal, style: const TextStyle(
                                                fontSize: 20.0
                                            ))
                                        )*/
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            //color: buttonColor,
                                        )//child: Text("right"))
                                    ),
                                  ]))
                              //color: buttonColor,
                              //child: Text("mid"))
                      ),

                      Expanded(
                          flex: 1,
                          child: Container(
                              width: 450,
                              child: Row(
                                  children: <Widget>[
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            //color: buttonColor,
                                            //child: Text("mid")

                                        )
                                    ),
                                    Expanded(
                                        flex: 4,
                                        child: Container(
                                            //color: buttonColor,
                                            child:ElevatedButton(

                                                style: ButtonStyle(alignment: Alignment.center,
                                                  backgroundColor:
                                                  MaterialStateProperty.resolveWith<Color>(
                                                        (Set<MaterialState> states) {
                                                      return Colors.red; // Use the component's default. }
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
                                                onPressed: _emergency,
                                                child: Text('Emergency Procedures'))
                                        )

                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            //color: buttonColor,
                                        )//child: Text("right"))
                                    ),
                                  ]))
                      )


                      ])
                  /*child: Center(
                    child: Text("Begin Flight", style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black
                    )),
                  ),*/
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                      color: Colors.white,
                      child: Center(
                          child: Text(
                              "Flight Time: ${timeValue}", style: TextStyle(
                              fontSize: 20.0
                          ))
                        //)
                      )
                  )
              ),
              Expanded(
                  flex: 4,
                  child: Container(
                      color: Colors.white,
                      child: getButtons()
                  )
              )
            ]
        )
    )
    );
  }


  Widget getButtons() {
      return Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //IconButton(
                //  icon: Icon(Icons.refresh),
                //  onPressed: (){resetStopWatch();isStartPressed= false;}),
                RaisedButton(
                    child: Text('Back'),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Home()));
                      //stopStopWatch();
                      //isStartPressed = false;
                    }
                ),
                MaterialButton(
                  shape: CircleBorder(),
                    onPressed: () {
                      setState(() {
                        if(buttonText=='Start'){
                          buttonText = 'In Flight';
                          buttonColor = Color(0xFFFFF59D);
                          //buttonIcon = Icons.flight_outlined;
                          buttonIcon = Icons.arrow_forward_outlined;
                          header = 'Take Off Flow';
                          backgroundImage = 'assets/images/bottom2.jpg';
                          body = '1.  Assemble control unit, display, and related gear\n'
                              '2.   Prepare drone for launch\n'
                              '3.   Activate drone, control unit, and display device\n'
                              '4.   Launch drone control app on phone\n'
                              '5.   confirm control unit and drone communication connection is working\n'
                              '6.   Ensure all control switches are correctly set for operation\n'
                              '7.   Check that compass, IMU, and gimbal calibration are ok\n'
                              '8.   Ensure Return-to-Home parameters are correct\n'
                              '9.   Ensure sufficient GPS satellites are connected (minimum 7)\n'
                              '10.  Final weather check (-20>weather>+50, ceiling>1000, visibility>3SM) \n'
                              '11.  Signal to crew and bystanders to stand clear\n'
                              '12.  Start camera recording if applicable\n'
                              '13.  Announce take-off and stand clear\n'
                              '14.  Activate take-off controls\n'
                              '15.  Allow drone to hover at low altitude to confirm stability before further flight\n'
                              '16.  Call ATC for permission to take-off\n'
                              '17.  VO to initiate check-in call with PIC/VO at launch site every two minutes via long-range radio or cell';
                          //flightVal == 1;
                          isStartPressed = true;
                          startStopWatch();
                        }
                        else if(buttonText=='In Flight'){
                          buttonText= 'Landing';
                          buttonColor = Color(0xFFB3E5FC);
                          //buttonIcon = Icons.flight_land;
                          buttonIcon = Icons.arrow_forward_outlined;
                          header = 'In-Flight Monitoring';
                          backgroundImage = 'assets/images/bottom2.jpg';
                          body = '1.  Aircraft Mode - Usually either Take-off, Auto, Mission, Manual, Position, Atti, Alt-hold, GPS\n'
                        '2.   Number of satellites tracking/locked\n'
                        '3.   Strength of video signal\n'
                        '4.   Strength of C2 link\n'
                        '5.   Aircraft altitude, speed, distance and direction\n'
                        '6.   Remaining flight time (if available)\n'
                        '7.   Status of proximity sensors (if available)\n'
                        '8.   Status of payload (taking photos, video as required)\n'
                        '9.   RTK function (if available) on/off\n'
                        '10.  Battery % and (preferably) voltage for each battery (if available)';
                          //flightVal ==2;
                        }
                        else if(buttonText=='Landing'){
                          buttonText= 'End Flight';
                          //buttonColor = Color(0xFFf7b3c2);
                          buttonColor = Colors.redAccent;
                          //buttonIcon = Icons.airplanemode_on;
                          buttonIcon = Icons.arrow_forward_outlined;
                          header = 'Landing Flow';
                          backgroundImage = 'assets/images/bottom2.jpg';
                          body = '1.  Wind  (RESPONSE "Out of the \'direction\' and \'approximate speed\'")\n'
                        '2.   Battery   (RESPONSE "n bars or remaining % and flight time (if available)")\n'
                        '3.   Air Traffic   (RESPONSE Check area and "Air traffic clear" OR DIVERT TO ALTERNATE LANDING AREA)\n'
                        '4.   Landing Area    (RESPONSE Check area and "Area clear" OR DIVERT TO ALTERNATE LANDING AREA)\n'
                        '5.   MODE    (RESPONSE "P-GPS" and if not SWITCH TO P-GPS)\n'
                        '6.   Cleared Landing   (RESPONSE Check that no one is within 10ft or 3m and "Cleared for landing and LANDING!"';
                          //flightVal ==2;
                        }/*
                        else if(buttonText=='End Flight'){
                          buttonText= 'Complete';
                          buttonColor = Colors.redAccent;
                          buttonIcon = Icons.flight_land;
                          header = 'Grounded';
                          //flightVal ==2;
                        }*/
                        else if(buttonText =='End Flight'){
                          buttonText = 'Complete';
                          buttonColor = Colors.grey;
                          //buttonIcon = Icons.airplanemode_off;
                          buttonIcon = Icons.arrow_forward_outlined;
                          header = 'Flight Completed';
                          backgroundImage = 'assets/images/bottom2.jpg';
                          body = 'Please return home and complete landing checklist';
                          isStartPressed = false;
                          stopStopWatch();

                          //Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Home()));
                          //flightVal==1;
                        }
                        else {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Home()));
                          //Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Home()));
                          //flightVal==1;
                        }
                        //startStopWatch();
                        //isStartPressed = true;
                      });
                    },
                  color: buttonColor,
                      child: Container(
                      width: 120,
                      height: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Text(buttonText,
                        style: TextStyle(fontSize: 24)),
                        Icon(buttonIcon),],), // text
                      ),
                ),
                RaisedButton(
                    child: Text('Restart'),
                    onPressed: () {
                      resetStopWatch();
                      stopStopWatch();
                      isStartPressed = false;
                      setState(() {
                        buttonText = 'Start';
                        buttonColor = Colors.green;
                        buttonIcon = Icons.flight_takeoff;
                        header = "Ready For Take-Off";
                        body = 'Please have pre-flight requirements completed';
                        backgroundImage = 'assets/images/bottom2.jpg';
                        });
                    }
                )
              ]
          )
      );
  }
}












