import 'package:flutter/material.dart';
import 'main.dart';
import 'package:progress_timeline/progress_timeline.dart';
import 'package:flutter/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'Wayfinder_Power_Page.dart';

//var rPASSetupFlow = 'incomplete';
var matrice300power = 'incomplete';

class ScreenMatrice300Power extends StatefulWidget {
  @override
  _ScreenMatrice300PowerState createState() => _ScreenMatrice300PowerState();
}
class _ScreenMatrice300PowerState extends State<ScreenMatrice300Power> {
  String textHolder = '1/15 \n\nInstall WB37 battery in the back of the ground controller unit(s)';
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
    SingleState(stateTitle: "Complete"),
  ];


  changeText() {
    setState(() {
      //rPASSetupFlow = 'incomplete';
      if(screenProgress.state.currentStageIndex == 0){
        textHolder = '1/15 \n\nInstall WB37 battery in the back of the ground controller unit(s)';
      }
      else if(screenProgress.state.currentStageIndex == 1){
        textHolder = '2/15 \n\nAssemble control unit and ensure correct positioning of antenna.';
      }
      else if(screenProgress.state.currentStageIndex == 2){
        textHolder = '3/15 \n\nPower on control unit';
      }
      else if(screenProgress.state.currentStageIndex == 3){
        textHolder = '4/15 \n\nPower on drone';
      }
      else if(screenProgress.state.currentStageIndex == 4){
        textHolder = '5/15 \n\nEnsure DJI Pilot app is connected to the aircraft and payload(s)';
      }
      else if(screenProgress.state.currentStageIndex == 5){
        textHolder = '6/15 \n\nEnsure video feed via the FPV camera and payload(s)';
      }
      else if(screenProgress.state.currentStageIndex == 6){
        textHolder = '7/15 \n\nEnsure mode control switch is set properly for operation (P-Mode)';
      }
      else if(screenProgress.state.currentStageIndex == 7){
        textHolder = '8/15 \n\n\n\nDouble-Checks: \n - Return to home altitude \n - Flight mode \n - Compass & IMU calibration \n'
            ' - ESC Status \n - Battery level \n - Battery temperature (>60C) \n - Vision sensor \n'
            ' - Control stick mode (standard, flipped, etc.) \n - Remote controller battery';
      }
      else if(screenProgress.state.currentStageIndex == 8){
        textHolder = '9/15 \n\nMenus: \n - Geo-fencing (max altitude, distance from home) \n - What drone does when signal is lost \n - Ensure obstacle avoidance is on \n'
            ' - Check that signal strength is good \n - Ensure appropriate low battery & critical battery warningsy';
      }
      else if(screenProgress.state.currentStageIndex == 9){
        textHolder = '10/15 \n\nEnsure sufficient GPS satellites (minimum 7)';
      }
      else if(screenProgress.state.currentStageIndex == 10){
        textHolder = '11/15 \n\nConfirm camera settings (interval, date stamp, exposure).';
      }
      else if(screenProgress.state.currentStageIndex == 11){
        textHolder = '12/15 \n\nFormat SD card as required';
      }
      else if(screenProgress.state.currentStageIndex == 12){
        textHolder = '13/15 \n\nTurn on strobes.';
      }
      else if(screenProgress.state.currentStageIndex == 13){
        textHolder = '14/15 \n\nDouble check automated mission parameters ( altitude,  speed, overlap, mission time).';
      }
      else if(screenProgress.state.currentStageIndex == 14){
        textHolder = '15/15 \n\nConfirm mission uploaded to aircraft';
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
    if(screenProgress.state.currentStageIndex < 15) {
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
    if(screenProgress.state.currentStageIndex==15) {
      poweron = 'complete';
      matrice300power = 'complete';
    }
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home(poweron: poweron, matrice300power:matrice300power)));
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
                if(screenProgress.state.currentStageIndex==15){
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
