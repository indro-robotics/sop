import 'package:flutter/material.dart';
import 'main.dart';
import 'package:progress_timeline/progress_timeline.dart';
import 'package:flutter/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';



class ScreenPPASFlow extends StatefulWidget {
  @override
  _ScreenPPASFlowState createState() => _ScreenPPASFlowState();
}
class _ScreenPPASFlowState extends State<ScreenPPASFlow> {
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
  ];


  @override
  void initState() {
    screenProgress = new ProgressTimeline(
      states: allStages,
      iconSize: 35,
    );
    super.initState();
  }

  void _doSomething() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home()));
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: screenProgress,
            ),
            SizedBox(
              height: 90,
            ),
            FlatButton(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Goto Next Stage",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              color: Colors.green,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              onPressed: () {
                screenProgress.gotoNextStage();
              },
            ),
            SizedBox(
              height: 50,
            ),
            FlatButton(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Goto Previous Stage",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              color: Colors.green,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              onPressed: () {
                screenProgress.gotoPreviousStage();
              },
            ),
            SizedBox(
              height: 50,
            ),
            FlatButton(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Fail Current Stage",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              color: Colors.green,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              onPressed: () {
                screenProgress.failCurrentStage();
              },
            )
          ],
        ),
      ),
    );
  }
}


