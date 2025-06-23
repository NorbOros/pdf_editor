import 'package:flutter/material.dart';
import 'package:pdf_editor/ui/widget/file_browser.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: FileBrowser()));
  }
}
