import 'package:flutter/material.dart';
import 'text_fields.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restart_app/restart_app.dart';
import 'RPAS_Equipment.dart';
import 'package:flutter_restart/flutter_restart.dart';
import 'Mission_Equipment.dart';
import 'PPE.dart';

final _formKey = GlobalKey<FormState>();
bool _enableBtn = false;


class Screen2 extends StatefulWidget {
//  @override
  var HeaderOneResults;
  var HeaderTwoResults;
  var HeaderThreeResults;
  var HeaderFourResults;
  Screen2({Key? key,this.HeaderOneResults,this.HeaderTwoResults, this.HeaderThreeResults, this.HeaderFourResults}) : super(key: key);

  _Screen2State createState() => _Screen2State(HeaderOneResults:HeaderOneResults, HeaderTwoResults:HeaderTwoResults,
  HeaderThreeResults:HeaderThreeResults, HeaderFourResults:HeaderFourResults);
}

class _Screen2State extends State<Screen2> {
//  @override

  var HeaderOneResults;
  var HeaderTwoResults;
  var HeaderThreeResults;
  var HeaderFourResults;
  late String accountEmail;// = user.email;

  //accountEmail = user.email;
  //var accountEmail = Text('${FirebaseAuth.instance.currentUser?.email}');

  _Screen2State({Key? key,this.HeaderOneResults,this.HeaderTwoResults, this.HeaderThreeResults, this.HeaderFourResults});

  void getEmail(){
    setState(() {
      //accountEmail = user?.email.toString()!;
      accountEmail = FirebaseAuth.instance.currentUser!.email.toString();
    });
    //return accountEmail;
  }

  int _getPassed() {
    var passed = 0;

    for(var i=0; i<HeaderOneResults.length; i++){
      if(HeaderOneResults[i]=='yes'){
        passed = passed+1;
      }
    }

    for(var i=0; i<HeaderTwoResults.length; i++){
      if(HeaderTwoResults[i]=='yes'){
        passed = passed+1;
      }
    }

    for(var i=0; i<HeaderThreeResults.length; i++){
      if(HeaderThreeResults[i]=='yes'){
        passed = passed+1;
      }
    }
    for(var i=0; i<HeaderFourResults.length; i++){
      if(HeaderFourResults[i]=='yes'){
        passed = passed+1;
      }
    }

    return passed;
  }

  int _getFailed() {
    var failed = 0;
    for(var i=0; i<HeaderOneResults.length; i++){
      if(HeaderOneResults[i]=='no'){
        failed = failed+1;
      }
    }
    for(var i=0; i<HeaderTwoResults.length; i++){
      if(HeaderTwoResults[i]=='no'){
        failed = failed+1;
      }
    }

    for(var i=0; i<HeaderThreeResults.length; i++){
      if(HeaderThreeResults[i]=='no'){
        failed = failed+1;
      }
    }
    for(var i=0; i<HeaderFourResults.length; i++){
      if(HeaderFourResults[i]=='no'){
        failed = failed+1;
      }
    }

    return failed;
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
      body: Form(
        key: _formKey,
        onChanged: (() {
          setState(() {
            _enableBtn = _formKey.currentState!.validate();
          });
        }),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 50),
              TextFields(
                  controller: subjectController,
                  name: "Subject",
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  })),
              /*TextFields(
                  controller: emailController,
                  name: "Email",
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  })),*/
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.5);
                            else if (states.contains(MaterialState.disabled))
                              return Colors.grey;
                            return Colors.green; // Use the component's default.
                          },
                        ),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            )
                        )
                    ),
                    onPressed: _enableBtn
                        ? (() async {

                      var passed = _getPassed();
                      var failed = _getFailed();

                      var message = "SOP results: \n\n"
                          "Passed: ${passed}\n"
                          "Failed: ${failed}\n\n"
                          "   RPAS Equipment:\n      1. Mission maps downloaded onto ground station if required: ${HeaderOneResults[0]}\n"
                          "      2. Gound Control Station fully charged with latest version: ${HeaderOneResults[1]}\n"
                          "      3. Hand controller (if applicable) fully charged: ${HeaderOneResults[2]}\n"
                          "      4. Back Up hand controller fully charged and linked to RPA if required: ${HeaderOneResults[3]}\n"
                          "      5. Memory cards empty and ready to be formatted: ${HeaderOneResults[4]}\n"
                          "      6. RPAS securely stored in case: ${HeaderOneResults[5]}\n"
                          "      7. Spare blades (minimum two sets): ${HeaderOneResults[6]}\n"
                          "      8. Sufficient batteries charged with latest firmware: ${HeaderOneResults[7]}\n"
                          "      9. Battery charger with cables and LiPo bags if in transport: ${HeaderOneResults[8]}\n"
                          "\n"
                          "   Mission Equipment:\n"
                          "      1. First aid Kit: ${HeaderTwoResults[0]}\n"
                          "      2. Fire extinguisher(s): ${HeaderTwoResults[1]}\n"
                          "      3. Anemometer: ${HeaderTwoResults[2]}\n"
                          "      4. Cell Phone(s) or Satellite Phone charged with correct cables: ${HeaderTwoResults[3]}\n"
                          "      5. 4 to 8 x red or yellow cones: ${HeaderTwoResults[4]}\n"
                          "      6. RPAS and payload specific items (e.g. base station, battery case, tripod): ${HeaderTwoResults[5]}\n"
                          "      7. Landing pad: ${HeaderTwoResults[6]}\n"
                          "      8. Battery warmer equipment: ${HeaderTwoResults[7]}\n"
                          "      9. Canopy, table and chairs: ${HeaderTwoResults[8]}\n"
                          "      10. Spectrum analyser with charged battery: ${HeaderTwoResults[9]}\n"
                          "      11. Tool box: ${HeaderTwoResults[10]}\n"
                          "      12. Portable power pack charged: ${HeaderTwoResults[11]}\n"
                          "      13. Extension cord and power bar: ${HeaderTwoResults[12]}\n"
                          "      14. 12 VDC to 110 VAC inverter: ${HeaderTwoResults[13]}\n"
                          "      15. Inter-crew comms radios charged and tested: ${HeaderTwoResults[14]}\n"
                          "      16. Aviation radio(s) charged and tested: ${HeaderTwoResults[15]}\n"
                          "\n"
                          "   PPE:\n      1. Hi-vis safety vest: ${HeaderThreeResults[0]}\n"
                          "      2. Hard-hat: ${HeaderThreeResults[1]}\n"
                          "      3. Bug repelent: ${HeaderThreeResults[2]}\n"
                          "      4. Sunglasses and sunscreen: ${HeaderThreeResults[3]}\n"
                          "      5. Safety glasses: ${HeaderThreeResults[4]}\n"
                          "      6. Safety footware: ${HeaderThreeResults[5]}\n"
                          "      7. Fire-retardent suit: ${HeaderThreeResults[6]}\n"
                          "      8. Ear protection: ${HeaderThreeResults[7]}\n"
                          "      9. Gloves: ${HeaderThreeResults[8]}\n"
                          "\n"
                          "   Mission Documents:\n      1. Canada Flight Supplement and VTA/VNC charts: ${HeaderFourResults[0]}\n"
                          "      2. Company Operations Manual: ${HeaderFourResults[1]}\n"
                          "      3. RPAS Flight Manual: ${HeaderFourResults[2]}\n"
                          "      4. Notices to Airmen (NOTAMS) via NavDrone: ${HeaderFourResults[3]}\n"
                          "      5. METARs: ${HeaderFourResults[4]}\n"
                          "      6. Proof of insurance (policy number): ${HeaderFourResults[5]}\n"
                          "      7. SFOC: ${HeaderFourResults[6]}\n"
                          "      8. SFOC Application: ${HeaderFourResults[7]}\n"
                          "      9. NavCan airspace approval and ATC approval if required: ${HeaderFourResults[8]}\n"
                          "      10. InDro operational clearance: ${HeaderFourResults[9]}\n"
                          "\n"
                          "   Pre-Flight Setup and Crew Briefing: \n      No Information\n\n";
                      //User? user = FirebaseAuth.instance.currentUser;
                      //var accountEmail = Text('${FirebaseAuth.instance.currentUser?.email}');
                      //var accoutEmail = user?.email;
                      getEmail();
                      print(accountEmail);
                      final Email email = Email(
                        body: message,
                        subject: subjectController.text,
                        //recipients: [emailController.text],
                        recipients: [accountEmail],
                        isHTML: false,
                      );
                      await FlutterEmailSender.send(email);
                     //Navigator.popAndPushNamed(context, "/currentRoute");
                      //Navigator.of(context).push(
                      //    MaterialPageRoute(builder: (context) => ScreenPackUpFlow()));
                      //Navigator.popAndPushNamed(context, "/currentRoute");
                      //Navigator.popAndPushNamed(ScreenPackUpFlow());
                      //RestartWidget.restartApp(context);
                      //runApp(MyApp());
                      //Navigator.popAndPushNamed(context,'ScreenPackUpFlow');
                      FlutterRestart.restartApp();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Home()));

                    })
                        : null,
                    child: Text('Submit'),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
