
import 'package:client/src/common/log.dart';
import 'package:client/src/common/pagination/pagination_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


/// we would use this with any antity, list of which needs to be paginated
class PaginationListWidgetController<Type> extends AutoDisposeFamilyAsyncNotifier<List<Type>, PaginationItemsCallback<Type>> with PaginationController<Type> {

  @override
  FutureOr<List<Type>> build(PaginationItemsCallback<Type> arg) async {
    this.getItems = arg;
    printInfo('$runtimeType built');
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
