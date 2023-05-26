import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PdfFilesScreen extends StatefulWidget {
  @override
  _PdfFilesScreenState createState() => _PdfFilesScreenState();
}

class _PdfFilesScreenState extends State<PdfFilesScreen> {
  List<PdfFile> _pdfFiles = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchPdfFiles();
  }

  Future<void> _fetchPdfFiles() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Replace with your API endpoint for retrieving the list of PDF files
      var url = 'https://example.com/api/pdf-files';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var files = data['files'] as List<dynamic>;

        setState(() {
          _pdfFiles = files.map((file) => PdfFile.fromJson(file)).toList();
        });
      } else {
        print('Failed to fetch PDF files');
      }
    } catch (e) {
      print('Error: $e');
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Files'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _pdfFiles.length,
              itemBuilder: (context, index) {
                var pdfFile = _pdfFiles[index];
                return ListTile(
                  title: Text(pdfFile.name),
                  onTap: () => _openPdfFile(pdfFile),
                );
              },
            ),
    );
  }

  Future<void> _openPdfFile(PdfFile pdfFile) async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Replace with your API endpoint for downloading the PDF file
      var url = 'https://example.com/api/pdf-files/${pdfFile.id}/download';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var bytes = response.bodyBytes;
        var tempDir = await getTemporaryDirectory();
        var filePath = '${tempDir.path}/${pdfFile.name}.pdf';
        await File(filePath).writeAsBytes(bytes);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PdfViewerScreen(filePath: filePath),
          ),
        );
      } else {
        print('Failed to download PDF file');
      }
    } catch (e) {
      print('Error: $e');
    }
    setState(() {
      _isLoading = false;
    });
  }
}

class PdfFile {
  final String id;
  final String name;

  PdfFile({
    required this.id,
    required this.name,
  });

  factory PdfFile.fromJson(Map<String, dynamic> json) {
    return PdfFile(
      id: json['id'],
      name: json['name'],
    );
  }
}

class PdfViewerScreen extends StatelessWidget {
  final String filePath;

  const PdfViewerScreen({required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: PDFView(
        filePath: filePath,
      ),
    );
  }
}
