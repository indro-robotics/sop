import 'package:flutter/material.dart';
import 'main.dart';
import 'package:progress_timeline/progress_timeline.dart';
import 'package:flutter/widgets.dart';

//var rPASSetupFlow = 'incomplete';
var Zenmuse = 'incomplete';

class ScreenZenmuseFlow extends StatefulWidget {
  @override
  _ScreenZenmuseState createState() => _ScreenZenmuseState();
}
class _ScreenZenmuseState extends State<ScreenZenmuseFlow> {
  String textHolder = '1/5 \n\nLock and unlock on top of camera is lined up with circle on mounting bracket (slot 1)';
  String submitHolder = 'I Confirm';

  late ProgressTimeline screenProgress;

  List<SingleState> allStages = [
    SingleState(stateTitle: "Stage 1"),
    SingleState(stateTitle: "Stage 2"),
    SingleState(stateTitle: "Stage 3"),
    SingleState(stateTitle: "Stage 4"),
    SingleState(stateTitle: "Stage 5"),
    SingleState(stateTitle: "Complete"),
  ];


  changeText() {
    setState(() {
      //rPASSetupFlow = 'incomplete';
      if(screenProgress.state.currentStageIndex == 0){
        textHolder = '1/5 \n\nLock and unlock on top of camera is lined up with circle on mounting bracket (slot 1)';
      }
      else if(screenProgress.state.currentStageIndex == 1){
        textHolder = '2/5 \n\nPush upwards into the slot and turn counterclockwise (match up the circles)';
      }
      else if(screenProgress.state.currentStageIndex == 2){
        textHolder = '3/5 \n\nIf mounted correctly, it will automatically rotate to calibrate itself';
      }
      else if(screenProgress.state.currentStageIndex == 3){
        textHolder = '4/5 \n\nZenmuse is a discontinued camera so wont automatically identify it; must go into settings and register it as a custom camera';
      }
      else if(screenProgress.state.currentStageIndex == 4){
        textHolder = '5/5 \n\nCheck that custom camera profile for Zenmuse X4S is there, if not, refer to training guide about adding custom cameras';
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
    if(screenProgress.state.currentStageIndex < 5) {
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
    if(screenProgress.state.currentStageIndex==5) {
      payload = 'complete';
      Zenmuse = 'complete';
    }
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home(payload:payload, Zenmuse:Zenmuse)));
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
                if(screenProgress.state.currentStageIndex==5){
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
