import 'package:flutter/material.dart';
import 'text_fields.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'emailNav.dart';
import 'loginNav.dart';
import 'main.dart';
import 'dart:async';
import 'timer_builder.dart';

var flightTime = '';
enum CustomTimerState { reset, paused, counting, finished }

bool isStartPressed= false;
bool isStopPressed= false;
bool isResetPressed= false;
String timeValue="00:00:00";
Stopwatch stopwatch = Stopwatch();
final duration  = const Duration(seconds:1);
String ButtonVal = 'Start Flight';

class ScreenTakeOffFlow extends StatefulWidget {
  @override
  _ScreenTakeOffFlowState createState() => _ScreenTakeOffFlowState();
}

var flightVal = 0;
class _ScreenTakeOffFlowState extends State<ScreenTakeOffFlow> with TickerProviderStateMixin{
  //var flightVal = 0;
  String buttonText = 'Start Flight';
  Color buttonColor = Colors.redAccent;
  //Icon buttonIcon = Icon(flight_takeoff);

  IconData buttonIcon = Icons.flight_takeoff;

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
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Home()));
  }
  @override
  Widget build(BuildContext context){
    if(isStartPressed){
      startStopWatch();
    }
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          //leading: Icon(Icons.accessibility),
          backgroundColor: Colors.orangeAccent,
          centerTitle: true,
          title: Text(
            'indrorobotics.ca',
          ),
          actions:<Widget>[
            IconButton(
              color:Colors.red,
              icon: Icon(Icons.error_outlined),
              onPressed: _emergency,
            ),
          ],
        ),
    body: Container(
        width:450,
        height:800,
        child:Column(
            children:<Widget>[
              //SizedBox(height: 10),
              /*Expanded(
                  flex:1,
                  child:Container(
                      color:Colors.orangeAccent,
                      child:Center(
                          child:Text("Flight Time: ${timeValue}", style:TextStyle(
                              fontSize:25.0
                          ))
                      //)
                  )
              ),),*/
              Expanded(
                  flex:4,
                  child:Container(
                      color:Colors.orangeAccent,
                      child:Center(
                          child:Text("Start Flight", style:TextStyle(
                              fontSize:30.0,
                            color: Colors.black
                          )),
                      ),
                  ),
              ),
              Expanded(
                  flex:1,
                  child:Container(
                      color:Colors.white,
                      child:Center(
                          child:Text("Flight Time: ${timeValue}", style:TextStyle(
                              fontSize:25.0
                          ))
                        //)
                      )
                  )
              ),
              Expanded(
                  flex:2,
                  child:Container(
                      color:Colors.white,
                      child:getButtons()
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
                        if(buttonText=='Start Flight'){
                          buttonText = 'Start Landing';
                          buttonColor = Colors.orange;
                          buttonIcon = Icons.flight_outlined;
                          //flightVal == 1;
                        }
                        else if(buttonText=='Start Landing'){
                          buttonText= 'End Flight';
                          buttonColor = Colors.green;
                          buttonIcon = Icons.flight_land;
                          //flightVal ==2;
                        }
                        else{
                          buttonText = 'Start Flight';
                          buttonColor = Colors.redAccent;
                          buttonIcon = Icons.flight_takeoff;
                          stopStopWatch();
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Home()));
                          //flightVal==1;
                        }
                        startStopWatch();
                        isStartPressed = false;
                      });
                    },
                  color: buttonColor,
                      child: Container(
                      width: 150,
                      height: 150,
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
                        buttonText = 'Start Flight';
                        buttonColor = Colors.redAccent;
                        buttonIcon = Icons.flight_takeoff;
                        });
                    }
                )
              ]
          )
      );
  }

}












