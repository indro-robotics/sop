import 'package:flutter/material.dart';
import 'TakeOff_Flow.dart';

const Color colorScaffoldBackground = Colors.white;
const Color colorAccountOverviewbackground = Colors.red;


class EmergencyScreen extends StatefulWidget {

  @override
  _EmergencyScreenState createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  List<Overview> _overviewList = <Overview>[];

  @override
  void initState() {
    super.initState();
    _loadOverviewList();
  }
  void _backNav(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>ScreenTakeOffFlow()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Emergency Items"),
        automaticallyImplyLeading: false,
      ),
      body: buildMain(),
    );
  }

  Container buildMain() {
    return Container(
        color: colorAccountOverviewbackground,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _listView(),
          ),
        ));
  }

  List<Widget> _listView() {
    return [
      Expanded(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, pos) => _buildAccountRow(context, pos),
                childCount: _overviewList.length,
              ),
            ),
          ],
        ),
      ),
      ElevatedButton(

          style: ButtonStyle(alignment: Alignment.center,
            backgroundColor:
            MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                return Colors.blue; // Use the component's default. }
              },
            ),
            //fixedSize: MaterialStateProperty.all(const Size(500, 50)),
            shape:
            MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                )
            ),

          ),
          onPressed: _backNav,
          child: Text('Back'))
    ];
  }

  Widget _buildAccountRow(BuildContext context, int pos) {
    switch (_overviewList[pos].rowType) {
      case 'HEADER':
        {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 5),
            padding: EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6),
            decoration: BoxDecoration(
              color: colorScaffoldBackground,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Text(_overviewList[pos].name),
                  ],
                ),
              ],
            ),
          );
        }
        break;

      case 'ACCOUNT':
        {
          return Container(
            color: colorScaffoldBackground,
            margin: EdgeInsets.only(left: 10, right: 10),
            padding: EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 10),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 30,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _overviewList[pos].headerNumber,
                        //size: 16,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          _overviewList[pos].name,
                          overflow: TextOverflow.fade,
                          softWrap: true,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }
        break;

      case 'TOTAL':
        {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            padding: EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: colorScaffoldBackground,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          _overviewList[pos].name,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        ),
                      ),
                    ),

                  ],

                ),
              ],
            ),
          );
        }
        break;
    }
    return SizedBox.shrink();
  }

  void _loadOverviewList() {
    _overviewList.add(Overview(rowType: 'HEADER', name: 'Medical Issues or Injury', headerNumber: ''));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'PIC incapacitation, initiate RTL notify VOs and go to item 4', headerNumber: '1.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'VO incapacitation at launch site, initiate RTL, notify VOs and go to item 4', headerNumber: '2.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'VO incapacitation at remote location, secondary VO to notify PIC immediately, initate RTL and go to item 4', headerNumber: '3.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'Administer first aid as appropriate', headerNumber: '4.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'Call 911 if required', headerNumber: '5.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'Stop flight operation', headerNumber: '6.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'If medical issue or injury was caused by the aircraft, determine root cause of the event and take corrective action to prevent recurrence.', headerNumber: '7.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'If the injury is serious (broken limb, extensive burning, or other hospitalization required), report to Transportation Safety Board (per AIM 3.0)', headerNumber: '8.'));
    //_overviewList.add(Overview(rowType: 'TOTAL', name: 'TOTAL'));
    _overviewList.add(Overview(rowType: 'HEADER', name: 'Aircraft Incursion into airspace', headerNumber: ''));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'Report to PIC immediately', headerNumber: '9.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'VO to make call-in-the-blind', headerNumber: '10.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'In case of potential conflict, PIC to loiter and descent to safe altitude (60 AGL) immediately', headerNumber: '11.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'Monitor conflict potential and land RPAS if there is risk to piloted aircraft', headerNumber: '12.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'If no conflict, resume mission when safe', headerNumber: '13.'));
    //_overviewList.add(Overview(rowType: 'TOTAL', name: 'TOTAL'));
    _overviewList.add(Overview(rowType: 'HEADER', name: 'Loss of or degraded GPS lock', headerNumber: ''));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'Initate loiter command and attempt to recover GPS lock', headerNumber: '14.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'If unable to recover GPS lock in 5 seconds, initiate land command', headerNumber: '15.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'If land command not accepted, initiate flight termination command', headerNumber: '16.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'If flight termination command not accepted, report fly-away', headerNumber: '17.'));

    _overviewList.add(Overview(rowType: 'HEADER', name: 'Loss of cellular signal', headerNumber: ''));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'If within RC signal range, continue with programmed waypoint mission', headerNumber: '18.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'If out of RC range, wait 10 seconds to reconnect', headerNumber: '19.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'If not reconnected in 10 seconds, auto RTL', headerNumber: '20.'));

    _overviewList.add(Overview(rowType: 'HEADER', name: 'Aircraft Fly-away', headerNumber: ''));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'Attempt to reconnect to drone', headerNumber: '21.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'If in controlled airspace, call emergency ATC number, ACC Shift Manager or FIR', headerNumber: '22.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'If in uncontrolled airspace initiate PAN PAN, PAN PAN, PAN PAN radio', headerNumber: '23.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'If possible, warn people in potential crash zone and call 911 as necessary', headerNumber: '24.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'Review flight plan and attemp to recover drone ', headerNumber: '25.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'Notify Ops Manager and determine cause of failure, note maintenance actions in maintenance log, then take corrective actions', headerNumber: '26.'));

    _overviewList.add(Overview(rowType: 'HEADER', name: 'Aircraft Failure / Crash / Flight Termination', headerNumber: ''));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'If possible, warn people in potential crash zone', headerNumber: '27.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'Recover drone ', headerNumber: '28.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'Determine cause of failure, note maintenance actions in maintenance log, and take corrective actions', headerNumber: '29.'));

    _overviewList.add(Overview(rowType: 'HEADER', name: 'Control Station Failure', headerNumber: ''));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'Power  cycle control station unit', headerNumber: '30.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'Attempt to reconnect to drone', headerNumber: '31.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'Recover drone (assuming either auto-return-to-home or crash)', headerNumber: '32.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'Determine cause of failure, note maintenance actions in maintenance log, and take corrective actions', headerNumber: '33.'));

    _overviewList.add(Overview(rowType: 'HEADER', name: 'Loss of Command and Control Link', headerNumber: ''));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'Power  cycle control station unit', headerNumber: '34.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'Attempt to reconnect to drone', headerNumber: '35.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'Recover drone (assuming either auto-return-to-home or crash)', headerNumber: '36.'));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'Determine cause of failure, note maintenance actions in maintenance log, and take corrective actions', headerNumber: '37.'));

    _overviewList.add(Overview(rowType: 'HEADER', name: 'Other Equipment Failure', headerNumber: ''));
    _overviewList.add(Overview(rowType: 'ACCOUNT', name: 'Determine cause of failure, note maintenance actions in maintenance log, and take corrective actions', headerNumber: '38.'));
    //_overviewList.add(Overview(rowType: 'TOTAL', name: 'TOTAL'));
  }
}

class Overview {
  String rowType;
  String name;
  String headerNumber;
  //IconData iconData;

  Overview({
    required this.rowType,
    required this.name,
    required this.headerNumber,
    //this.iconData,
  });
}





