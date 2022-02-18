//import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:io';
import 'emailNav.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';





class PdfApi{

  static Future<Future<void>?> generatedCenteredText(String text) async{
    final pdf = Document();

    pdf.addPage(Page(
      build: (context) => Center(
        child: Text(text,style: TextStyle(fontSize: 48)),
      ),
    ));

    //PdfGraphics graphics = pdf.graphics;

    var now = DateTime.now().toString();
    String dateResult = now.replaceAll(RegExp('_'), ' ');
    if (dateResult != null && dateResult.length >= 4) {
      dateResult = dateResult.substring(0, dateResult.length - 4);
    }

    String prefix = 'SOP_';
    String end = '.pdf';

    String result = prefix + dateResult + end;

    //return saveDocument(name: result, pdf:pdf);
    saveExternalDocument(name: result, pdf:pdf);
  }


  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async{

    //add watermark
    //PdfGraphics graphics = pdf.graphics;

    final bytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');


    await file.writeAsBytes(bytes);
    return file;
  }

  static Future<File> saveExternalDocument({
    required String name,
    required Document pdf,
  }) async{
    final bytes = await pdf.save();
    final path = (await getExternalStorageDirectory())?.path;

    final file = File('$path/$name');
    //String filePath = ('$path/$name');
    await file.writeAsBytes(bytes, flush: true);
    //file.dispose();
    return file;
    //OpenFile.open('$path/$name');
    //await file.writeAsBytes(bytes);
    //return file;
  }



  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}











