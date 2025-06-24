import 'package:flutter/material.dart';
import 'package:pdf_editor/ui/widget/pdf_file_picker.dart';
import 'package:pdf_editor/ui/widget/pdf_viewer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isPdfSelected = false;
  String _pdfFilePath = '';
  void _handlePdfSelected(String pdfFilePath) {
    setState(() {
      _isPdfSelected = true;
      _pdfFilePath = pdfFilePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _isPdfSelected ? PdfViewer(pdfFilePath: _pdfFilePath) : PdfFilePicker(onPdfSelected: _handlePdfSelected)),
    );
  }
}
