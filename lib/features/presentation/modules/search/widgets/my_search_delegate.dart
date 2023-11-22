import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../screens/result_page.dart';
import '../search_controller.dart';
import 'suggestion_list.dart';
import 'package:speech_to_text/speech_to_text.dart';

// Defines the content of the search page in `showSearch()`.
// SearchDelegate has a member `query` which is the query string.
class MySearchDelegate extends SearchDelegate<String> {
  final MySearchController controller =
      Get.put<MySearchController>(MySearchController());

  MySearchDelegate() {
    controller.getSearchString();
  }

  void closeDelegate(BuildContext context, String value) {
    // SearchDelegate.close() can return vlaues, similar to Navigator.pop().
    close(context, value);
  }

// custom search bar style
  // hint text
  @override
  String? get searchFieldLabel => controller.hintText;

  // text style in textfield
  @override
  TextStyle? get searchFieldStyle => AppTextStyles.regular16;

  // appbar theme
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    const InputBorder borderStyle = OutlineInputBorder(
      borderSide: BorderSide(width: 0, color: AppColors.white),
    );
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.green,
        iconTheme: theme.primaryIconTheme.copyWith(color: AppColors.black),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(10),
        filled: true,
        fillColor: AppColors.white,
        focusedBorder: borderStyle,
        enabledBorder: borderStyle,
      ),
    );
  }

  // Leading icon in search bar.
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        color: AppColors.white,
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        closeDelegate(context, "");
      },
    );
  }

  // Widget of result page.
  @override
  Widget buildResults(BuildContext context) {
    return ResultPage();
  }

  @override
  void showResults(BuildContext context) {
    /// change query
    controller.changeQuery(query.trim());

    /// add the query to history
    controller.addToHistory(query.trim());
    //controller.setTypeResult(TypeNavigate.search);
    super.showResults(context);
  }

  // Suggestions list while typing (this.query).
  @override
  Widget buildSuggestions(BuildContext context) {
    controller.updateSuggestions(query);

    return SuggestionList(
      query: query,
      suggestions: controller.suggestions,
      onSelected: (String suggestion) {
        // event when tap in suggestion
        query = suggestion;
        controller.addToHistory(suggestion);
        showResults(context);
      },
      onDeleted: controller.deleteHistory,
    );
  }

  // Action buttons at the right of search bar.
  // voice to text
  SpeechToText speechToText = SpeechToText();
  @override
  List<Widget> buildActions(BuildContext context) {
    Widget buttonMic = Obx(
      () => AvatarGlow(
        endRadius: 24.0,
        animate: controller.isListening.value,
        duration: const Duration(microseconds: 2000),
        showTwoGlows: true,
        glowColor: AppColors.black,
        repeat: true,
        repeatPauseDuration: const Duration(microseconds: 100),
        child: GestureDetector(
          onTapDown: (details) async {
            //query = 'TODO: implement voice input';
            if (!controller.isListening.value) {
              var available = await speechToText.initialize();
              if (available) {
                controller.toggleListening(true);
                speechToText.listen(
                  onResult: (result) {
                    query = result.recognizedWords;
                  },
                );
              }
            }
          },
          onTapUp: (details) {
            controller.toggleListening(false);
            speechToText.stop();
          },
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Icon(
              controller.isListening.value ? Icons.mic : Icons.mic_none,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

    return <Widget>[
      if (query.isEmpty)
        buttonMic
      else
        IconButton(
          tooltip: 'Clear',
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            controller.toggleListening(false);
            showSuggestions(context);
          },
        )
    ];
  }
}
