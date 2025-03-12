import 'dart:io';
import 'package:pdf_text/pdf_text.dart';

class OutlineParser {
  Future<List<String>> parsePDF(File pdfFile) async {
    final PDFDoc doc = await PDFDoc.fromFile(pdfFile);
    final List<String> outline = [];

    for (int i = 1; i <= doc.length; i++) {
      final pageText = await doc.pageAt(i).text;
      outline.add(pageText);
    }

    return outline;
  }
}
