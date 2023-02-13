
import 'package:client/src/common/log.dart';
import 'package:client/src/common/pagination/pagination_controller.dart';
import 'package:client/src/features/profile/domain/profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

typedef PaginationItemsCallback<T> = Future<List<T>> Function(int from);

class PaginationListWidgetController<Type> 
    extends AutoDisposeFamilyAsyncNotifier<List<Type>, 
      PaginationItemsCallback<Type>>
    implements PaginationController {

  late PaginationItemsCallback<Type> getItems;

  @override
  FutureOr<List<Type>> build(PaginationItemsCallback<Type> arg) async {
    this.getItems = arg;
    printInfo("got it.");
    return getItems(0);
  }
  
  @override
  Future<void> refresh() async {
    // state = await getItems(0);
    state = AsyncData(await getItems(0));
  }

  @override
  Future<bool> addPage() async {
    // final nextPage = await getItems(state.length + 1);
    // state = nextPage;
    final nextPage = await getItems(state.value!.length + 1);
    state = AsyncData(nextPage);
    return nextPage.isNotEmpty;
  }
}

final paginationListWidgetControllerProvider = 
  AutoDisposeAsyncNotifierProviderFamily<
    PaginationListWidgetController<Profile>, 
    List<Profile>, 
    PaginationItemsCallback
  >(
  () => PaginationListWidgetController<Profile>()
);
