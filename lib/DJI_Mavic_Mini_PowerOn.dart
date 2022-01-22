import 'package:flutter/material.dart';
import 'main.dart';
import 'package:progress_timeline/progress_timeline.dart';
import 'package:flutter/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'Wayfinder_Power_Page.dart';

//var rPASSetupFlow = 'incomplete';
var mavicMinipower = 'incomplete';

class ScreenMavicMiniPower extends StatefulWidget {
  @override
  _ScreenMavicMiniPowerState createState() => _ScreenMavicMiniPowerState();
}
class _ScreenMavicMiniPowerState extends State<ScreenMavicMiniPower> {
  String textHolder = '1/10 \n\nOpen up CyrstalSky and extend handheld controller antennas';
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
    SingleState(stateTitle: "Complete"),
  ];


  changeText() {
    setState(() {
      //rPASSetupFlow = 'incomplete';
      if(screenProgress.state.currentStageIndex == 0){
        textHolder = '1/10 \n\nOpen up CyrstalSky and extend handheld controller antennas';
      }
      else if(screenProgress.state.currentStageIndex == 1){
        textHolder = '2/10 \n\nConnect handheld controller (USB) to the CrystalSky';
      }
      else if(screenProgress.state.currentStageIndex == 2){
        textHolder = '3/10 \n\nPush and Hold power button to turn on the controller';
      }
      else if(screenProgress.state.currentStageIndex == 3){
        textHolder = '4/10 \n\nPush and Hold power button to turn on the drone';
      }
      else if(screenProgress.state.currentStageIndex == 4){
        textHolder = '5/10 \n\nUse DJI Pilot app on the CrystalSky, should now connect to the Matrice.';
      }
      else if(screenProgress.state.currentStageIndex == 5){
        textHolder = '6/10 \n\nGreen light with Matrice 210 beside it';
      }
      else if(screenProgress.state.currentStageIndex == 6){
        textHolder = '7/10 \n\nCheck to see that you can see via the FPV camera';
      }
      else if(screenProgress.state.currentStageIndex == 7){
        textHolder = '8/10 \n\nEnsure control switches are set properly for operation (switch on top of handheld beside left antenna)';
      }
      else if(screenProgress.state.currentStageIndex == 8){
        textHolder = '9/10 \n\nDouble-Checks: \n - Return to home altitude \n - Flight mode \n - Compass & IMU calibration \n'
            ' - ESC Status \n - Battery level \n - Battery temperature (>60C) \n - Vision sensor \n'
            ' - Control stick mode (standard, flipped, etc.) \n - Remote controller battery';
      }
      else if(screenProgress.state.currentStageIndex == 9){
        textHolder = '10/10 \n\nMenus: \n - Geo-fencing (max altitude, distance from home) \n - What drone does when signal is lost \n - Ensure obstacle avoidance is on \n'
            ' - Check that signal strength is good \n - Ensure appropriate low battery & critical battery warnings';
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
    if(screenProgress.state.currentStageIndex < 10) {
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
    if(screenProgress.state.currentStageIndex==10) {
      poweron = 'complete';
      mavicMinipower = 'complete';
    }
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home(poweron: poweron, mavicMinipower:mavicMinipower)));
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
                          if(screenProgress.state.currentStageIndex==10){
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
