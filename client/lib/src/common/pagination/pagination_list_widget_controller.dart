
import 'package:client/src/common/log.dart';
import 'package:client/src/common/pagination/page_list.dart';
import 'package:client/src/common/pagination/pagination_controller.dart';
import 'package:client/src/features/profile/domain/profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


class PaginationListWidgetController<Type> 
    extends AutoDisposeFamilyAsyncNotifier<List<Type>, 
      PaginationItemsCallback<Type>>
    with PaginationController<Type> {

  @override
  FutureOr<List<Type>> build(PaginationItemsCallback<Type> arg) async {
    this.getItems = arg;
    printInfo('PaingationListWidgetController<Type> built');
    return getItems(0);
  }

  @override
  late PaginationItemsCallback<Type> getItems;

  @override
  List<Type> get listState => state.value!;
  
  @override
  set listState(List<Type> newList) => state = AsyncData(newList);
}


final paginationListWidgetControllerProvider = 
  AutoDisposeAsyncNotifierProviderFamily<
    PaginationListWidgetController<dynamic>, 
    List<dynamic>, 
    PaginationItemsCallback
  >(
  () => PaginationListWidgetController<dynamic>()
);
