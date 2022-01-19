import 'package:flutter/material.dart';
import 'main.dart';
import 'package:progress_timeline/progress_timeline.dart';
import 'package:flutter/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'Wayfinder_Power_Page.dart';
import 'Payload_Setup_Flow.dart';

//var rPASSetupFlow = 'incomplete';
var micaSense = 'incomplete';

class ScreenMicaSenseFlow extends StatefulWidget {
  @override
  _ScreenMicaSenseFlowState createState() => _ScreenMicaSenseFlowState();
}
class _ScreenMicaSenseFlowState extends State<ScreenMicaSenseFlow> {
  String textHolder = '1/7 \n\nClick in the 3D printed mount for camera onto drone mounting bracket';
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
    SingleState(stateTitle: "Complete"),
  ];


  changeText() {
    setState(() {
      //rPASSetupFlow = 'incomplete';
      if(screenProgress.state.currentStageIndex == 0){
        textHolder = '1/7 \n\nClick in the 3D printed mount for camera onto drone mounting bracket';
      }
      else if(screenProgress.state.currentStageIndex == 1){
        textHolder = '2/7 \n\nMount GPS and DLS (downward light sensor) on the top of drone chassis via screw mounts';
      }
      else if(screenProgress.state.currentStageIndex == 2){
        textHolder = '3/7 \n\nInsert SD-HC (gold) card';
      }
      else if(screenProgress.state.currentStageIndex == 3){
        textHolder = '4/7 \n\nWhen you turn it on, it makes a wifi network, join network via phone with password: micasense';
      }
      else if(screenProgress.state.currentStageIndex == 4){
        textHolder = '5/7 \n\nUse IP address 192.168.10.254 in browser to get into MicaSense app';
      }
      else if(screenProgress.state.currentStageIndex == 5){
        textHolder = '6/7 \n\nTo trigger calibration, need to pick up the drone and take the photo without blocking the DLS';
      }
      else if(screenProgress.state.currentStageIndex == 6){
        textHolder = '7/7 \n\nSet it back down and return to drone Setup/Power On flows';
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
    if(screenProgress.state.currentStageIndex < 7) {
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
    payload = 'complete';
    micaSense = 'complete';

    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home(payload:payload, micaSense:micaSense)));
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
                if(screenProgress.state.currentStageIndex==7){
                  _doSomething();
                }
                screenProgress.gotoNextStage();
                changeText();
              },
            ),
          ],
        ),
      ),
    );
  }
}
