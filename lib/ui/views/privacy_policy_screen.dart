import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../route/route.dart';
import '../widgets/violet_btn.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  PdfViewerController? _PdfViewerController;
  var _loaded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
        child: Column(
          children: [
            Expanded(
                child: SfPdfViewer.network(
              'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
              scrollDirection: PdfScrollDirection.vertical,
              onDocumentLoaded: (PdfDocumentLoadedDetails details) {
                _loaded.value = true;
              },
            )),
            Obx(() => _loaded == true
                ? VioletBtn('Submit', () => Get.toNamed(mainHome))
                : Text("Still Loading... ... ")),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    ));
  }
}
