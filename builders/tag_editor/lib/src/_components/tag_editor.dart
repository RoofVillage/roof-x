import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:semantic_theme/index.dart';

import '_tags_wrap.dart';
import '_textfield_with_add_button.dart';
import '_filtered_options_column.dart';

typedef TagPasser = void Function(List<String>);

class TagEditor extends StatefulWidget {
  final String title;
  final String hintText;
  final List<String> tags;
  final TagPasser onTagEdited;

  TagEditor({
    this.title,
    this.hintText,
    tags,
    this.onTagEdited,
  }) : this.tags = tags ?? [];

  @override
  _TagEditorState createState() => _TagEditorState();
}

class _TagEditorState extends State<TagEditor>
    with SingleTickerProviderStateMixin {
  List<String> _tags;
  List<String> _options;
  List<String> _filteredOptions = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _tags = widget.tags ?? [];
    _options = _getTags();
    _filteredOptions = _options;
    _controller.addListener(_filterOptions);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final animatedTagsWrap = AnimatedSize(
      vsync: this,
      curve: theme.curve.delayed,
      duration: theme.duration.short,
      alignment: Alignment.topCenter,
      child: Row(
        children: [
          Flexible(
            child: TagsWrap(
              tags: _tags,
              tagRemoveCallback: _removeTag,
            ),
          ),
        ],
      ),
    );

    final fieldAndOptions = Container(
      child: Column(
        children: <Widget>[
          TextFieldWithAddButton(
            controller: _controller,
            addTagCallback: _addTag,
            options: _options,
          ),
          OptionsColumn(
            options: _filteredOptions,
            searchValue: _controller.text,
            onTap: _addTag,
          ),
        ],
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: theme.distance.padding.horizontal.medium,
        vertical: theme.distance.padding.vertical.medium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          animatedTagsWrap,
          fieldAndOptions,
        ],
      ),
    );
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);
      _filterOptions();
    });
    widget.onTagEdited(_tags);
  }

  void _addTag(String tag) {
    triggerHapticWith(HapticOption.light);

    setState(() {
      _tags.add(tag);
      _filterOptions();
    });

    _controller.clear();
    widget.onTagEdited(_tags);
  }

  void _filterOptions() {
    final List<String> newFilteredOptions = [];

    if (_controller.text.isNotEmpty) {
      final List<String> matchedOptions = [];
      final List<String> unmatchedOptions = [];

      for (String option in _options) {
        if (option.toLowerCase().contains(_controller.text.toLowerCase()))
          matchedOptions.add(option);
        else
          unmatchedOptions.add((option));
      }

      matchedOptions.sort();
      unmatchedOptions.sort();

      newFilteredOptions.addAll(matchedOptions);
      newFilteredOptions.addAll(unmatchedOptions);
    } else {
      newFilteredOptions.addAll(_options);
      newFilteredOptions.sort();
    }

    _tags.forEach((tag) => newFilteredOptions.remove(tag));

    setState(() {
      _filteredOptions = newFilteredOptions;
    });
  }

  List<String> _getTags() {
    // Fetch all org tags
    return [
      "has lawn",
      "students",
      "howell park",
      "big house",
      "tiny house",
      "rude neighbors",
      "dragon",
    ];
  }
}
