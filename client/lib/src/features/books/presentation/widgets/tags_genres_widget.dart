import 'package:client/src/common/build_context_ext.dart';
import 'package:client/src/common/hardcoded.dart';
import 'package:flutter/material.dart';

import '../../../../common/constants/constants.dart';

class TagsGenresWidget extends StatelessWidget {
  const TagsGenresWidget({
    super.key,
    required this.originTags,
    required this.tags,
    required this.originGenres,
    required this.genres,
    required this.onTagTap,
    required this.onGenreTap,
  });

  final List<String> originTags;
  final List<String> tags;
  final List<String> originGenres;
  final List<String> genres;
  final void Function(String tag) onTagTap;
  final void Function(String tag) onGenreTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        h16gap,
        Text(context.ll!.book.genres, 
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.outline
          )
        ),
        const Divider(height: p16),
        Wrap(
          spacing: p8,
          children: [
            ...originGenres.map((g) => FilterChip(
              elevation: 8,
              selected: genres.contains(g),
              onSelected: (selected) => onGenreTap(g),
              label: Text(g),
            )).toList(),
          ]
        ),
        h16gap,
        Text(context.ll!.book.tags, 
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.outline
          )
        ),
        const Divider(height: p16),
        Wrap(
          spacing: p8,
          children: [
            ...originTags.map((t) => FilterChip(
              selected: tags.contains(t),
              onSelected: (selected) => onTagTap(t),
              label: Text(t)
            )).toList(),
          ]
        ),
      ]
    );
  }
}
