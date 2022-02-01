import 'package:flutter/material.dart';
import 'main.dart';
import 'package:progress_timeline/progress_timeline.dart';
import 'package:flutter/widgets.dart';

//var rPASSetupFlow = 'incomplete';
var matrice = 'incomplete';

class ScreenPPASFlow extends StatefulWidget {
  @override
  _ScreenPPASFlowState createState() => _ScreenPPASFlowState();
}
class _ScreenPPASFlowState extends State<ScreenPPASFlow> {
  String textHolder = '1/12 \n\nInsert leg into side slot & flip clips down (twice, once for each leg)';
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
      //rPASSetupFlow = 'incomplete';
      if(screenProgress.state.currentStageIndex == 0){
        textHolder = '1/12 \n\nInsert leg into side slot & flip clips down (twice, once for each leg)';
      }
      else if(screenProgress.state.currentStageIndex == 1){
        textHolder = '2/12 \n\nInspect & attach required payloads';
      }
      else if(screenProgress.state.currentStageIndex == 2){
        textHolder = '3/12 \n\nExtend propeller arms to the side, twist to lock (four times, once for each propeller arm)';
      }
      else if(screenProgress.state.currentStageIndex == 3){
      textHolder = '4/12 \n\nInspect arms, legs and chassis for damage, notable wear, etc.';
      }
      else if(screenProgress.state.currentStageIndex == 4){
        textHolder = '5/12 \n\nInspect motors: check give/resistance of each motor is equal';
      }
      else if(screenProgress.state.currentStageIndex == 5){
        textHolder = '6/12 \n\nPropeller check: leading edge, cracks or breaks';
      }
      else if(screenProgress.state.currentStageIndex == 6){
        textHolder = '7/12 \n\nPlace propellers by matching colour (black or grey) to the appropriate clockwise or counterclockwise arm';
      }
      else if(screenProgress.state.currentStageIndex == 7){
        textHolder = '8/12 \n\nPropellers require you to push then turn to lock (as indicated on the propeller - one set clockwise, the other counterclockwise)';
      }
      else if(screenProgress.state.currentStageIndex == 8){
        textHolder = '9/12 \n\nPut SD card in the drone (located on left side of the chassis) (will click when placed properly)';
      }
      else if(screenProgress.state.currentStageIndex == 9){
        textHolder = '10/12 \n\nInspect TB55 (or TB50) batteries for cracks, buldging, etc.';
      }
      else if(screenProgress.state.currentStageIndex == 10){
        textHolder = '11/12 \n\nEnsure batteries were paired in the charger so they are at the same point in their lifecycle (labelled as such) (label for battery pairs)';
      }
      else if(screenProgress.state.currentStageIndex == 11){
        textHolder = '12/12 \n\nInstall the batteries by sliding them in from the back on the lowest point of the chassis.';
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
    //rPASSetupFlow = 'incomplete';
    screenProgress = new ProgressTimeline(
      states: allStages,
      iconSize: 50,
    );
    super.initState();
  }

  void _doSomething() {
    if(screenProgress.state.currentStageIndex==12) {
      rPASSetupFlow = 'complete';
      matrice = 'complete';
    }
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home(rPASSetupFlow: rPASSetupFlow, matrice:matrice)));
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
                if(screenProgress.state.currentStageIndex==12){
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


