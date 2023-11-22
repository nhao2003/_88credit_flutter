import 'package:flutter/material.dart';
import 'package:get/get.dart';

// build history and search item
// Suggestions list widget displayed in the search page.
// query is the text input
class SuggestionList extends StatelessWidget {
  const SuggestionList({
    super.key,
    required this.suggestions,
    required this.query,
    required this.onSelected,
    required this.onDeleted,
  });

  final RxList<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;
  final Function(String query) onDeleted;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.titleMedium!;
    return Obx(
      () => ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (BuildContext context, int i) {
          final String suggestion = suggestions[i];
          return ListTile(
            leading:
                query.isEmpty ? const Icon(Icons.history) : const Icon(null),
            trailing: query.isEmpty
                ? IconButton(
                    icon: const Icon(Icons.cancel_outlined),
                    onPressed: () {
                      // delete a history
                      onDeleted(suggestion);
                    },
                  )
                : const Icon(null),
            // Highlight the substring that matched the query.
            title: RichText(
              text: TextSpan(
                text: suggestion.substring(0, query.length),
                style: textTheme.copyWith(fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: suggestion.substring(query.length),
                    style: textTheme,
                  ),
                ],
              ),
            ),
            onTap: () {
              onSelected(suggestion);
            },
          );
        },
      ),
    );
  }
}
