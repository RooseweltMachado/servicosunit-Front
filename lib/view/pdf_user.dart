import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfUser extends StatefulWidget {
  final String? arquivo;
  const PdfUser(this.arquivo, {Key? key}) : super(key: key);

  @override
  _PdfUserState createState() => _PdfUserState();
}

class _PdfUserState extends State<PdfUser> {
  String urlPDFPath = "";
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController? _pdfViewController;

  // Future<File> getFileFromUrl(String url, {name}) async {
  //   var fileName = 'testonline';
  //   if (name != null) {
  //     fileName = name;
  //   }
  //   try {
  //     var data = await http.get(url);
  //     var bytes = data.bodyBytes;
  //     var dir = await getApplicationDocumentsDirectory();
  //     File file = File("${dir.path}/" + fileName + ".pdf");
  //     print(dir.path);
  //     File urlFile = await file.writeAsBytes(bytes);
  //     return urlFile;
  //   } catch (e) {
  //     throw Exception("Error opening url file");
  //   }
  // }
  @override
  // void initState() {
  //   getFileFromUrl("http://www.africau.edu/images/default/sample.pdf").then(
  //     (value) => {
  //       setState(() {
  //         if (value != null) {
  //           urlPDFPath = value.path;
  //           loaded = true;
  //           exists = true;
  //         } else {
  //           exists = false;
  //         }
  //       })
  //     },
  //   );
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    print(widget.arquivo);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 35, 78, 152),
        centerTitle: true,
        title: Text("PDF"),
      ),
      body: PDFView(
        filePath: widget.arquivo,
        autoSpacing: true,
        enableSwipe: true,
        pageSnap: true,
        swipeHorizontal: true,
        nightMode: false,
        onError: (e) {
          //Show some error message or UI
        },
        onRender: (_pages) {
          setState(() {
            _totalPages = _pages!;
            pdfReady = true;
          });
        },
        onViewCreated: (PDFViewController vc) {
          setState(() {
            _pdfViewController = vc;
          });
        },
        onPageError: (page, e) {},
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.chevron_left),
            iconSize: 50,
            color: Colors.black,
            onPressed: () {
              setState(() {
                if (_currentPage > 0) {
                  _currentPage--;
                  _pdfViewController!.setPage(_currentPage);
                }
              });
            },
          ),
          Text(
            "${_currentPage + 1}/$_totalPages",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          IconButton(
            icon: Icon(Icons.chevron_right),
            iconSize: 50,
            color: Colors.black,
            onPressed: () {
              setState(() {
                if (_currentPage < _totalPages - 1) {
                  _currentPage++;
                  _pdfViewController!.setPage(_currentPage);
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
