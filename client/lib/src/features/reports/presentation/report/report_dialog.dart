import 'package:client/src/shared/errors/exceptions.dart';
import 'package:client/src/features/reports/domain/report_type.dart';
import 'package:client/src/features/reports/presentation/report/report_dialog_controller.dart';
import 'package:client/src/features/reports/presentation/report_question/report_question_dialog.dart';
import 'package:client/src/shared/identifiable.dart';
import 'package:client/src/shared/utils.dart';
import 'package:client/src/shared/errors/map_error_to_widget.dart';
import 'package:client/src/shared/errors/widgets/default_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:client/src/common/build_context_ext.dart';

class ReportDialog extends ConsumerStatefulWidget {
  const ReportDialog({super.key, required this.subject});

  final Identifiable subject;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReportDialogState();
}

class _ReportDialogState extends ConsumerState<ReportDialog> {
  ReportDialogController get cont => 
    ref.watch(reportDialogControllerProvider(widget.subject).notifier);
  AsyncValue<List<ReportType>> get state => 
    ref.watch(reportDialogControllerProvider(widget.subject));

  Future<void> onReportTypeSelected(ReportType reportType) async {
    final description = await ReportQuestionDialog.show(context);
    if (description == null) return;
    final added = await cont.addReport(reportType, description);
    if (added && context.mounted) {
      Navigator.of(context).pop();
      final ll = context.ll!;
      Utils.showMessagew(ref, ll.report.reportAddedMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = this.state;
    return Dialog.fullscreen(
      insetAnimationDuration: const Duration(milliseconds: 500),
      insetAnimationCurve: Curves.easeIn,
      child: state.when(
        data: (reportTypes) => Scaffold(
          appBar: AppBar(),
          body: ListView.builder(
            itemCount: reportTypes.length,
            itemBuilder:(context, index) {
              final reportType = reportTypes[index];
              return ListTile(
                onTap: () => onReportTypeSelected(reportType),
                title: Text(reportType.displayName),
                subtitle: Text(reportType.description)
              );
            },
          ),
        ),
        loading: defaultLoading,
        error: mapErrorToWidget
      )
    );
  }
}

Future<void> showReportDialog(BuildContext context, Identifiable subject) {
  return showDialog(
    context: context, 
    builder: (context) => ReportDialog(subject: subject)
  );
}
