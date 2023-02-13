import 'package:client/src/common/log.dart';
import 'package:client/src/features/profile/domain/profile.dart';
import 'package:client/src/shared/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/application/my_id_provider.dart';


class ProfileRepository {
  final Dio _dio;
  final String? _myId;

  ProfileRepository(this._dio, this._myId);

  Future<List<Profile>> getProfiles([
    String query = "", 
    int from = 0,
    int limit = 20, 
  ]) async {
    try {
      final resp = await _dio.get('profiles', queryParameters: {
        'query': query,
        'from': from,
        'limit': limit,
      });
      return profileListFromJson(List<Map<String, dynamic>>.from(resp.data['data']));
    } catch (e) {
      rethrow;
    }
  }

  Future<Profile> getProfile(String id) async {
    try {
      final resp = await _dio.get('profiles/$id');
      final profile = Profile.fromJson(resp.data['data']);
      return profile;
    } on DioError catch (e) {
      printError("${e.runtimeType} was rethrown from ProfileRepository");
      rethrow;
    }
  }

  Future<bool> isUniqueName(String name) async {
    final resp = await _dio.get('profiles/is-unique-name', 
      queryParameters: {
        'name': name,
        if (_myId != null) 'uid': _myId
      }
    );
    printInfo(Uri(path: 'profiles/is-unique-name', queryParameters: {
      'name': name,
      if (_myId != null) 'uid': _myId
    }).toString());
    return resp.data['data'] as bool;
  }

  Future<Profile> updateProfile(Profile profile) async {
    final resp = await _dio.post("profiles/${profile.id}", 
      data: profile.toJson()
    );
    return Profile(name: 'ПУСТОЙ ПРОФИЛЬ - ЗАМЕНИ ЕГО');
  }

  Future<bool> subscribe(String subscribeToId) async {
    final resp = await _dio.post('profiles/subscribe/$subscribeToId');
    return resp.data['data'] as bool;
  }

  Future<bool> unsubscribe(String unsubscribeFromId) async {
    final resp = await _dio.post('profiles/unsubscribe/$unsubscribeFromId');
    return resp.data['data'] as bool;
  }

  /// подписан ли я на кого-то с subscriberId. 
  Future<bool> isSubscribed(String subscriberId) async {
    final resp = await _dio.post('profiles/isSubscribed/$subscriberId');
    return resp.data['data'] as bool;
  }
  /// подписан ли он на меня
  Future<bool> isMySubscriber(String subscriberId) async {
    // TODO: implement
    throw UnimplementedError();
  }

  Future<List<Profile>> subscribers([
    String? profileId, 
    int from = 0, 
    int pageSize = 20
  ]) async {
    printSuccess("profileId = ${profileId}");
    String id = profileId == null || profileId.isEmpty ? _myId! : profileId;
    printSuccess("myId = $_myId");
    printSuccess("id = ${id}");
    final resp = await _dio.get('profiles/$id/subscribers', queryParameters: {
      'from': from,
      'pageSize': pageSize
    });
    printSuccess(resp.data);
    return profileListFromJson(List<Map<String, dynamic>>.from(resp.data['data']));
  }
  
  Future<List<Profile>> subscriptions([
    String? profileId, 
    int from = 0, 
    int pageSize = 20
  ]) async {
    String id = profileId ?? _myId!;
    final resp = await _dio.get('profiles/$id/subscriptions', queryParameters: {
      'from': from,
      'pageSize': pageSize
    });
    return profileListFromJson(List<Map<String, dynamic>>.from(resp.data['data']));
  }
}

final profileRepositoryProvider = Provider((ref) {
  return ProfileRepository(ref.watch(dioProvider), ref.watch(myIdProvider));
});