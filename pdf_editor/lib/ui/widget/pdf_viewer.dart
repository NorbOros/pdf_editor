import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatelessWidget {
  const PdfViewer({super.key, required String pdfFilePath}) : _pdfFilePath = pdfFilePath;

  final String _pdfFilePath;

  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.file(File(_pdfFilePath));
  }
}
