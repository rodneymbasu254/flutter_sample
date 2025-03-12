import 'dart:io';
import 'package:smartlearn_ai/utils/outline_parser.dart';

class OutlineService {
  Future<String> generateOutline(File pdfFile) async {
    final parser = OutlineParser();
    final outlineList = await parser.parsePDF(pdfFile); // This is List<String>
    return outlineList.join('\n'); // Convert to a single string
  }
}
