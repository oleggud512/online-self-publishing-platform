import 'package:client/src/common/log.dart';
import 'package:client/src/common/pagination/page_list.dart';
import 'package:client/src/common/pagination/pagination_list_widget_controller.dart';


typedef PaginationItemsCallback<T> = Future<List<T>> Function(int from);

mixin PaginationController<T> {

  set listState(List<T> newList);
  List<T> get listState;
  PaginationItemsCallback<T> get getItems;
  
  Future<void> refresh() async {
    final firstPage = await getItems(0);
    printWarning('refresh() - pagelen = ${firstPage.length}');
    listState = firstPage;
  }

  /// whether page has been added or not
  Future<bool> addPage() async {
    final page = await getItems(listState.length);
    printWarning('addPage() - pagelen = ${page.length}');
    listState = listState.addPage(page);
    return page.isNotEmpty;
  }
}