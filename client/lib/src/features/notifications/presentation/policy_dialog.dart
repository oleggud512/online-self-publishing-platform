import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../common/constants/constants.dart';

class PolicyDialog extends StatelessWidget {
  const PolicyDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return const PolicyDialog();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(),
        // body: WebViewWidget(
        //   controller: WebViewController()
        //     ..loadFlutterAsset('assets/policy.html')
        // )
        body: FutureBuilder<String>(
          future: rootBundle.loadString('assets/policy.html'),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return shrink;
            return SingleChildScrollView(
              child: Html(
                data: snapshot.data,
                style: {
                  'body': Style(
                    padding: HtmlPaddings.all(p16),
                    margin: Margins.zero
                  )
                }
              ),
            );
          }
        )
      )
    );
  }
}
