import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'generated/l10n.dart';

class PdfPreviewPage extends StatelessWidget {
  String? result1;
  String? result2;
  String? constant1;
  String? constant2;
  String? iter_time1;
  String? iter_time2;
  String? accur1;
  String? accur2;
  PdfPreviewPage(this.result1, this.result2, this.constant1, this.constant2,
      this.iter_time1, this.iter_time2, this.accur1, this.accur2,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(S.of(context).pdfPreview),
      ),
      body: PdfPreview(
        build: (context) => makePdf(),
      ),
    );
  }

  Future<Uint8List> makePdf() async {
    final pdf = pw.Document();
    pdf.addPage(
        pw.Page(
            pageFormat: PdfPageFormat.a4,
            build: (context) {
              return pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Header(text: "PDF preview", level: 1),
                        ]
                    ),
                    pw.Divider(borderStyle: pw.BorderStyle.dashed),
                    pw.Paragraph(text: result1),
                    pw.Paragraph(text: constant1),
                    pw.Paragraph(text: iter_time1),
                    pw.Paragraph(text: accur1),
                    pw.Paragraph(text: result2),
                    pw.Paragraph(text: iter_time2),
                    pw.Paragraph(text: constant2),
                    pw.Paragraph(text: accur2),
                  ]
              );
            }
        ));
    return pdf.save();
  }
}