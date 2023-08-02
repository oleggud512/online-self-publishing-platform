import 'package:client/src/features/books/presentation/widgets/readings_state_widget.dart';
import 'package:client/src/features/chapters/domain/chapter.dart';
import 'package:client/src/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChapterWidget extends ConsumerStatefulWidget {
  const ChapterWidget({super.key, required this.chapter});

  final Chapter chapter;

  @override
  _ChapterWidgetState createState() => _ChapterWidgetState();
}

class _ChapterWidgetState extends ConsumerState<ChapterWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.pushNamed(MyRoute.chapter.name, pathParameters: {
          'id': widget.chapter.id
        });
      },
      title: Text(widget.chapter.name),
      subtitle: Row(
        children: [
          Text(Constants.dateFormat.format(widget.chapter.createdAt!)),
          const Spacer(),
          ReadingsStateWidget(state: widget.chapter.state),
        ],
      )
    );
  }
}