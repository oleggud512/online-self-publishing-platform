import 'package:client/src/shared/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sembast/sembast.dart';

final sembastDatabaseProvider = Provider<Database?>((ref) {
  final v = ref.watch(sembastDatabaseFutureProvider);
  return v.when(data: (db) => db, error: (e, st) => null, loading: () => null);
});


final sembastDatabaseFutureProvider = FutureProvider((ref) {
  return Utils.makeSembastDatabase();
});