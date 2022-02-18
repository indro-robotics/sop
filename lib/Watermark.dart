import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:io';
import 'emailNav.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'pdf_api.dart';



class WatermarkAPI {

  static Future<Future<void>?> generatedCenteredText(String text) async {
    final pdf = PdfDocument();
  }


  static Future<PdfDocument> addWatermark({
    required Document pdf,
  }) async {
    //PdfDocument pdfDoc = PdfApi.saveExternalDocument(name:name, pdf:pdf) as PdfDocument;

    //Name of Document construction
    var now = DateTime.now().toString();
    String dateResult = now.replaceAll(RegExp('_'), ' ');
    if (dateResult != null && dateResult.length >= 4) {
      dateResult = dateResult.substring(0, dateResult.length - 4);
    }

    String prefix = 'SOP_';
    String end = '.pdf';

    String result = prefix + dateResult + end;

    //Save
    PdfDocument pdfDoc = PdfApi.saveExternalDocument(
        name: result, pdf: pdf) as PdfDocument;

    //Return type PDF
    return pdfDoc;
  }
}










