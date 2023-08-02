import 'dart:convert';

import 'package:client/src/common/build_context_ext.dart';
import 'package:client/src/common/constants/constants.dart';
import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/common/log.dart';
import 'package:client/src/features/books/presentation/widgets/readings_state_widget.dart';
import 'package:client/src/features/chapters/domain/chapter.dart';
import 'package:client/src/shared/scaffold_messanger.dart';
import 'package:client/src/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
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

  final nameDebouncer = Debouncer();
  final contentDebouncer = Debouncer();
  final focusNode = FocusNode();
  final _controller = QuillController.basic();
  final scrollController = ScrollController();

  @override
  void initState() {
    _controller.addListener(() {
      printInfo('_controller.addListener');
      final str = jsonEncode(_controller.document.toDelta().toJson());
      onChangeContent(str);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    updateText(state.chapter.content);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    nameDebouncer.dispose();
    scrollController.dispose();
    _controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void onToggleState() {
    cont.toggleState().then((newState) {
      if (!context.mounted) return;
      if (newState == null) {
        showDialog(
          context: context, 
          builder: (context) {
            return AlertDialog(
              title: 
                Text(
                  context.ll!.chapter.stateChangeFailure(
                    state.chapter.isPublished 
                      ? context.ll!.book.published 
                      : context.ll!.book.unpublished
                  )
                )
            );
          }
        );
      } else {
        ref.watch(pubSub.notifier).push(ChapterUpdatedEvent(state.chapter));
        printInfo(newState);
        Utils.showMessagew(ref, context.ll!.chapter.stateChangeFailure(
          state.chapter.isPublished 
            ? context.ll!.book.published 
            : context.ll!.book.unpublished
        ));
      }
    });
  }

  Future<void> onChangeName(String newName) async {
    nameDebouncer.debounce(() {
      printInfo(newName);
      cont.name = newName;
    });
  }

  Future<void> onChangeContent(String newContent) async {
    contentDebouncer.debounce(() => cont.content = newContent);
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
      Utils.showMessagew(ref, context.ll!.errors.cannotSave);
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
      Utils.showMessagew(ref, context.ll!.errors.cannotDelete);
    }
  }

  void updateText(String newDeltaString) {
    if (newDeltaString.isEmpty) {
      _controller.document = Document.fromDelta(Delta()..insert('\n'));
      return;
    }
    final json = jsonDecode(newDeltaString);
    final doc = Document.fromJson(json);
    _controller.document = doc;
  }

  @override
  Widget build(BuildContext context) {
    final state = this.state;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.ll!.chapter.editChapter),
        actions: [
          if (state.chapter.exists()) PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: onToggleState,
                  child: state.chapter.isPublished 
                    ? Text(context.ll!.book.unpublish)
                    : Text(context.ll!.book.publish),
                ),
                PopupMenuItem(
                  onTap: onDeleteThisChapter,
                  child: Text(context.ll!.chapter.deleteChapter)
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
                hintText: context.ll!.chapter.name,
              ),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            QuillToolbar.basic(
              controller: _controller,
              showFontSize: false,
              showInlineCode: false,
              showCodeBlock: false,
              showListCheck: false,
              showFontFamily: false,
              showCenterAlignment: true,
              showLeftAlignment: true,
              showAlignmentButtons: true,
              showRightAlignment: true,
              showJustifyAlignment: true,
              showLink: false,
              showDividers: true,
            ),
            Expanded(
              child: QuillEditor(
                controller: _controller,
                readOnly: false,
                scrollable: true,
                scrollController: scrollController,
                focusNode: focusNode,
                autoFocus: false,
                expands: true,
                padding: const EdgeInsets.all(0)
              ),
            ),
          ]
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(p8),
        child: FilledButton.icon(
          icon: const Icon(Icons.check),
          label: Text(context.ll!.save),
          onPressed: onSave,
        ),
      ),
    );
  }
}
