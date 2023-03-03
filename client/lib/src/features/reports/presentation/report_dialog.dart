import 'package:client/src/common/widgets/error_handler.dart';
import 'package:client/src/features/reports/domain/report_type.dart';
import 'package:client/src/features/reports/presentation/report_dialog_controller.dart';
import 'package:client/src/shared/identifiable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    final added = await cont.addReport(reportType);
    if (added && context.mounted) {
      context.pop();
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
        error: defaultErrorHandler
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