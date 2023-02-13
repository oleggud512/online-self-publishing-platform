import 'package:client/src/common/log.dart';
import 'package:client/src/common/pagination/pagination_controller.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PageListWidget extends StatelessWidget {
  const PageListWidget({
    super.key,
    required this.paginationController,
    required this.refreshController,
    required this.child
  });

  final PaginationController paginationController;
  final RefreshController refreshController;
  final Widget child;


  Future<void> refresh() async {
    await paginationController.refresh();
    refreshController.refreshCompleted();
    refreshController.loadComplete();
  }

  Future<void> addPage() async {
    bool loaded = await paginationController.addPage();
    if (loaded) {
      refreshController.loadComplete();
    } else {
      refreshController.loadNoData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      onRefresh: refresh,
      onLoading: addPage,
      enablePullDown: true,
      enablePullUp: true,
      child: child
    );
  }
}