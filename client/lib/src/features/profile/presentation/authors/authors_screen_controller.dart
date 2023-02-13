import 'package:client/src/common/log.dart';
import 'package:client/src/common/pagination/page_list.dart';
import 'package:client/src/common/pagination/pagination_controller.dart';
import 'package:client/src/features/profile/data/profile_repository.dart';
import 'package:client/src/features/profile/domain/profile.dart';
import 'package:client/src/features/profile/presentation/authors/authors_query_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class AuthorsScreenController extends AutoDisposeAsyncNotifier<List<Profile>> implements PaginationController {
  ProfileRepository get profileRepo => ref.watch(profileRepositoryProvider);

  @override
  FutureOr<List<Profile>> build() {
    printInfo("build AuthorsScreenController");
    listenToQueryChanges();
    return profileRepo.getProfiles(ref.watch(authorsQueryStateProvider));
  }

  void listenToQueryChanges() {
    printSuccess('start listening to query changes');
    ref.listen(authorsQueryStateProvider, (prevQuery, nextQuery) {
      printSuccess('query changes - refreshing');
      refresh();
    });
  }

  @override
  Future<void> refresh() async {
    String currentQuery = ref.watch(authorsQueryStateProvider);
    printInfo(currentQuery);
    state = AsyncData(
      await profileRepo.getProfiles(currentQuery));
    await Future.delayed(const Duration(seconds: 1));
    printSuccess('authors refreshed!');
  }

  @override
  Future<bool> addPage() async {
    int prevLen = state.value!.length;
    await Future.delayed(const Duration(seconds: 1));
    state = AsyncData(
      state.value!.addPage(await profileRepo.getProfiles(
        ref.read(authorsQueryStateProvider), 
        state.value!.length + 1))
    );
    return prevLen < state.value!.length;
  }
}

// dependencies нужно для того чтобы контроллер ребилдился, 
// если я overrideWith одного из dependencies.
final authorsScreenControllerProvider = AutoDisposeAsyncNotifierProvider<
  AuthorsScreenController,
  List<Profile>
>(
  () => AuthorsScreenController(),
);