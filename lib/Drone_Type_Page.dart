import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'PPAS_Setup_Flow.dart';
import 'RPAS_Wayfinder_Flow.dart';
import 'Matrice300_RPAS.dart';
import 'DJI_Mavic_Mini_RPAS.dart';


class ScreenDroneType extends StatefulWidget {
  @override
  var rPASSetupFlow;
  var matrice;
  var wayfinder;
  var matrice300;
  var mavicMini;
  ScreenDroneType({Key? key, this.rPASSetupFlow, this.matrice, this.wayfinder, this.matrice300, this.mavicMini}) : super(key: key);
  _ScreenDroneTypeState createState() => _ScreenDroneTypeState(rPASSetupFlow:rPASSetupFlow, matrice:matrice, wayfinder:wayfinder, matrice300:matrice300, mavicMini:mavicMini);
}
class _ScreenDroneTypeState extends State<ScreenDroneType> {
  var rPASSetupFlow;
  var matrice;
  var wayfinder;
  var matrice300;
  var mavicMini;
  _ScreenDroneTypeState({Key? key, this.rPASSetupFlow, this.matrice, this.wayfinder, this.matrice300, this.mavicMini});

  @override
  void _doSomething() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home()));
  }
  void _enterMatriceFlow() {
    //rPASSetupFlow = 'incomplete';
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenPPASFlow()));
  }
  void _enterMatrice300Flow(){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenMatrice300Flow()));
  }

  void _enterWayfinderFlow() {
    //rPASSetupFlow = 'incomplete';
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenWayfinderFlow()));
  }
  void _enterMavicMiniFlow() {
    //rPASSetupFlow = 'incomplete';
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenMavicMiniFlow()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          centerTitle: true,
          title: Text(
            'indrorobotics.ca',
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Text(
                "Choose Drone:",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
              ),
              SizedBox(height:10),
              SizedBox(
                  width: 370,
                  height: 100,
                  //padding: EdgeInsets.symmetric(vertical:0.0,horizontal: 50.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center,
                          backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (matrice == 'complete')
                              {
                                return Colors.green; // Use the component's default. }
                              }
                              else
                              {
                                return Colors.blue;
                              }
                            },
                          )
                      ),
                      onPressed: _enterMatriceFlow,
                      child: Text('Matrice m210'))),
              SizedBox(height: 15),
              SizedBox(
                  width: 370,
                  height: 100,
                  //padding: EdgeInsets.symmetric(vertical:0.0,horizontal: 50.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center,
                          backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (wayfinder == 'complete')
                              {
                                return Colors.green; // Use the component's default. }
                              }
                              else
                              {
                                return Colors.blue;
                              }
                            },
                          )
                      ),
                      onPressed: _enterWayfinderFlow,
                      child: Text('InDro Robotics Wayfinder'))),
              SizedBox(height: 15),
              SizedBox(
                  width: 370,
                  height: 100,
                  //padding: EdgeInsets.symmetric(vertical:0.0,horizontal: 50.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center,
                          backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (matrice300 == 'complete')
                              {
                                return Colors.green; // Use the component's default. }
                              }
                              else
                              {
                                return Colors.blue;
                              }
                            },
                          )
                      ),
                      onPressed: _enterMatrice300Flow,
                      child: Text('Matrice m300'))),
              SizedBox(height: 15),
              SizedBox(
                  width: 370,
                  height: 100,
                  //padding: EdgeInsets.symmetric(vertical:0.0,horizontal: 50.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center,
                          backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (mavicMini == 'complete')
                              {
                                return Colors.green; // Use the component's default. }
                              }
                              else
                              {
                                return Colors.blue;
                              }
                            },
                          )
                      ),
                      onPressed: _enterMavicMiniFlow,
                      child: Text('DJI Mavic Mini'))),
              Padding(
                  padding: EdgeInsets.symmetric(vertical:15.0,horizontal: 110.0),
                  child:ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      onPressed: _doSomething,
                      child: Text('Back To Home')))
            ],
          ),
        )
    );
  }
}













