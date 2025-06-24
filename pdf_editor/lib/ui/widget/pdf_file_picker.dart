import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class PdfFilePicker extends StatefulWidget {
  final Function(String filePath) onPdfSelected;

  const PdfFilePicker({super.key, required this.onPdfSelected});

  @override
  State<PdfFilePicker> createState() => _PdfFilePickerState();
}

class _PdfFilePickerState extends State<PdfFilePicker> {
  bool _isDragging = false;

  Future<void> _pickPdf(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null && result.files.single.path != null) {
      final filePath = result.files.single.path!;
      widget.onPdfSelected(filePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragDone: _handleFileDrop,
      onDragEntered: (details) {
        setState(() {
          _isDragging = true;
        });
      },
      onDragExited: (details) {
        setState(() {
          _isDragging = false;
        });
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.picture_as_pdf, size: 50, color: _isDragging ? Colors.blue : Colors.grey[700]),
            Text(
              _isDragging ? 'Release to drop PDF' : 'Drag & Drop PDF here',
              style: TextStyle(color: _isDragging ? Colors.blue : Colors.grey[700], fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const Text("or"),
            TextButton(onPressed: () => _pickPdf(context), child: const Text('Select Files')),
          ],
        ),
      ),
    );
  }

  void _handleFileDrop(DropDoneDetails details) {
    setState(() {
      _isDragging = false;
    });

    if (details.files.isNotEmpty) {
      final droppedFile = details.files.first;
      final filePath = droppedFile.path;

      if (path.extension(filePath).toLowerCase() == '.pdf') {
        widget.onPdfSelected(filePath);
      }
    }
  }
}
