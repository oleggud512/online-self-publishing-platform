import 'package:client/src/common/constants/constants.dart';
import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/common/log.dart';
import 'package:client/src/features/books/presentation/widgets/readings_state_widget.dart';
import 'package:client/src/features/chapters/domain/chapter.dart';
import 'package:client/src/shared/scaffold_messanger.dart';
import 'package:client/src/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/pub_sub.dart';
import '../../../../common/utils/debounce.dart';
import '../../../books/domain/book.dart';
import '../../application/events.dart';
import 'edit_chapter_screen_controller.dart';
import 'edit_chapter_screen_state.dart';

class EditChapterScreen extends ConsumerStatefulWidget {
  const EditChapterScreen({super.key, required this.chapter});

  factory EditChapterScreen.add({
    Key? key, 
    required Book forBook
  }) => 
    EditChapterScreen(key: key, chapter: Chapter(book: forBook));

  final Chapter chapter;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditChapterScreenState();
}
class _EditChapterScreenState extends ConsumerState<EditChapterScreen> {
  EditChapterScreenController get cont => 
      ref.watch(editChapterScreenControllerProvider(widget.chapter).notifier);
  EditChapterScreenState get state => 
      ref.watch(editChapterScreenControllerProvider(widget.chapter));

  final debouncer = Debouncer();

  @override
  void dispose() {
    debouncer.dispose();
    super.dispose();
  }

  void onToggleState() {
    cont.toggleState().then((newState) {
      if (!context.mounted) return;
      if (newState == null) {
        showDialog(
          context: context, 
          builder: (context) {
            return AlertDialog(title: Text("Was not able to ${state.chapter.isPublished ? 'publish' : 'unpublish'}."));
          }
        );
      } else {
        ref.watch(pubSub.notifier).push(ChapterUpdatedEvent(state.chapter));
        printInfo(newState);
        Utils.showMessagew(ref, "${state.chapter.isPublished ? 'Published' : 'Unpublished'} successfully.");
      }
    });
  }

  Future<void> onChangeName(String newName) async {
    debouncer.debounce(() => cont.name = newName);
  }

  Future<void> onChangeContent(String newContent) async {
    debouncer.debounce(() => cont.content = newContent);
  }

  Future<void> onSave() async {
    try {
      final existed = state.chapter.exists();
      final chapter = await cont.save();
      if (context.mounted) {
        ref.watch(pubSub.notifier).push(existed 
          ? ChapterUpdatedEvent(chapter) 
          : ChapterAddedEvent(chapter));
        context.pop();
      }
    } catch (e) {
      printError(e);
      Utils.showMessagew(ref, "Error saving chapter".hardcoded);
    }
  }

  Future<void> onDeleteThisChapter() async {
    try {
      await cont.deleteThisChapter();
      ref.watch(pubSub.notifier).push(ChapterDeletedEvent(widget.chapter.id));
      if (context.mounted) {
        context.pop();
        context.pop();
      }
    } catch (e) {
      Utils.showMessagew(ref, "Error deleting chapter".hardcoded);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = this.state;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Chapter'.hardcoded),
        actions: [
          if (state.chapter.exists()) PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: onToggleState,
                  child: state.chapter.isPublished 
                    ? Text('unpublish'.hardcoded)
                    : Text('publish'.hardcoded),
                ),
                PopupMenuItem(
                  onTap: onDeleteThisChapter,
                  child: Text("delete chapter".hardcoded)
                )
              ];
            },
          )
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(p8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ReadingsStateWidget(state: state.chapter.state),
            TextFormField(
              initialValue: state.chapter.name,
              onChanged: onChangeName,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Chapter Name'.hardcoded,
              ),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Expanded(
              child: TextFormField(
              initialValue: state.chapter.content,
                onChanged: onChangeContent,
                maxLines: null,
                maxLength: 10000,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ]
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(p8),
        child: FilledButton.icon(
          icon: const Icon(Icons.check),
          label: Text("save".hardcoded),
          onPressed: onSave,
        ),
      ),
    );
  }
}