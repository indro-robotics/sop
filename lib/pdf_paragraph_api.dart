import 'dart:io';

import 'package:flutter/services.dart';
import 'RPAS_Equipment.dart';
import 'main.dart';
import 'pdf_api.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'Mission_Equipment.dart';
import 'PPE.dart';
import 'PPAS_Setup_Flow.dart';
import 'Payload_Setup_Flow.dart';
import 'Pre_Flight_PowerOn_Flow.dart';
import 'MissionDocuments.dart';
import 'PreFlightBriefing.dart';
import 'Pre_TakeOff_Checklist.dart';
import 'TakeOff_Flow.dart';
import 'Landing_Checklist.dart';
import 'RPAS_Wayfinder_Flow.dart';
import 'Matrice_Power_Page.dart';
import 'Wayfinder_Power_Page.dart';
import 'MicaSense_Payload.dart';
import 'Zenmuse_Payload.dart';
import 'Matrice300_Power_Page.dart';
import 'Matrice300_RPAS.dart';
import 'DJI_Mavic_Mini_RPAS.dart';
import 'DJI_Mavic_Mini_PowerOn.dart';
import 'Drone_Type_Page.dart';

class PdfParagraphApi {
  static Future<File> generate(String email) async {
    final pdf = Document();

    //final customFont =
    //Font.ttf(await rootBundle.load('assets/OpenSans-Regular.ttf'));

    pdf.addPage(
      MultiPage(
        build: (context) => <Widget>[
          HeaderOne(),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Paragraph(
            text:
            'This is a complete review of the flight from user with email: $email',
            //style: TextStyle(font: customFont, fontSize: 20),
          ),
          buildCustomHeadline(),
          HeaderOne_One(),
          HeaderOne_Two(),
          HeaderOne_Three(),
          HeaderOne_Four(),
          HeaderOne_Five(),
          HeaderOne_Six(),
          HeaderOne_Seven(),
          HeaderOne_Eight(),
          HeaderOne_Nine(),

          HeadlineTwo(),
          HeaderTwo_One(),
          HeaderTwo_Two(),
          HeaderTwo_Three(),
          HeaderTwo_Four(),
          HeaderTwo_Five(),
          HeaderTwo_Six(),
          HeaderTwo_Seven(),
          HeaderTwo_Eight(),
          HeaderTwo_Nine(),
          HeaderTwo_Ten(),
          HeaderTwo_Eleven(),
          HeaderTwo_Twelve(),
          HeaderTwo_Thirteen(),
          HeaderTwo_Fourteen(),
          HeaderTwo_Fifteen(),
          HeaderTwo_Sixteen(),

          HeadlineThree(),
          HeaderThree_One(),
          HeaderThree_Two(),
          HeaderThree_Three(),
          HeaderThree_Four(),
          HeaderThree_Five(),
          HeaderThree_Six(),
          HeaderThree_Seven(),
          HeaderThree_Eight(),
          HeaderThree_Nine(),

          HeadlineFour(),
          HeaderFour_One(),
          HeaderFour_Two(),
          HeaderFour_Three(),
          HeaderFour_Four(),
          HeaderFour_Five(),
          HeaderFour_Six(),
          HeaderFour_Seven(),
          HeaderFour_Eight(),
          HeaderFour_Nine(),
          HeaderFour_Ten(),

          HeadlineFive(),
          HeaderFive_One(),
          HeaderFive_Two(),
          HeaderFive_Three(),
          HeaderFive_Four(),
          HeaderFive_Five(),
          HeaderFive_Six(),
          HeaderFive_Seven(),
          HeaderFive_Eight(),
          HeaderFive_Nine(),
          HeaderFive_Ten(),
          HeaderFive_Eleven(),
          HeaderFive_Twelve(),
          HeaderFive_Thirteen(),
          HeaderFive_Fourteen(),

          HeadlineSix(),
          HeaderSix_One(),
          HeaderSix_Two(),
          HeaderSix_Three(),
          HeaderSix_Four(),
          HeaderSix_Five(),

          HeadlineSeven(),
          HeaderSeven_One(),
          HeaderSeven_Two(),
          HeaderSeven_Three(),

          HeadlineEight(),
          HeaderEight_One(),
          HeaderEight_Two(),
          HeaderEight_Three(),
          HeaderEight_Four(),
          HeaderEight_Five(),

          HeadlineNine(),
          HeaderNine_One(),
          HeaderNine_Two(),
          HeaderNine_Three(),
          HeaderNine_Four(),
          HeaderNine_Five(),
          HeaderNine_Six(),
          HeaderNine_Seven(),
          HeaderNine_Eight(),

          HeadlineTen(),
          HeaderTen_One(),
          HeaderTen_Two(),
          HeaderTen_Three(),

          HeadlineEleven(),
          HeaderEleven_One(),
          HeaderEleven_Two(),
          HeaderEleven_Three(),
          HeaderEleven_Four(),
          HeaderEleven_Five(),
          HeaderEleven_Six(),



        ],
        footer: (context) {
          final text = 'Page ${context.pageNumber} of ${context.pagesCount}';

          return Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(top: 1 * PdfPageFormat.cm),
            child: Text(
              text,
              style: TextStyle(color: PdfColors.black),
            ),
          );
        },
      ),
    );
    //
    //
    var now = DateTime.now().toString();
    String dateResult = now.replaceAll(RegExp('_'), ' ');
    if (dateResult != null && dateResult.length >= 4) {
      dateResult = dateResult.substring(0, dateResult.length - 4);
    }

    String prefix = 'SOP_';
    String end = '.pdf';

    String result = prefix + dateResult + end;

    return PdfApi.saveExternalDocument(name: result, pdf:pdf);
  }

  static Widget HeaderOne() => Container(
    padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    ),
    child: Row(
      children: [
        PdfLogo(),
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          'SOP Flight Review - ${DateTime.now()}',
          style: TextStyle(fontSize: 20, color: PdfColors.blue),
        ),
      ],
    ),
  );

  static Widget buildCustomHeadline() => Header(
    child: Text(
      'Pre-Mission Checklist',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: PdfColors.white,
      ),
    ),
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(color: PdfColors.orange),
  );
  static Widget HeaderOne_One() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '1. Mission maps downloaded onto ground station if required: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderOneResults[0]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderOneResults[0])),
        ),
      ],
    ),
  );
  static Widget HeaderOne_Two() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '2. Ground Control Station fully charged with latest version: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderOneResults[1]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderOneResults[1])),
        ),
      ],
    ),
  );
  static Widget HeaderOne_Three() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '3. Hand controller fullly charged: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderOneResults[2]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderOneResults[2])),
        ),
      ],
    ),
  );
  static Widget HeaderOne_Four() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '4. Back Up hand controller fully charged and linked to RPA if required: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderOneResults[3]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderOneResults[3])),
        ),
      ],
    ),
  );
  static Widget HeaderOne_Five() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '5. Memory cards empty and ready to be formatted: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderOneResults[4]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderOneResults[4])),
        ),
      ],
    ),
  );
  static Widget HeaderOne_Six() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '6. RPAS securely stored in case: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderOneResults[5]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderOneResults[5])),
        ),
      ],
    ),
  );
  static Widget HeaderOne_Seven() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '7. Spare blades: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderOneResults[6]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderOneResults[6])),
        ),
      ],
    ),
  );
  static Widget HeaderOne_Eight() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '8. Sufficient batteries charged with latest firmware: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderOneResults[7]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderOneResults[7])),
        ),
      ],
    ),
  );
  static Widget HeaderOne_Nine() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '9. Battery charger with cables and LiPo bags if in transport: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderOneResults[8]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderOneResults[8])),
        ),
      ],
    ),
  );

  static Widget HeadlineTwo() => Header(
    child: Text(
      'Mission Equipment',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: PdfColors.white,
      ),
    ),
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(color: PdfColors.orange),
  );
  static Widget HeaderTwo_One() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '1. First aid kit: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderTwoResults[0]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderTwoResults[0])),
        ),
      ],
    ),
  );
  static Widget HeaderTwo_Two() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '2. Fire extinguisher(s): ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderTwoResults[1]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderTwoResults[1])),
        ),
      ],
    ),
  );
  static Widget HeaderTwo_Three() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '3. Anemometer: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderTwoResults[2]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderTwoResults[2])),
        ),
      ],
    ),
  );
  static Widget HeaderTwo_Four() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '4. cell Phone(s) or Satellite Phone charged with correct cables: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderTwoResults[3]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderTwoResults[3])),
        ),
      ],
    ),
  );
  static Widget HeaderTwo_Five() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '5. 4 to 8 x red or yellow cones: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderTwoResults[4]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderTwoResults[4])),
        ),
      ],
    ),
  );
  static Widget HeaderTwo_Six() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '6. RPAS and payload specific items (e.g. base station, battery case, tripod): ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderTwoResults[5]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderTwoResults[5])),
        ),
      ],
    ),
  );
  static Widget HeaderTwo_Seven() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '7. Landing pad: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderTwoResults[6]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderTwoResults[6])),
        ),
      ],
    ),
  );
  static Widget HeaderTwo_Eight() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '8. Battery warmer equipment: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderTwoResults[7]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderTwoResults[7])),
        ),
      ],
    ),
  );
  static Widget HeaderTwo_Nine() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '9. Canopy, table and chairs: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderTwoResults[8]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderTwoResults[8])),
        ),
      ],
    ),
  );
  static Widget HeaderTwo_Ten() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '10. Spectrum analyser with charger battery: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderTwoResults[9]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderTwoResults[9])),
        ),
      ],
    ),
  );
  static Widget HeaderTwo_Eleven() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '11. Tool box: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderTwoResults[10]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderTwoResults[10])),
        ),
      ],
    ),
  );
  static Widget HeaderTwo_Twelve() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '12. Portable power pack charged: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderTwoResults[11]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderTwoResults[11])),
        ),
      ],
    ),
  );
  static Widget HeaderTwo_Thirteen() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '13. Extension cord and power bar: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderTwoResults[12]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderTwoResults[12])),
        ),
      ],
    ),
  );
  static Widget HeaderTwo_Fourteen() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '14. 12 VDC to 110 VAC inverter: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderTwoResults[13]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderTwoResults[13])),
        ),
      ],
    ),
  );
  static Widget HeaderTwo_Fifteen() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '15. Inter-crew comms radios charged and tested: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderTwoResults[14]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderTwoResults[14])),
        ),
      ],
    ),
  );
  static Widget HeaderTwo_Sixteen() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '16. Aviation radio(s) charged and tested: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderTwoResults[15]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderTwoResults[15])),
        ),
      ],
    ),
  );

  static Widget HeadlineThree() => Header(
    child: Text(
      'PPE',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: PdfColors.white,
      ),
    ),
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(color: PdfColors.orange),
  );
  static Widget HeaderThree_One() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '1. Hi-vis safety vest: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderThreeResults[0]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderThreeResults[0])),
        ),
      ],
    ),
  );
  static Widget HeaderThree_Two() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '2. Hard hat: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderThreeResults[1]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderThreeResults[1])),
        ),
      ],
    ),
  );
  static Widget HeaderThree_Three() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '3. Bug repelent: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderThreeResults[2]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderThreeResults[2])),
        ),
      ],
    ),
  );
  static Widget HeaderThree_Four() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '4. Sunglasses and sunscreen: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderThreeResults[3]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderThreeResults[3])),
        ),
      ],
    ),
  );
  static Widget HeaderThree_Five() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '5. Safety glasses: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderThreeResults[4]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderThreeResults[4])),
        ),
      ],
    ),
  );
  static Widget HeaderThree_Six() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '6. Safety footware: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderThreeResults[5]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderThreeResults[5])),
        ),
      ],
    ),
  );
  static Widget HeaderThree_Seven() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '7. Fire-retardent suit: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderThreeResults[6]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderThreeResults[6])),
        ),
      ],
    ),
  );
  static Widget HeaderThree_Eight() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '8. Ear protection: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderThreeResults[7]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderThreeResults[7])),
        ),
      ],
    ),
  );
  static Widget HeaderThree_Nine() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '9. Gloves: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderThreeResults[8]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderThreeResults[8])),
        ),
      ],
    ),
  );

  static Widget HeadlineFour() => Header(
    child: Text(
      'Mission Documents',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: PdfColors.white,
      ),
    ),
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(color: PdfColors.orange),
  );
  static Widget HeaderFour_One() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '1. Canada Flight Supplement and VTA/VNC charts(can be digital): ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFourResults[0]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFourResults[0])),
        ),
      ],
    ),
  );
  static Widget HeaderFour_Two() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '2. Compnay Operations Manual: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFourResults[1]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFourResults[1])),
        ),
      ],
    ),
  );
  static Widget HeaderFour_Three() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '3. RPAS Flight Manual: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFourResults[2]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFourResults[2])),
        ),
      ],
    ),
  );
  static Widget HeaderFour_Four() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '4. Notices to Airmen (NOTAMS) via NavDrone: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFourResults[3]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFourResults[3])),
        ),
      ],
    ),
  );
  static Widget HeaderFour_Five() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '5. METARs: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFourResults[4]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFourResults[4])),
        ),
      ],
    ),
  );
  static Widget HeaderFour_Six() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '6. Proof of insurance (policy number): ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFourResults[5]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFourResults[5])),
        ),
      ],
    ),
  );
  static Widget HeaderFour_Seven() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '7. SFOC: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFourResults[6]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFourResults[6])),
        ),
      ],
    ),
  );
  static Widget HeaderFour_Eight() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '8. SFOC Application: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFourResults[7]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFourResults[7])),
        ),
      ],
    ),
  );
  static Widget HeaderFour_Nine() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '9. NavCan airspace approval and ATC approval if required: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFourResults[8]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFourResults[8])),
        ),
      ],
    ),
  );
  static Widget HeaderFour_Ten() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '10. InDro operational clearance: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFourResults[9]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFourResults[9])),
        ),
      ],
    ),
  );

  static Widget HeadlineFive() => Header(
    child: Text(
      'Pre-Flight Setup and Crew Briefing',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: PdfColors.white,
      ),
    ),
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(color: PdfColors.orange),
  );
  static Widget HeaderFive_One() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '1. Confirm location suitable for operation: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFiveResults[0]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFiveResults[0])),
        ),
      ],
    ),
  );
  static Widget HeaderFive_Two() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '2. Done PPE as required: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFiveResults[1]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFiveResults[1])),
        ),
      ],
    ),
  );
  static Widget HeaderFive_Three() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '3. Site survey (secure take-off/landing area, selecting GCS site \n   and check for obstacles): ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFiveResults[2]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFiveResults[2])),
        ),
      ],
    ),
  );
  static Widget HeaderFive_Four() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '4. Secure area to ensure no public access: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFiveResults[3]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFiveResults[3])),
        ),
      ],
    ),
  );
  static Widget HeaderFive_Five() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '5. Lay out cones and take-off pad: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFiveResults[4]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFiveResults[4])),
        ),
      ],
    ),
  );
  static Widget HeaderFive_Six() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '6. Fire extinguisher(s) and first aid kit in an easily accessible location: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFiveResults[5]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFiveResults[5])),
        ),
      ],
    ),
  );
  static Widget HeaderFive_Seven() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '7. Notification of nearby property owners of mission intentions if required: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFiveResults[6]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFiveResults[6])),
        ),
      ],
    ),
  );
  static Widget HeaderFive_Eight() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '8. Share mission plans via NavDrone app: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFiveResults[7]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFiveResults[7])),
        ),
      ],
    ),
  );
  static Widget HeaderFive_Nine() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '9. Wind direction, speed, temp, visibility, cloud ceiling, humidity \n   and pressure and kp-index within limits: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFiveResults[8]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFiveResults[8])),
        ),
      ],
    ),
  );
  static Widget HeaderFive_Ten() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '10. Review mission objectives and flight plan with crew: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFiveResults[9]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFiveResults[9])),
        ),
      ],
    ),
  );
  static Widget HeaderFive_Eleven() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '11. Identify safety egress routes and alternate landing site: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFiveResults[10]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFiveResults[10])),
        ),
      ],
    ),
  );
  static Widget HeaderFive_Twelve() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '12. Emergency numbers: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFiveResults[11]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFiveResults[11])),
        ),
      ],
    ),
  );
  static Widget HeaderFive_Thirteen() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '13. Review crew responsiblities: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFiveResults[12]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFiveResults[12])),
        ),
      ],
    ),
  );
  static Widget HeaderFive_Fourteen() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '14. Turn on aviation radio and select appropriate frequency: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderFiveResults[13]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderFiveResults[13])),
        ),
      ],
    ),
  );

  static Widget HeadlineSix() => Header(
    child: Text(
      'RPAS Setup Flow',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: PdfColors.white,
      ),
    ),
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(color: PdfColors.orange),
  );
  static Widget HeaderSix_One() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          'RPAS Setup Flow: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${rPASSetupFlow}',
          style: TextStyle(fontSize: 12, color: getColor(rPASSetupFlow)),
        ),
      ],
    ),
  );
  static Widget HeaderSix_Two() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          'matrice m210: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${matrice}',
          style: TextStyle(fontSize: 12, color: getColor(matrice)),
        ),
      ],
    ),
  );
  static Widget HeaderSix_Three() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          'wayfinder: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${wayfinder}',
          style: TextStyle(fontSize: 12, color: getColor(wayfinder)),
        ),
      ],
    ),
  );
  static Widget HeaderSix_Four() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          'matrice m300: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${matrice300}',
          style: TextStyle(fontSize: 12, color: getColor(matrice300)),
        ),
      ],
    ),
  );
  static Widget HeaderSix_Five() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          'Mavic Mini: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${mavicMini}',
          style: TextStyle(fontSize: 12, color: getColor(mavicMini)),
        ),
      ],
    ),
  );

  static Widget HeadlineSeven() => Header(
    child: Text(
      'Payload Setup Flow',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: PdfColors.white,
      ),
    ),
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(color: PdfColors.orange),
  );
  static Widget HeaderSeven_One() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          'Payload Setup: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${payload}',
          style: TextStyle(fontSize: 12, color: getColor(payload)),
        ),
      ],
    ),
  );
  static Widget HeaderSeven_Two() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          'micaSense Payload: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${micaSense}',
          style: TextStyle(fontSize: 12, color: getColor(micaSense)),
        ),
      ],
    ),
  );
  static Widget HeaderSeven_Three() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          'zenmuse x4s Payload: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${Zenmuse}',
          style: TextStyle(fontSize: 12, color: getColor(Zenmuse)),
        ),
      ],
    ),
  );

  static Widget HeadlineEight() => Header(
    child: Text(
      'Pre-Flight Power On Flow',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: PdfColors.white,
      ),
    ),
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(color: PdfColors.orange),
  );
  static Widget HeaderEight_One() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          'Pre-Flight Power On Flow: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${poweron}',
          style: TextStyle(fontSize: 12, color: getColor(poweron)),
        ),
      ],
    ),
  );
  static Widget HeaderEight_Two() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          'Power on matrice m210: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${matricepower}',
          style: TextStyle(fontSize: 12, color: getColor(matricepower)),
        ),
      ],
    ),
  );
  static Widget HeaderEight_Three() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          'Power on wayfinder: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${wayfinderpower}',
          style: TextStyle(fontSize: 12, color: getColor(wayfinderpower)),
        ),
      ],
    ),
  );
  static Widget HeaderEight_Four() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          'Power on matrice 300: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${matrice300power}',
          style: TextStyle(fontSize: 12, color: getColor(matrice300power)),
        ),
      ],
    ),
  );
  static Widget HeaderEight_Five() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          'Power on Mavic Mini: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${mavicMinipower}',
          style: TextStyle(fontSize: 12, color: getColor(mavicMinipower)),
        ),
      ],
    ),
  );

  static Widget HeadlineNine() => Header(
    child: Text(
      'Pre-Take Off Checklist',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: PdfColors.white,
      ),
    ),
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(color: PdfColors.orange),
  );
  static Widget HeaderNine_One() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '1. Wind and Weather: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderNineResults[0]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderNineResults[0])),
        ),
      ],
    ),
  );
  static Widget HeaderNine_Two() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '2. Air Vehicle Batteries above 50%: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderNineResults[1]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderNineResults[1])),
        ),
      ],
    ),
  );
  static Widget HeaderNine_Three() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '3. Hand Controller above 50%: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderNineResults[2]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderNineResults[2])),
        ),
      ],
    ),
  );
  static Widget HeaderNine_Four() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '4. Ground Control Station: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderNineResults[3]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderNineResults[3])),
        ),
      ],
    ),
  );
  static Widget HeaderNine_Five() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '5. Cameras: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderNineResults[4]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderNineResults[4])),
        ),
      ],
    ),
  );
  static Widget HeaderNine_Six() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '6. Take-Off Mode: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderNineResults[5]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderNineResults[5])),
        ),
      ],
    ),
  );
  static Widget HeaderNine_Seven() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '7. Area and Air Traffic: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderNineResults[6]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderNineResults[6])),
        ),
      ],
    ),
  );
  static Widget HeaderNine_Eight() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '8. Cleared Take-Off: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderNineResults[7]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderNineResults[7])),
        ),
      ],
    ),
  );

  static Widget HeadlineTen() => Header(
    child: Text(
      'Flight',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: PdfColors.white,
      ),
    ),
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(color: PdfColors.orange),
  );
  static Widget HeaderTen_One() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          'Flight Time: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          timeValue,
          style: TextStyle(fontSize: 12),
        ),
      ],
    ),
  );
  static Widget HeaderTen_Two() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          'Flight Start Time: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          flightStart,
          style: TextStyle(fontSize: 12),
        ),
      ],
    ),
  );
  static Widget HeaderTen_Three() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          'Flight End Time: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          flightEnd,
          style: TextStyle(fontSize: 12),
        ),
      ],
    ),
  );

  static Widget HeadlineEleven() => Header(
    child: Text(
      'Landing Checklist',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: PdfColors.white,
      ),
    ),
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(color: PdfColors.orange),
  );
  static Widget HeaderEleven_One() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '1. Disarm RPA: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderElevenResults[0]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderElevenResults[0])),
        ),
      ],
    ),
  );
  static Widget HeaderEleven_Two() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '2. Ensure propellers have fully stopped: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderElevenResults[1]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderElevenResults[1])),
        ),
      ],
    ),
  );
  static Widget HeaderEleven_Three() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '3. Final battery percent callout: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderElevenResults[2]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderElevenResults[2])),
        ),
      ],
    ),
  );
  static Widget HeaderEleven_Four() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '4. IF BATTERY SWAP - Insert charged battery and initiate RPAS-specific \n   Power-On flow: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderElevenResults[3]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderElevenResults[3])),
        ),
      ],
    ),
  );
  static Widget HeaderEleven_Five() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '5. IF SHUT DOWN, power down GCS: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderElevenResults[4]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderElevenResults[4])),
        ),
      ],
    ),
  );
  static Widget HeaderEleven_Six() => Container(
    //padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    //decoration: BoxDecoration(
    //    border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    //),
    child: Row(
      children: [
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          '6. Turn off flight log: ',
          style: TextStyle(fontSize: 12, color: PdfColors.black),
        ),
        Text(
          '${HeaderElevenResults[5]}',
          style: TextStyle(fontSize: 12, color: getColor(HeaderElevenResults[5])),
        ),
      ],
    ),
  );


  static getColor(String val) {
    if(val=='yes'||val=='complete'){
      return PdfColors.green;
    }
    else if(val=='no'){
      return PdfColors.red;
    }
    else {
      return PdfColors.grey;
    }
  }

}