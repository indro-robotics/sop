import 'package:flutter/material.dart';
import 'main.dart';
import 'package:progress_timeline/progress_timeline.dart';
import 'package:flutter/widgets.dart';

//var rPASSetupFlow = 'incomplete';
var matrice300 = 'incomplete';

class ScreenMatrice300Flow extends StatefulWidget {
  @override
  _ScreenMatrice300FlowState createState() => _ScreenMatrice300FlowState();
}
class _ScreenMatrice300FlowState extends State<ScreenMatrice300Flow> {
  String textHolder = '1/10 \n\nInstall landing gear and ensure rotating locks are tight';
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
    SingleState(stateTitle: "Complete"),
  ];


  changeText() {
    setState(() {
      //rPASSetupFlow = 'incomplete';
      if(screenProgress.state.currentStageIndex == 0){
        textHolder = '1/14 \n\nInstall landing gear and ensure rotating locks are tight';
      }
      else if(screenProgress.state.currentStageIndex == 1){
        textHolder = '2/14 \n\nRemove aircraft from case and inspect for any damages';
      }
      else if(screenProgress.state.currentStageIndex == 2){
        textHolder = '3/14 \n\nExtend propeller arms, twist locks tight ';
      }
      else if(screenProgress.state.currentStageIndex == 3){
        textHolder = '4/14 \n\nInspect arms, legs and chassis for damage, notable wear, etc.';
      }
      else if(screenProgress.state.currentStageIndex == 4){
        textHolder = '5/14 \n\nPropeller check: leading edge, cracks or breaks';
      }
      else if(screenProgress.state.currentStageIndex == 5){
        textHolder = '6/14 \n\nInspect motors: check give/resistance of each motor is equal';
      }
      else if(screenProgress.state.currentStageIndex == 6){
        textHolder = '7/14 \n\nInspect & attach required payload(s)';
      }
      else if(screenProgress.state.currentStageIndex == 7){
        textHolder = '8/14 \n\nEnsure gimbal is secure and lens cap removed.';
      }
      else if(screenProgress.state.currentStageIndex == 8){
        textHolder = '9/14 \n\nInsert SD card in the payload as required';
      }
      else if(screenProgress.state.currentStageIndex == 9){
        textHolder = '10/14 \n\nInstall aircraft batteries.';
      }
      else if(screenProgress.state.currentStageIndex == 10){
        textHolder = '11/14 \n\nPosition aircraft on launch pad.';
      }
      else if(screenProgress.state.currentStageIndex == 11){
        textHolder = '12/14 \n\nInspect TB60 batteries for cracks, buldging, etc.';
      }
      else if(screenProgress.state.currentStageIndex == 12){
        textHolder = '13/14 \n\nEnsure batteries were paired in the charger so they are at the same point in their lifecycle ';
      }
      else if(screenProgress.state.currentStageIndex == 13){
        textHolder = '14/14 \n\nInstall the batteries by sliding them in from the back and locking the rotating lever';
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
    if(screenProgress.state.currentStageIndex < 14) {
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
    if(screenProgress.state.currentStageIndex==14) {
      rPASSetupFlow = 'complete';
      matrice300 = 'complete';
    }
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home(poweron: poweron, matrice300:matrice300)));
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
                if(screenProgress.state.currentStageIndex==14){
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
