import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/features/localization/application/ll.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

class ReportQuestionDialog extends StatefulWidget {
  const ReportQuestionDialog({super.key});

  @override
  State<ReportQuestionDialog> createState() => _ReportQuestionDialogState();
  
  static Future<String?> show(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => const ReportQuestionDialog()
    );
  }
}

class _ReportQuestionDialogState extends State<ReportQuestionDialog> {
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ll = curLl(context);
    return AlertDialog(
      title: Text(ll!.report.reportDescriptionQuestion),
      content: TextField(
        controller: descriptionController
      ),
      actions: [
        OutlinedButton(
          onPressed: () {
            context.pop();
          },
          child: Text('Cancel'.hardcoded),
        ),
        FilledButton(
          onPressed: () {
            context.pop(descriptionController.text);
          }, 
          child: Text("Send".hardcoded),
        )
      ]
    );
  }
}