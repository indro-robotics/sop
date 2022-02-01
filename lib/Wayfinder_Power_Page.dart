import 'package:flutter/material.dart';
import 'main.dart';
import 'package:progress_timeline/progress_timeline.dart';
import 'package:flutter/widgets.dart';

//var rPASSetupFlow = 'incomplete';
var wayfinderpower = 'incomplete';

class ScreenWayfinderPower extends StatefulWidget {
  @override
  _ScreenWayfinderPowerState createState() => _ScreenWayfinderPowerState();
}
class _ScreenWayfinderPowerState extends State<ScreenWayfinderPower> {
  String textHolder = '1/24 \n\nPayload secure';
  String submitHolder = 'I Confirm';

  late ProgressTimeline screenProgress;

  List<SingleState> allStages = [
    SingleState(stateTitle: "Stage 1"),
    SingleState(stateTitle: "Stage 2"),
    SingleState(stateTitle: "Stage 3"),
    SingleState(stateTitle: "Stage 4"),
    SingleState(stateTitle: "Stage 5"),
    SingleState(stateTitle: "Stage 6"),
    SingleState(stateTitle: "Stage 7"),
    SingleState(stateTitle: "Stage 8"),
    SingleState(stateTitle: "Stage 9"),
    SingleState(stateTitle: "Stage 10"),
    SingleState(stateTitle: "Stage 11"),
    SingleState(stateTitle: "Stage 12"),
    SingleState(stateTitle: "Stage 13"),
    SingleState(stateTitle: "Stage 14"),
    SingleState(stateTitle: "Stage 15"),
    SingleState(stateTitle: "Stage 16"),
    SingleState(stateTitle: "Stage 17"),
    SingleState(stateTitle: "Stage 18"),
    SingleState(stateTitle: "Stage 19"),
    SingleState(stateTitle: "Stage 20"),
    SingleState(stateTitle: "Stage 21"),
    SingleState(stateTitle: "Stage 22"),
    SingleState(stateTitle: "Stage 23"),
    SingleState(stateTitle: "Stage 24"),
    SingleState(stateTitle: "Complete"),
  ];


  changeText() {
    setState(() {
      //rPASSetupFlow = 'incomplete';
      if(screenProgress.state.currentStageIndex == 0){
        textHolder = '1/24 \n\nPayload secure';
      }
      else if(screenProgress.state.currentStageIndex == 1){
        textHolder = '2/24 \n\nVerify isolator cartirges secure';
      }
      else if(screenProgress.state.currentStageIndex == 2){
        textHolder = '3/24 \n\nRadio controller on, verify transmission and battery levels';
      }
      else if(screenProgress.state.currentStageIndex == 3){
        textHolder = '4/24 \n\nSelect appropriate radio controller model';
      }
      else if(screenProgress.state.currentStageIndex == 4){
        textHolder = '5/24 \n\nBattery voltage above 48v';
      }
      else if(screenProgress.state.currentStageIndex == 5){
        textHolder = '6/24 \n\nBattery packs secure';
      }
      else if(screenProgress.state.currentStageIndex == 6){
        textHolder = '7/24 \n\nCheck battery leads and connect';
      }
      else if(screenProgress.state.currentStageIndex == 7){
        textHolder = '8/24 \n\nInitialize flight controller (DO NOT MOVE AIRCRAFT)';
      }
      else if(screenProgress.state.currentStageIndex == 8){
        textHolder = '9/24 \n\nCheck condition of 8 blade dampers';
      }
      else if(screenProgress.state.currentStageIndex == 9){
        textHolder = '10/24 \n\nOrientation lights solid and dim';
      }
      else if(screenProgress.state.currentStageIndex == 10){
        textHolder = '11/24 \n\nReceiver bound to aircraft';
      }
      else if(screenProgress.state.currentStageIndex == 11){
        textHolder = '12/24 \n\nQGroundControl connected, no warnings';
      }
      else if(screenProgress.state.currentStageIndex == 12){
        textHolder = '13/24 \n\nCompass calibration check and calibrate if necessary';
      }
      else if(screenProgress.state.currentStageIndex == 13){
        textHolder = '14/24 \n\nRadio control range check as required';
      }
      else if(screenProgress.state.currentStageIndex == 14){
        textHolder = '15/24 \n\nSet Mode switch to Manual';
      }
      else if(screenProgress.state.currentStageIndex == 15){
        textHolder = '16/24 \n\nHome switch Up/Off position';
      }
      else if(screenProgress.state.currentStageIndex == 16){
        textHolder = '17/24 \n\nRadio controller verify correct model';
      }
      else if(screenProgress.state.currentStageIndex == 17){
        textHolder = '18/24 \n\nTelemetry check';
      }
      else if(screenProgress.state.currentStageIndex == 18){
        textHolder = '19/24 \n\nGPS signal locked (green light)';
      }
      else if(screenProgress.state.currentStageIndex == 19){
        textHolder = '20/24 \n\nCheck orientation and ARM';
      }
      else if(screenProgress.state.currentStageIndex == 20){
        textHolder = '21/24 \n\nVerify orientation lights';
      }
      else if(screenProgress.state.currentStageIndex == 21){
        textHolder = '22/24 \n\nVeryify motor operation';
      }
      else if(screenProgress.state.currentStageIndex == 22){
        textHolder = '23/24 \n\nVerify flight controls';
      }
      else if(screenProgress.state.currentStageIndex == 23){
        textHolder = '24/24 \n\nThrottle at minimum';
      }
      else{
        textHolder = 'Completed!';
        submitHolder = 'Submit';
      }
    });
  }
  Color getColor(){
    //red is just a sample color
    Color color;
    if(screenProgress.state.currentStageIndex < 24) {
      color = Colors.green;
    } else {
      color = Colors.blue;
    }
    return color;
  }

  @override
  void initState() {
    //rPASSetupFlow = 'incomplete';
    screenProgress = new ProgressTimeline(
      states: allStages,
      iconSize: 50,
    );
    super.initState();
  }

  void _doSomething() {
    if(screenProgress.state.currentStageIndex==24) {
      poweron = 'complete';
      wayfinderpower = 'complete';
    }
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home(poweron: poweron, wayfinderpower:wayfinderpower)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text(
          'indrorobotics.ca',
        ),
      ),
      body: Center(
        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                height: 300,
                child: Text('$textHolder',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center)),
            //Text(screenProgress.state.currentStageIndex == 0 ? 'Install landing gear and confirm clips secured' : ""),
            //Text(screenProgress.state.currentStageIndex == 1 ? 'Extend arms and lock twist mechanism on each arm' : ""),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: screenProgress,
            ),
            SizedBox(
              height: 80,
            ),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Back",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              color: Colors.green,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              onPressed: () {
                if(screenProgress.state.currentStageIndex==0){
                  _doSomething();
                }
                screenProgress.gotoPreviousStage();
                changeText();
              },
            ),
            FlatButton(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "$submitHolder",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              color: getColor(),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              //onPressed: (screenProgress.state.currentStageIndex == 12)? _doSomething : null,
              onPressed: () {
                if(screenProgress.state.currentStageIndex==24){
                  _doSomething();
                }
                screenProgress.gotoNextStage();
                changeText();
              },
            ),]))
          ],
        ),
      ),
    );
  }
}
