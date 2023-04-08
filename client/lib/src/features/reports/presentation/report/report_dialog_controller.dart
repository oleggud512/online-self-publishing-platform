
import 'package:client/src/common/log.dart';
import 'package:client/src/features/reports/data/report_repository.dart';
import 'package:client/src/features/reports/domain/report_subject.dart';
import 'package:client/src/features/reports/domain/report_type.dart';
import 'package:client/src/shared/identifiable.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_dialog_controller.g.dart';

@riverpod
class ReportDialogController extends _$ReportDialogController {
  ReportRepostiory get reportRepo => ref.watch(reportRepositoryProvider);

  FutureOr<List<ReportType>> build(Identifiable subject) {
    return reportRepo.getReportTypes(ReportSubject.subjectNameFromObject(subject));
  }

  Future<bool> addReport(ReportType type, String description) async {
    try {
      final added = await reportRepo.addReport(subject, type.name, description);
      return added;
    } catch (e) {
      printError(e);
      return Future.value(false);
    }
  }
}

class Mambinio extends StatefulWidget {
  const Mambinio({super.key});

  @override
  State<Mambinio> createState() => _MambinioState();
}

class _MambinioState extends State<Mambinio> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}