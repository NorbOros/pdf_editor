import 'package:flutter/material.dart';
import 'package:pdf_editor/ui/widget/pdf_file_picker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _handlePdfSelected(String filePath) {
    debugPrint("Selected PDF: $filePath");
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(body: Center(child: FileBrowser()));
    return Scaffold(
      body: Center(child: PdfFilePicker(onPdfSelected: _handlePdfSelected)),
    );
  }
}
