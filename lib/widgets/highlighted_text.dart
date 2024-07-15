import 'package:flutter/material.dart';


/// A variation of [RichText] that takes in a [text] and an optional 
/// [highlightText] then renders the whole [text] but with the [highlightedText] 
/// styled differently. If [highlightedText] is not provided, [text] is rendered.
class HiglightedText extends StatelessWidget {
  const HiglightedText(this.text,
      {super.key,
      this.highlightedText,
      this.highlightedStyle = const TextStyle(
          color: Colors.deepPurple)});

  /// The entire text displayed on screen
  final String text;

  /// The section of the [text] that is highlighted
  final String? highlightedText;

  /// The text style of the highlighted text. By default the color is set to
  /// [Colors.deepPurple]
  final TextStyle highlightedStyle;

  @override
  Widget build(BuildContext context) {
    List<InlineSpan> spans = [];

    if (highlightedText == null || highlightedText?.isEmpty == true) {
      spans.add(TextSpan(text: text));
    } else {
      final bool containsHighlightedText =
          text.toLowerCase().contains(highlightedText!.toLowerCase());

      if (containsHighlightedText) {

        // match highlighted text
        final RegExp highlight =
            RegExp(highlightedText ?? '', caseSensitive: false);

        if (highlight.hasMatch(text)) {
          // get first match
          final matches = highlight.firstMatch(text);
          final String match = matches![0]!;

          final startIndex = text.indexOf(match);
          final endIndex = startIndex + match.length;
          final String substring = text.substring(startIndex, endIndex);

          final firstSplit = TextSpan(text: text.substring(0, startIndex));
          final lastSplit = TextSpan(text: text.substring(endIndex));
          final subStringSpan =
              TextSpan(text: substring, style: highlightedStyle);

          spans = [firstSplit, subStringSpan, lastSplit];
        }
      } else {
        spans.add(TextSpan(text: text));
      }
    }

    return RichText(
        text: TextSpan(
      style: Theme.of(context).textTheme.bodyMedium,
      children: spans,
    ));
  }
}
