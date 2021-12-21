import 'package:flutter/material.dart';
import 'text_fields.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';


void main() => runApp(MyApp());
/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

final _formKey = GlobalKey<FormState>();
bool _enableBtn = false;
TextEditingController emailController = TextEditingController();
TextEditingController subjectController = TextEditingController();
TextEditingController messageController = TextEditingController();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // By defaut, the checkbox is unchecked and "agree" is "false"
  bool agree = false;
  // This function is triggered when the button is clicked
  void _doSomething() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Screen2()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Row(
          children: [
            Material(
              child: Checkbox(
                value: agree,
                onChanged: (value) {
                  setState(() {
                    agree = value ?? false;
                  });
                },
              ),
            ),
            Text(
              'sop requirment',
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
        ElevatedButton(
          onPressed: agree ? _doSomething :null, child: Text('Check requirments'))
      ]),
    );
  }
}

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}
class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              TextFields(
                  controller: messageController,
                  name: "Message",
                  validator: ((value) {
                    if (value!.isEmpty) {
                      setState(() {
                        _enableBtn = true;
                      });
                      return 'Message is required';
                    }
                    return null;
                  }),
                  maxLines: null,
                  type: TextInputType.multiline),
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
                            return Colors.blue; // Use the component's default.
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
                          final Email email = Email(
                            body: messageController.text,
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

