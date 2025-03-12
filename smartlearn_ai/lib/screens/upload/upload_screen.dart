import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:smartlearn_ai/services/outline_service.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final OutlineService outlineService = OutlineService();
  String? outlineText;

  Future<void> pickAndParsePDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      File file = File(result.files.single.path!);
      String outline = await outlineService.generateOutline(file);
      setState(() {
        outlineText = outline;
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload PDF'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: pickAndParsePDF,
              child: const Text('Pick and Parse PDF'),
            ),
            const SizedBox(height: 20),
            if (outlineText != null)
              Expanded(
                child: SingleChildScrollView(
                  child: Text(outlineText!),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
