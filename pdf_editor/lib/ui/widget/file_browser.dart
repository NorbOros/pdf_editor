import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileBrowser extends StatelessWidget {
  const FileBrowser({super.key});

  Future<void> _pickPdf(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null && result.files.single.path != null) {
      final filePath = result.files.single.path!;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Selected file: $filePath')));
    }

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () => _pickPdf(context), child: const Text('Open PDF'));
  }
}
