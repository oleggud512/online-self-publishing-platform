import 'package:client/src/common/log.dart';
import 'package:client/src/common/widgets/error_handler.dart';
import 'package:client/src/features/books/data/local_book_repository.dart';
import 'package:client/src/features/books/domain/book.dart';
import 'package:client/src/features/profile/domain/profile.dart';
import 'package:client/src/shared/dio.dart';
import 'package:client/src/shared/err.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/constants.dart';
import '../../auth/application/my_id_provider.dart';


class ProfileRepository {
  final Dio _dio;
  final String? _myId;
  final LocalBookRepository localBook;

  ProfileRepository(this._dio, this._myId, this.localBook);

  Future<List<Profile>> getProfiles([
    String query = "", 
    int from = 0,
    int pageSize = 20, 
  ]) => err<List<Profile>>(() async {
    final resp = await _dio.get(Str.dio.profiles, queryParameters: {
      'query': query,
      'from': from,
      'pageSize': pageSize,
    });
    return profileListFromJson(List<Map<String, dynamic>>.from(resp.data['data']));
  });

  Future<List<Profile>> getPopularAuthors([int from = 0, int pageSize = 20]) 
      => err(() async {
    final resp = await _dio.get(Str.dio.popularAuthors, queryParameters: {
      Str.dio.from: from,
      Str.dio.pageSize: pageSize
    });
    return profileListFromJson(resp.data[Str.dio.data]);
  });

  Future<Profile> getProfile(String? id) async {
    if (id == null) throw UnauthenticatedException();
    try {
      final resp = await _dio.get('profiles/$id');
      final profile = Profile.fromJson(resp.data['data']);
      printInfo('profilebooks: ${profile.books?.map((b) => {'b': b.bookmarked, 'name': b.name})}');
      return profile;
    } on DioError catch (e) {
      // TODO: что блин тут делать?
      printError("myerror");
      printError("printError() => ${e.runtimeType} was rethrown from ProfileRepository");
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
    final resp = await _dio.put("profiles/${profile.id}", 
      data: profile.toJson()
    );
    final updatedProfile = Profile.fromJson(resp.data['data']);
    return updatedProfile;
  }

  Future<bool> subscribe(String subscribeToId) async {
    try {
      final resp = await _dio.post('profiles/subscribe/$subscribeToId');
      return resp.data['data'] as bool;
    } catch (e) {
      return false;
    }
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
    printSuccess("profileId = $profileId");
    String id = profileId == null || profileId.isEmpty ? _myId! : profileId;
    printSuccess("myId = $_myId");
    printSuccess("id = $id");
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

  Future<void> saveBookmarks(List<String> bookmarks) async {
    if (_myId == null) throw UnauthenticatedException();
    await _dio.post('profiles/$_myId/bookmarks', data: { 'bookmarks': bookmarks });
  }

  Future<List<Book>> getBookmarks([int from = 0, int pageSize = 20]) async {
    if (_myId == null) {
      final ids = await localBook.getBookmarks();
      if (ids.isEmpty) return List.empty();
      final resp = await _dio.get('books', queryParameters: {
        'ids': await localBook.getBookmarks(),
        'from': from,
        'pageSize': pageSize
      });
      return bookListFromJson(resp.data['data']);
    }
    final resp = await _dio.get('profiles/$_myId/bookmarks', queryParameters: {
      'from': from,
      'pageSize': pageSize
    });
    return bookListFromJson(resp.data['data']);
  }
}

final profileRepositoryProvider = Provider((ref) {
  return ProfileRepository(ref.watch(dioProvider), ref.watch(myIdProvider), ref.watch(localBookRepositoryProvider));
});
