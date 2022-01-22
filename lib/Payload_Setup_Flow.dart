import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'PPAS_Setup_Flow.dart';
import 'RPAS_Wayfinder_Flow.dart';
import 'MicaSense_Payload.dart';
import 'Zenmuse_Payload.dart';


class ScreenPayloadFlow extends StatefulWidget {
  @override
  var payload;
  var micaSense;
  var Zenmuse;
  ScreenPayloadFlow({Key? key, this.payload, this.micaSense, this.Zenmuse}) : super(key: key);
  _ScreenPayloadFlowState createState() => _ScreenPayloadFlowState(payload:payload, micaSense:micaSense, Zenmuse:Zenmuse);
}
class _ScreenPayloadFlowState extends State<ScreenPayloadFlow> {
  var payload;
  var micaSense;
  var Zenmuse;
  _ScreenPayloadFlowState({Key? key, this.payload, this.micaSense, this.Zenmuse});

  @override
  void _doSomething() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home()));
  }
  void _enterMicaSenseFlow() {
    //rPASSetupFlow = 'incomplete';
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenMicaSenseFlow()));
  }
  void _enterZenmuseFlow() {
    //rPASSetupFlow = 'incomplete';
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScreenZenmuseFlow()));
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
                "Choose Payload:",
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
                              if (micaSense == 'complete')
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
                      onPressed: _enterMicaSenseFlow,
                      child: Text('MicaSense'))),
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
                              if (Zenmuse == 'complete')
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
                      onPressed: _enterZenmuseFlow,
                      child: Text('zenmuse x4s'))),
              Padding(
                  padding: EdgeInsets.symmetric(vertical:60.0,horizontal: 100.0),
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








