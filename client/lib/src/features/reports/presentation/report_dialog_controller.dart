
import 'package:client/src/common/log.dart';
import 'package:client/src/features/reports/data/report_repository.dart';
import 'package:client/src/features/reports/domain/report_subject.dart';
import 'package:client/src/features/reports/domain/report_type.dart';
import 'package:client/src/shared/identifiable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_dialog_controller.g.dart';

@riverpod
class ReportDialogController extends _$ReportDialogController {
  ReportRepostiory get reportRepo => ref.watch(reportRepositoryProvider);

  FutureOr<List<ReportType>> build(Identifiable subject) {
    return reportRepo.getReportTypes(ReportSubject.fromObject(subject));
  }

  Future<bool> addReport(ReportType type) async {
    try {
      final added = await reportRepo.addReport(subject, type.name);
      return added;
    } catch (e) {
      printError(e);
      return Future.value(false);
    }
  }
}