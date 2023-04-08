import 'package:client/src/features/books/domain/book.dart';
import 'package:client/src/features/chapters/data/chapter_repository.dart';
import 'package:client/src/features/chapters/domain/chapter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/log.dart';
import '../common/pagination/pagination_controller.dart';
import '../common/pagination/pagination_list_widget_controller.dart';
import '../features/auth/application/my_id_provider.dart';
import '../features/books/data/book_repository.dart';
import '../features/books/domain/filters.dart';
import '../features/profile/application/current_profile_id.dart';
import '../features/profile/data/profile_repository.dart';
import '../features/profile/domain/profile.dart';


/// should be used after you ensure that currentProfileIdProvider is set. 
/// Usualy it's set after you navigate to some profile. 
class PaginationCallbackFactory {
  PaginationCallbackFactory._internal();

  static PaginationCallbackFactory? _instance;

  static PaginationCallbackFactory get instance {
    _instance ??= PaginationCallbackFactory._internal();
    return _instance!;
  }

  PaginationItemsCallback<Profile> createSubscribersCallback(
    WidgetRef ref, 
    String profileId
  ) {
    return (int from) => 
      ref.watch(profileRepositoryProvider).subscribers(profileId, from);
  }

  PaginationItemsCallback<Profile> createSubscriptionsCallback(
    WidgetRef ref, 
    String profileId
  ) {
    return (int from) => 
      ref.watch(profileRepositoryProvider).subscriptions(profileId, from);
  }

  PaginationItemsCallback<Book> createProfileBooksCallback(
    WidgetRef ref, 
    String ofProfile
  ) {
    return (from) {
      return ref.watch(bookRepositoryProvider)
        .getBooks(
          Filters(
            ofProfile: ofProfile,
            forProfile: ref.watch(myIdProvider)
          ), 
          from
        );
    };
  }

  PaginationItemsCallback<Chapter> createBookChaptersCallback(
    WidgetRef ref, 
    String bookId
  ) {
    return (from) {
      return ref.watch(chapterRepositoryProvider)
        .getChapters(bookId, from);
    };
  }
  
  PaginationItemsCallback<Book> createPopularBooksCallback(WidgetRef ref) {
    return (from) {
      return ref.watch(bookRepositoryProvider)
        .getPopularBooks(from);
    };
  }
  
  PaginationItemsCallback<Profile> createPopularAuthorsCallback(WidgetRef ref) {
    return (from) {
      return ref.watch(profileRepositoryProvider)
        .getPopularAuthors(from);
    };
  }
}
