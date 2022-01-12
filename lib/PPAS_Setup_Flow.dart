import 'package:flutter/material.dart';
import 'main.dart';
import 'package:progress_timeline/progress_timeline.dart';
import 'package:flutter/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

var rPASSetupFlow = 'incomplete';

class ScreenPPASFlow extends StatefulWidget {
  @override
  _ScreenPPASFlowState createState() => _ScreenPPASFlowState();
}
class _ScreenPPASFlowState extends State<ScreenPPASFlow> {
  String textHolder = '1/12 \n\nInstall landing gear and confirm clips secured';
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
    SingleState(stateTitle: "Complete"),
  ];


  changeText() {
    setState(() {
      if(screenProgress.state.currentStageIndex == 0){
        textHolder = '1/12 \n\nInstall landing gear and confirm clips secured';
      }
      else if(screenProgress.state.currentStageIndex == 1){
        textHolder = '2/12 \n\nExtend arms and lock twist mechanism on each arm';
      }
      else if(screenProgress.state.currentStageIndex == 2){
        textHolder = '3/12 \n\nInspect arms, landing and chassis for damage, cracks, notable wear, etc.';
      }
      else if(screenProgress.state.currentStageIndex == 3){
      textHolder = '4/12 \n\nInspect motors: check give/resistance of each motor is equal';
      }
      else if(screenProgress.state.currentStageIndex == 4){
        textHolder = '5/12 \n\nPropeller check: flex, leading edge for cracks or breaks';
      }
      else if(screenProgress.state.currentStageIndex == 5){
        textHolder = '6/12 \n\nMatch propellers with motors (black or grey)';
      }
      else if(screenProgress.state.currentStageIndex == 6){
        textHolder = '7/12 \n\nConfirm propellers firmly locked';
      }
      else if(screenProgress.state.currentStageIndex == 7){
        textHolder = '8/12 \n\nInsert SD card and confirm by click';
      }
      else if(screenProgress.state.currentStageIndex == 8){
        textHolder = '9/12 \n\nInspect TB55 (or TB50) batteries for clean contacts, cracks, bulging, etc.';
      }
      else if(screenProgress.state.currentStageIndex == 9){
        textHolder = '10/12 \n\nEnsure batteries are paired correctly';
      }
      else if(screenProgress.state.currentStageIndex == 10){
        textHolder = '11/12 \n\nInstall batteries and confirm they are properly seated (audible click)';
      }
      else if(screenProgress.state.currentStageIndex == 11){
        textHolder = '12/12 \n\nInspect & attach Zenmuse X4s payload if required';
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
    if(screenProgress.state.currentStageIndex < 12) {
      color = Colors.green;
    } else {
      color = Colors.blue;
    }
    return color;
  }

    @override
  void initState() {
    screenProgress = new ProgressTimeline(
      states: allStages,
      iconSize: 50,
    );
    super.initState();
  }

  void _doSomething() {
    rPASSetupFlow = 'complete';
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home(rPASSetupFlow: rPASSetupFlow)));
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
                    style: TextStyle(fontSize: 25),
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
                if(screenProgress.state.currentStageIndex==12){
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


