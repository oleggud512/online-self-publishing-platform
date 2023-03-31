

import 'dart:convert';

import 'package:client/src/common/log.dart';
import 'package:client/src/shared/sembast.dart';
import 'package:client/src/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sembast/sembast.dart';

import '../../../shared/constants.dart';
import '../domain/notification.dart';

class NotificationRepository {
  NotificationRepository(this.db);

  final Database db;
  final stref = stringMapStoreFactory.store('notifications');
  
  Future<String> addNotification(MyNotification not) async {
    final json = not.toJson();
    printInfo('repo.addNotification.json = ${const JsonEncoder.withIndent('  ').convert(json)}\n\n');
    return stref.add(db, not.toJson());
  }

  List<MyNotification> _snapshotsToNotifications(List<RecordSnapshot<String, Map<String, Object?>>> snapshots) {
    return snapshots.map((snap) {
      final not = MyNotification.fromJson(snap.value).copyWith(localId: snap.key);
      printInfo(snap);
      printInfo(not);
      return not;
    }).toList();
  }

  Stream<List<MyNotification>> watchNotifications() {
    return stref.query(finder: Finder(sortOrders: [SortOrder(Str.sentTime, false)]))
      .onSnapshots(db)
      .map(_snapshotsToNotifications);
  }

  Future<List<MyNotification>> getNotifications() async {
    final snapshots = await stref.query(
      finder: Finder(sortOrders: [SortOrder(Str.sentTime, false)])
    ).getSnapshots(db);
    return _snapshotsToNotifications(snapshots);
  }

  Future<void> clearNotifications() async {
    await stref.delete(db);
  }

  Future<void> deleteNotification(String id) async {
    await stref.record(id).delete(db);
  }

  static final provider = Provider(
    (ref) => NotificationRepository(ref.watch(sembastDatabaseProvider)!)
  );

  static final notificationsStreamProvider = StreamProvider((ref) {
    final repo = ref.watch(NotificationRepository.provider);
    return repo.watchNotifications();
  });
}