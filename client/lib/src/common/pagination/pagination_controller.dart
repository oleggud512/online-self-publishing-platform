import 'package:client/src/common/log.dart';
import 'package:client/src/common/pagination/page_list.dart';
import 'package:client/src/shared/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


typedef PaginationItemsCallback<T> = Future<List<T>> Function(int from);

mixin PaginationController<T> {

  /// may call notifyListeners() for example.
  @protected
  set listState(List<T> newList);

  /// [PaginationController] needs to know about the length of the list
  @protected
  List<T> get listState;

  /// callback to obtain a new page. for example: 
  /// ```dart
  /// @override
  /// PaginationItemsCallback<Book> get getItems => (int from) {
  ///  return ref.watch(profileRepositoryProvider).getBookmarks(from, pageSize: 50);
  /// };
  /// ```
  /// so it generates a new function every time I try to use it. 
  @protected
  PaginationItemsCallback<T> get getItems;

  
  Future<void> refresh() async {
    final firstPage = await getItems(0);
    glogger.i('$runtimeType: refresh().firstPage.len = ${firstPage.length}');
    // NOTE: listState settled
    listState = firstPage;
  }

  /// returns whether page has been added or not
  Future<bool> addNewPage() async {
    final page = await getItems(listState.length);
    glogger.i('$runtimeType: addPage().page.len = ${page.length}');
    // NOTE: listState settled
    listState = listState.addPage(page);
    return page.isNotEmpty;
  }
}