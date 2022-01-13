import 'package:flutter/material.dart';
import 'text_fields.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'main.dart';


final _formKey = GlobalKey<FormState>();
bool _enableBtn = false;


class Screen2 extends StatefulWidget {
//  @override
  var HeaderOneResults;
  var result3;
  var result4;
  Screen2({Key? key,this.HeaderOneResults,required this.result3, required this.result4}) : super(key: key);

  _Screen2State createState() => _Screen2State(HeaderOneResults:HeaderOneResults, result3: result3, result4: result4);
}

class _Screen2State extends State<Screen2> {
//  @override
  var HeaderOneResults;
  var result3;
  var result4;
  _Screen2State({Key? key,this.HeaderOneResults,required this.result3, required this.result4});

  int _getPassed() {
    var passed = 0;

    for(var i=0; i<HeaderOneResults.length; i++){
      if(HeaderOneResults[i]=='yes'){
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
              TextFields(
                  controller: emailController,
                  name: "Email",
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  })),
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
                          "      2. RPAS securely stored in case: ${HeaderOneResults[1]}\n\n"
                          "   Mission Equipment:\n"
                          "      1. First aid Kit: ${result3}\n"
                          "      2. Cell phone(s) or satellite phone charged with correct cables: ${result4}\n\n"
                          "   PPE: \n      No Information\n\n"
                          "   Mission Documents: \n      No Information\n\n"
                          "   Pre-Flight Setup and Crew Briefing: \n      No Information\n\n";

                      final Email email = Email(
                        body: message,
                        subject: subjectController.text,
                        recipients: [emailController.text],
                        isHTML: false,
                      );
                      await FlutterEmailSender.send(email);
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
