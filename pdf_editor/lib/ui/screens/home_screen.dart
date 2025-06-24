import 'package:flutter/material.dart';
import 'package:pdf_editor/ui/widget/drag_and_drop_area.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _handlePdfSelected(String filePath) {
    debugPrint("Selected PDF: $filePath");
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(body: Center(child: FileBrowser()));
    return Scaffold(
      body: Center(child: PdfDropTargetAndPicker(onPdfSelected: _handlePdfSelected)),
    );
  }
}
