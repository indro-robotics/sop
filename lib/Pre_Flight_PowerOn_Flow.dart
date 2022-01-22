import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'PPAS_Setup_Flow.dart';
import 'RPAS_Wayfinder_Flow.dart';
import 'Matrice_Power_Page.dart';
import 'Wayfinder_Power_Page.dart';
import 'Matrice300_Power_Page.dart';
import 'DJI_Mavic_Mini_PowerOn.dart';


class ScreenPowerOn extends StatefulWidget {
  @override
  var poweron;
  var matricepower;
  var wayfinderpower;
  var matrice300power;
  var mavicMinipower;
  ScreenPowerOn({Key? key, this.poweron, this.matricepower, this.wayfinderpower, this.matrice300power, this.mavicMinipower}) : super(key: key);
  _ScreenPowerOnState createState() => _ScreenPowerOnState(poweron:poweron, matricepower:matricepower, wayfinderpower:wayfinderpower, matrice300power:matrice300power,
      mavicMinipower:mavicMinipower);
}
class _ScreenPowerOnState extends State<ScreenPowerOn> {
  var poweron;
  var matricepower;
  var wayfinderpower;
  var matrice300power;
  var mavicMinipower;
  _ScreenPowerOnState({Key? key, this.poweron, this.matricepower, this.wayfinderpower, this.matrice300power, this.mavicMinipower});

  @override
  void _doSomething() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home()));
  }
  void _enterMatricePowerFlow() {
    //rPASSetupFlow = 'incomplete';
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenMatricePower()));
  }
  void _enterWayfinderPowerFlow() {
    //rPASSetupFlow = 'incomplete';
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenWayfinderPower()));
  }
  void _enterMatrice300PowerFlow() {
    //rPASSetupFlow = 'incomplete';
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenMatrice300Power()));
  }
  void _enterMavicMiniPowerFlow() {
    //rPASSetupFlow = 'incomplete';
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenMavicMiniPower()));
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
                              if (matricepower == 'complete')
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
                      onPressed: _enterMatricePowerFlow,
                      child: Text('matrice m210'))),
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
                              if (wayfinderpower == 'complete')
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
                      onPressed: _enterWayfinderPowerFlow,
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
                              if (matrice300power == 'complete')
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
                      onPressed: _enterMatrice300PowerFlow,
                      child: Text('matrice m300'))),
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
                              if (mavicMinipower == 'complete')
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
                      onPressed: _enterMavicMiniPowerFlow,
                      child: Text('Mavic Mini'))),
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


