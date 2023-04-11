import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfUploaderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDF Uploader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PdfUploaderHomePage(),
    );
  }
}

class PdfUploaderHomePage extends StatefulWidget {
  @override
  _PdfUploaderHomePageState createState() => _PdfUploaderHomePageState();
}

class _PdfUploaderHomePageState extends State<PdfUploaderHomePage> {
  File? _selectedFile;
  int _pages = 0;
  PDFViewController? _pdfViewController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/pag.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 80),
              child: const Text(
                "Create\nAccount",
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    right: 35,
                    left: 35,
                    top: MediaQuery.of(context).size.height * 0.27),
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['pdf'],
                              );
                              if (result != null) {
                                setState(() {
                                  _selectedFile =
                                      File(result.files.single.path!);
                                });
                              }
                            },
                            child: Text('Select PDF'),
                          ),
                          SizedBox(height: 16),
                          if (_selectedFile != null)
                            Expanded(
                              child: PDFView(
                                filePath: _selectedFile!.path,
                                onViewCreated:
                                    (PDFViewController pdfViewController) {
                                  _pdfViewController = pdfViewController;
                                  _pdfViewController!
                                      .getPageCount()
                                      .then((value) {
                                    setState(() {
                                      _pages = value!;
                                    });
                                  });
                                },
                              ),
                            ),
                          if (_selectedFile != null)
                            Text('Total Pages: $_pages'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: const Color(0xff4c505b),
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward),
                            ),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'login');
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
