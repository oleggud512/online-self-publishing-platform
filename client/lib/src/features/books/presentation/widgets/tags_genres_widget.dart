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
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Wrap(
            spacing: p8,
            children: [
              OutlinedButton(
                child: Text("Genres:"),
                onPressed: () {},
              ),
              ...originGenres.map((g) => FilterChip(
                elevation: 8,
                selected: genres.contains(g),
                onSelected: (selected) => onGenreTap(g),
                label: Text(g),
              )).toList(),
            ]
          ),
          Wrap(
            spacing: p8,
            children: [
              OutlinedButton(
                child: Text("Tags:"),
                onPressed: () {},
              ),
              ...originTags.map((t) => FilterChip(
                selected: tags.contains(t),
                onSelected: (selected) => onTagTap(t),
                label: Text(t)
              )).toList(),
            ]
          ),
        ]
      ),
    );
  }
}