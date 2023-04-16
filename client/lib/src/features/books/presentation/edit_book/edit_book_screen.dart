import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/common/log.dart';
import 'package:client/src/common/pub_sub.dart';
import 'package:client/src/common/widgets/description_form_field.dart';
import 'package:client/src/common/widgets/my_image.dart';
import 'package:client/src/features/books/domain/book.dart';
import 'package:client/src/features/books/presentation/edit_book/edit_book_screen_controller.dart';
import 'package:client/src/features/books/presentation/widgets/book_status_dropdown.dart';
import 'package:client/src/features/books/presentation/widgets/tags_genres_widget.dart';
import 'package:client/src/features/localization/application/ext.dart';
import 'package:client/src/features/localization/application/ll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/constants/constants.dart';
import '../../../../shared/utils.dart';
import '../../../profile/domain/profile.dart';
import '../../application/books_changed_event.dart';

class EditBookScreen extends ConsumerStatefulWidget {
  const EditBookScreen({
    super.key,
    required this.book
  });

  factory EditBookScreen.add(String ofProfile) => EditBookScreen(
    book: Book(author: Profile(id: ofProfile))
  );

  final Book book;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditBookScreenState();
}
class _EditBookScreenState extends ConsumerState<EditBookScreen> {
  EditBookScreenController get cont => 
    ref.watch(editBookScreenControllerProvider(widget.book).notifier);

  void onSave() async {
    Book? updatedBook = await cont.save();
    if (updatedBook != null) {
      ref.read(pubSub.notifier).push(BookEditedEvent(updatedBook));
      if (context.mounted) context.pop();
    }
  }
  void onStatusChanged(BookStatus? newStatus) {
    cont.status = newStatus!;
  }
  void onImageTap() {
    cont.pickImage();
  }
  void onNameChanged(String newName) {
    cont.name = newName;
  }
  void onDescriptionChanged(String newDescription) {
    cont.description = newDescription;
  }
  void onToggleTag(String tag) {
    printSuccess('onToggleTag $tag');
    cont.toggleTag(tag);
  }
  void onToggleGenre(String genre) {
    printSuccess('onToggleGenre $genre');
    cont.toggleGenre(genre);
  }
  void onDelete() async {
    final deletedSuccessfully = await cont.deleteThisBook();
    if (deletedSuccessfully) {
      ref.watch(pubSub.notifier).push(BookDeletedEvent());
      if (context.mounted) {
        context.pop();
        context.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editBookScreenControllerProvider(widget.book));
    final book = state.book;
    final ll = curLl(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(book.name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(p16),
        children: [
          BookStatusDropdown(
            value: book.status,
            onChanged: onStatusChanged,
          ),
          h16gap,
          Center(
            child: MyImage(
              onTap: onImageTap,
              imageUrl: book.coverUrl,
              size: const Size(p232, p304),
            ),
          ),
          h16gap,
          TextFormField(
            initialValue: book.name,
            onChanged: onNameChanged,
            decoration: InputDecoration(
              labelText: ll.name
            ),
          ),
          h16gap,
          DescriptionFormField(
            initialValue: book.description,
            onChanged: onDescriptionChanged
          ),
          h16gap,
          TagsGenresWidget(
            originTags: state.tags,
            tags: book.tags,
            originGenres: state.genres,
            genres: book.genres,
            onTagTap: onToggleTag,
            onGenreTap: onToggleGenre,
          ),
          if (state.book.exists()) OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error
            ),
            onPressed: onDelete,
            child: Text(ll.delete),
          ),
          // Text(Utils.prettyJson(state.toJson())),
          const SizedBox(height: p72)
        ]
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(ll.book.saveBook),
        icon: const Icon(Icons.check),
        onPressed: onSave,
      ),
    );
  }
}
