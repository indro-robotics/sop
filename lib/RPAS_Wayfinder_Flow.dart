import 'package:flutter/material.dart';
import 'main.dart';
import 'package:progress_timeline/progress_timeline.dart';
import 'package:flutter/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

//var rPASSetupFlow = 'incomplete';
var wayfinder = 'incomplete';

class ScreenWayfinderFlow extends StatefulWidget {
  @override
  _ScreenWayfinderFlowState createState() => _ScreenWayfinderFlowState();
}
class _ScreenWayfinderFlowState extends State<ScreenWayfinderFlow> {
  String textHolder = '1/9 \n\nRemove aircraft from cased';
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
    SingleState(stateTitle: "Complete"),
  ];


  changeText() {
    setState(() {
      //rPASSetupFlow = 'incomplete';
      if(screenProgress.state.currentStageIndex == 0){
        textHolder = '1/9 \n\nRemove aircraft from case';
      }
      else if(screenProgress.state.currentStageIndex == 1){
        textHolder = '2/9 \n\nRemove prop straps';
      }
      else if(screenProgress.state.currentStageIndex == 2){
        textHolder = '3/9 \n\nUnfold booms';
      }
      else if(screenProgress.state.currentStageIndex == 3){
        textHolder = '4/9 \n\nInspect arms, legs and chassis for damage, notable wear, etc.';
      }
      else if(screenProgress.state.currentStageIndex == 4){
        textHolder = '5/9 \n\nInspect motors: check give/resistance of each motor is equal';
      }
      else if(screenProgress.state.currentStageIndex == 5){
        textHolder = '6/9 \n\nPropeller check: leading edge, cracks or breaks';
      }
      else if(screenProgress.state.currentStageIndex == 6){
        textHolder = '7/9 \n\nInspect receivers and wiring';
      }
      else if(screenProgress.state.currentStageIndex == 7){
        textHolder = '8/9 \n\nSelect and install isolator cartridges as necessary';
      }
      else if(screenProgress.state.currentStageIndex == 8){
        textHolder = '9/9 \n\nConfigure payload mounting location as necessary';
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
    if(screenProgress.state.currentStageIndex < 8) {
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
    if(screenProgress.state.currentStageIndex==8) {
      rPASSetupFlow = 'complete';
      wayfinder = 'complete';
    }
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home(rPASSetupFlow: 'complete', wayfinder:wayfinder)));
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
                if(screenProgress.state.currentStageIndex==8){
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


