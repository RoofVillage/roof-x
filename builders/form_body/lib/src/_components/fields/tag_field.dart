import 'package:flutter/material.dart';
import 'package:form_body_builder/src/_components/fields/_picker_field.dart';
import 'package:tag_builder/index.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;

class TagField extends StatelessWidget with RoofTagBuilder {
  final String title;
  final String placeholder;
  final List<String> tags;
  final VoidCallback onTap;

  TagField({
    @required this.title,
    @required this.placeholder,
    this.tags,
    this.onTap,
  });

  final _wrapSpacing = distance.a;
  final _placeholderTypography = typography.body;

  @override
  Widget build(BuildContext context) {
    Widget fieldBody;

    if (tags != null && tags.isNotEmpty) {
      final List<Widget> tagWidgets = tags != null
          ? tags
              .map((tag) => buildTag(
                    context,
                    text: tag,
                  ))
              ?.toList()
          : [];

      fieldBody = Padding(
        padding: EdgeInsets.symmetric(vertical: _wrapSpacing),
        child: Wrap(
          children: tagWidgets,
          spacing: _wrapSpacing,
          runSpacing: _wrapSpacing,
          alignment: WrapAlignment.end,
        ),
      );
    } else {
      final theme = RoofTheme.of(context);

      fieldBody = Text(
        placeholder,
        style: _placeholderTypography
            .textStyleWithColor(theme.color.text.placeholder),
      );
    }

    return RoofPickerField(
      name: title,
      onTap: onTap,
      fieldBody: fieldBody,
    );
  }
}
