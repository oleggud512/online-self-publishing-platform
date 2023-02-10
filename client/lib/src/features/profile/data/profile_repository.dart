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

  getProfiles() async {

  }
  Future<Profile> getProfile(String id) async {
    // GET /profiles/id?full=true
    try {
      print(id);
      final resp = await _dio.get('profiles/$id');

      print("DAAAAATTTTTAAAA: ${resp.data}");
      final profile = Profile.fromJson(resp.data['data']);
      print("profile: $profile that was my profile");
      print(profile.runtimeType);
      return profile;
    } on DioError catch (e) {
      print("${e.runtimeType} was rethrown from ProfileRepository");
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
}

final profileRepositoryProvider = Provider((ref) {
  return ProfileRepository(ref.watch(dioProvider), ref.watch(myIdProvider));
});