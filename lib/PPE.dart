import 'package:flutter/material.dart';
import 'main.dart';


var HeaderThreeResults = ['incomplete', 'incomplete','incomplete', 'incomplete','incomplete', 'incomplete','incomplete', 'incomplete','incomplete'];


class ScreenPPE extends StatefulWidget {
  @override
  _ScreenPPEState createState() => _ScreenPPEState();
}
class _ScreenPPEState extends State<ScreenPPE> {
  @override
  void _doSomething() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) =>
            Home(HeaderThreeResults: HeaderThreeResults)));
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
                Text(
                    '1. Hi-vis safety vest'),
                RadioListTile(
                    title: Text('Yes'),
                    value: 'yes',
                    groupValue: HeaderThreeResults[0],
                    onChanged: (value) {
                      setState(() {
                        HeaderThreeResults[0] = value.toString();
                      });
                    }),
                RadioListTile(
                    title: Text('No'),
                    value: 'no',
                    groupValue: HeaderThreeResults[0],
                    onChanged: (value) {
                      setState(() {
                        HeaderThreeResults[0] = value.toString();
                      });
                    }),
                SizedBox(height: 5),
                Text(HeaderThreeResults[0] == 'yes'
                    ? 'Good'
                    : 'Required'),

                SizedBox(height: 30),
                Text(
                    '2. Hard hat'),
                RadioListTile(
                    title: Text('Yes'),
                    value: 'yes',
                    groupValue: HeaderThreeResults[1],
                    onChanged: (value) {
                      setState(() {
                        HeaderThreeResults[1] = value.toString();
                      });
                    }),
                RadioListTile(
                    title: Text('No'),
                    value: 'no',
                    groupValue: HeaderThreeResults[1],
                    onChanged: (value) {
                      setState(() {
                        HeaderThreeResults[1] = value.toString();
                      });
                    }),
                SizedBox(height: 5),
                Text(HeaderThreeResults[1] == 'yes'
                    ? 'Good'
                    : 'Please get Hard hat'),

                SizedBox(height: 30),
                Text('3. Bug repelent'),
                RadioListTile(
                    title: Text('Yes'),
                    value: 'yes',
                    groupValue: HeaderThreeResults[2],
                    onChanged: (value) {
                      setState(() {
                        HeaderThreeResults[2] = value.toString();
                      });
                    }),
                RadioListTile(
                    title: Text('No'),
                    value: 'no',
                    groupValue: HeaderThreeResults[2],
                    onChanged: (value) {
                      setState(() {
                        HeaderThreeResults[2] = value.toString();
                      });
                    }),
                SizedBox(height: 5),
                Text(HeaderThreeResults[2] == 'yes' ? 'Good' : 'Please get bug repelent'),

                SizedBox(height: 30),
                Text(
                    '4. Sunglasses and sunscreen'),
                RadioListTile(
                    title: Text('Yes'),
                    value: 'yes',
                    groupValue: HeaderThreeResults[3],
                    onChanged: (value) {
                      setState(() {
                        HeaderThreeResults[3] = value.toString();
                      });
                    }),
                RadioListTile(
                    title: Text('No'),
                    value: 'no',
                    groupValue: HeaderThreeResults[3],
                    onChanged: (value) {
                      setState(() {
                        HeaderThreeResults[3] = value.toString();
                      });
                    }),
                SizedBox(height: 5),
                Text(HeaderThreeResults[3] == 'yes'
                    ? 'Good'
                    : 'Need sunglasses and sunscreen'),

                SizedBox(height: 30),
                Text('5. Safety glasses'),
                RadioListTile(
                    title: Text('Yes'),
                    value: 'yes',
                    groupValue: HeaderThreeResults[4],
                    onChanged: (value) {
                      setState(() {
                        HeaderThreeResults[4] = value.toString();
                      });
                    }),
                RadioListTile(
                    title: Text('No'),
                    value: 'no',
                    groupValue: HeaderThreeResults[4],
                    onChanged: (value) {
                      setState(() {
                        HeaderThreeResults[4] = value.toString();
                      });
                    }),
                SizedBox(height: 5),
                Text(HeaderThreeResults[4] == 'yes'
                    ? 'Good'
                    : 'Need safety glasses'),

                SizedBox(height: 30),
                Text('6. Safety footware'),
                RadioListTile(
                    title: Text('Yes'),
                    value: 'yes',
                    groupValue: HeaderThreeResults[5],
                    onChanged: (value) {
                      setState(() {
                        HeaderThreeResults[5] = value.toString();
                      });
                    }),
                RadioListTile(
                    title: Text('No'),
                    value: 'no',
                    groupValue: HeaderThreeResults[5],
                    onChanged: (value) {
                      setState(() {
                        HeaderThreeResults[5] = value.toString();
                      });
                    }),
                SizedBox(height: 5),
                Text(HeaderThreeResults[5] == 'yes'
                    ? 'Good'
                    : 'Need safety footware'),

                SizedBox(height: 30),
                Text('7. Fire-retardent suit'),
                RadioListTile(
                    title: Text('Yes'),
                    value: 'yes',
                    groupValue: HeaderThreeResults[6],
                    onChanged: (value) {
                      setState(() {
                        HeaderThreeResults[6] = value.toString();
                      });
                    }),
                RadioListTile(
                    title: Text('No'),
                    value: 'no',
                    groupValue: HeaderThreeResults[6],
                    onChanged: (value) {
                      setState(() {
                        HeaderThreeResults[6] = value.toString();
                      });
                    }),
                SizedBox(height: 5),
                Text(HeaderThreeResults[6] == 'yes'
                    ? 'Good'
                    : 'Please get fire-retardent suit'),

                SizedBox(height: 30),
                Text('8. Ear protection'),
                RadioListTile(
                    title: Text('Yes'),
                    value: 'yes',
                    groupValue: HeaderThreeResults[7],
                    onChanged: (value) {
                      setState(() {
                        HeaderThreeResults[7] = value.toString();
                      });
                    }),
                RadioListTile(
                    title: Text('No'),
                    value: 'no',
                    groupValue: HeaderThreeResults[7],
                    onChanged: (value) {
                      setState(() {
                        HeaderThreeResults[7] = value.toString();
                      });
                    }),
                SizedBox(height: 5),
                Text(HeaderThreeResults[7] == 'yes' ? 'Good' : 'Please get ear protection'),

                SizedBox(height: 30),
                Text(
                    '9. Gloves'),
                RadioListTile(
                    title: Text('Yes'),
                    value: 'yes',
                    groupValue: HeaderThreeResults[8],
                    onChanged: (value) {
                      setState(() {
                        HeaderThreeResults[8] = value.toString();
                      });
                    }),
                RadioListTile(
                    title: Text('No'),
                    value: 'no',
                    groupValue: HeaderThreeResults[8],
                    onChanged: (value) {
                      setState(() {
                        HeaderThreeResults[8] = value.toString();
                      });
                    }),
                SizedBox(height: 5),
                Text(HeaderThreeResults[8] == 'yes' ? 'Good' : 'Please get gloves'),

                SizedBox(height: 30),
                Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 60.0, horizontal: 100.0),
                    child: ElevatedButton(
                        style: ButtonStyle(alignment: Alignment.center),
                        //onPressed: ((result1 == 'yes' || result1=='no') && (result2 == 'yes'|| result2=='no'))? _doSomething : null,
                        onPressed: (HeaderThreeResults[0] != 'incomplete' &&
                            HeaderThreeResults[1] != 'incomplete'
                            && HeaderThreeResults[2] != 'incomplete'
                            && HeaderThreeResults[3] != 'incomplete'
                            && HeaderThreeResults[4] != 'incomplete'
                            && HeaderThreeResults[5] != 'incomplete'
                            && HeaderThreeResults[6] != 'incomplete'
                            && HeaderThreeResults[7] != 'incomplete'
                            && HeaderThreeResults[8] != 'incomplete')
                            ? _doSomething
                            : null,
                        child: Text('Back To Home')))
              ],
            ),
          )
      );
    }
}



