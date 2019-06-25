import 'package:flutter/material.dart';
import 'package:form/index.dart';
import 'package:icon_picker_data/index.dart';
import 'package:keyboard_accessory/index.dart';
import 'package:keyboard_accessory_bar_builder/index.dart';
import 'package:option_picker_data/index.dart';

import 'keyboard_accessory_buttons/index.dart';
import 'field_container.dart';
import 'fields/text_area.dart';
import 'fields/text_field.dart';
import 'fields/switch_field.dart';
import 'fields/date_picker_field.dart';
import 'fields/select_field.dart';
import 'fields/icon_select_field.dart';

enum KeyboardAccessoryState { hideKeyboard, submit }

class RoofStreamForm
    extends StreamForm<StreamableFormFieldData, StreamableFormSectionHeaderData>
    with KeyboardAccessoryBarBuilder {
  static const _hideKeyboardTitle = "Hide keyboard";
  static const _doneKeyboardTitle = "Done";

  final _focusNodeManager = _FocusNodeManager();

  List<FormCompositionFieldData> get _allCompositionFieldData {
    final allFieldData = bloc.formData.fieldData;
    final allTextFieldData = allFieldData
        .where((data) => data.isVisible)
        .whereType<FormTextFieldData>()
        .toList();
    final allTextAreaData = allFieldData.whereType<FormTextAreaData>().toList();
    List<FormCompositionFieldData> allCompositionFieldData = [];
    allCompositionFieldData.addAll(allTextFieldData);
    allCompositionFieldData.addAll(allTextAreaData);
    return allCompositionFieldData;
  }

  Widget buildTextField({
    FormTextFieldData fieldData,
    StreamableFormData formData,
    int fieldIndex,
    int sectionIndex,
    BuildContext context,
  }) {
    final inputAction = _getInputActionForCompositionFieldData(fieldData);
    final focusNode = _focusNodeManager.nodeFor(fieldData, context);

    return RoofTextField(
      autofocus: fieldData.autofocus,
      fieldName: fieldData.title,
      placeholder: fieldData.placeholder,
      initialValue: fieldData.value,
      keyboardType: fieldData.keyboardType,
      textInputAction: inputAction,
      isPassword: false,
      mask: fieldData.mask,
      onChanged: (value) {
        _onCompositionViewChanged(fieldData, value);
      },
      onSubmitted: (value, context) {
        _onCompositionViewSubmitted(fieldData, value, context);
      },
      onFocusChanged: (isInFocus) {
        if (isInFocus) {
          final button = _buttonFor(fieldData: fieldData, formData: formData);
          KeyboardAccessory.of(context).child =
              buildKeybordAccessoryShortBar(context, children: [button]);
        }
        _onCompositionViewFocusChanged(fieldData, isInFocus);
      },
      focusNode: focusNode,
    );
  }

  Widget buildTextArea(
      {FormTextAreaData fieldData,
      StreamableFormData formData,
      int fieldIndex,
      int sectionIndex,
      BuildContext context}) {
    final inputAction = _getInputActionForCompositionFieldData(fieldData);

    return RoofTextArea(
      autofocus: fieldData.autofocus,
      fieldName: fieldData.title,
      placeholder: fieldData.placeholder,
      initialValue: fieldData.value,
      textInputAction: inputAction,
      keyboardType: fieldData.keyboardType,
      onChanged: (value) {
        _onCompositionViewChanged(fieldData, value);
      },
      onSubmitted: (value, context) {
        _onCompositionViewSubmitted(fieldData, value, context);
      },
      onFocusChanged: (isInFocus) {
        _onCompositionViewFocusChanged(fieldData, isInFocus);
      },
      focusNode: _focusNodeManager.nodeFor(fieldData, context),
    );
  }

  Widget buildSwitch({
    FormSwitchFieldData fieldData,
    int fieldIndex,
    int sectionIndex,
    BuildContext context,
  }) {
    return RoofSwitchField(
      title: fieldData.title,
      initialValue: fieldData.value,
      onChanged: (value) {
        resignFocus(context);
        fieldData.onChanged(value);
      },
    );
  }

  Widget buildDateField({
    FormDateFieldData fieldData,
    StreamableFormData formData,
    int fieldIndex,
    int sectionIndex,
    BuildContext context,
  }) {
    return RoofDatePickerField(
      title: fieldData.title,
      initialValue: fieldData.value,
      startBound: fieldData.startBound,
      endBound: fieldData.endBound,
      onTap: fieldData.onTap,
      onChanged: (value) {
        fieldData.onChanged(value);
      },
    );
  }

  Widget buildOptionSelect({
    FormOptionSelectFieldData fieldData,
    int fieldIndex,
    int sectionIndex,
  }) {
    return RoofSelectField(
      title: fieldData.title,
      emptyText: fieldData.emptyText,
      isMultiSelect: fieldData.isMultiSelect,
      options: fieldData.options?.map(
        (option) {
          return OptionPickerData(
            title: option.title,
            data: option.data,
          );
        },
      )?.toList(),
      onTap: fieldData.onTap,
      onChanged: (selectedOptions) {
        List<FormOptionSelectValueData> convertedOptions = selectedOptions?.map(
          (option) {
            return FormOptionSelectValueData(
              title: option.title,
              data: option.data,
            );
          },
        )?.toList();
        fieldData.onChanged(convertedOptions);
      },
    );
  }

  Widget buildIconOptionSelect(
      {FormIconSelectFieldData fieldData, int fieldIndex, int sectionIndex}) {
    List<IconPickerData> options = fieldData.options?.map(
      (option) {
        return IconPickerData(
          icon: option.icon,
        );
      },
    )?.toList();

    return IconSelectField(
      title: fieldData.title,
      options: options,
      onTap: fieldData.onTap,
      onChanged: (selectedOption) {
        FormIconOptionSelectValueData convertedOption =
            FormIconOptionSelectValueData(icon: selectedOption.icon);
        fieldData.onChanged(convertedOption);
      },
    );
  }

  @override
  Widget buildField({
    BuildContext context,
    StreamableFormFieldData fieldData,
    StreamableFormData formData,
    int fieldIndex,
    int sectionIndex,
  }) {
    Widget fieldBody;

    if (fieldData is FormTextFieldData) {
      fieldBody = buildTextField(
        fieldData: fieldData,
        formData: formData,
        fieldIndex: fieldIndex,
        sectionIndex: sectionIndex,
        context: context,
      );
    } else if (fieldData is FormTextAreaData) {
      fieldBody = buildTextArea(
        fieldData: fieldData,
        formData: formData,
        fieldIndex: fieldIndex,
        sectionIndex: sectionIndex,
        context: context,
      );
    } else if (fieldData is FormSwitchFieldData) {
      fieldBody = buildSwitch(
        fieldData: fieldData,
        fieldIndex: fieldIndex,
        sectionIndex: sectionIndex,
        context: context,
      );
    } else if (fieldData is FormOptionSelectFieldData) {
      fieldBody = buildOptionSelect(
        fieldData: fieldData,
        fieldIndex: fieldIndex,
        sectionIndex: sectionIndex,
      );
    } else if (fieldData is FormIconSelectFieldData) {
      fieldBody = buildIconOptionSelect(
        fieldData: fieldData,
        fieldIndex: fieldIndex,
        sectionIndex: sectionIndex,
      );
    } else if (fieldData is FormDateFieldData) {
      fieldBody = buildDateField(
        fieldData: fieldData,
        fieldIndex: fieldIndex,
        sectionIndex: sectionIndex,
      );
    }

    return RoofFieldContainer(
      child: fieldBody,
    );
  }

  void resignFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    KeyboardAccessory.of(context).hide();
  }

  void _changeFocus(
      {@required FormCompositionFieldData fieldData,
      @required BuildContext context}) {
    final nextEmptyFieldData = _nextEmptyCompositionFieldDataAfter(fieldData);

    if (nextEmptyFieldData != null) {
      final focusNode = _focusNodeManager.nodeFor(nextEmptyFieldData, context);
      if (focusNode != null) FocusScope.of(context).requestFocus(focusNode);
    } else {
      _resignFieldFocus(fieldData: fieldData, context: context);
    }
  }

  FormTextFieldData _nextEmptyCompositionFieldDataAfter(
      FormCompositionFieldData fieldData) {
    final allCompositionFieldData = _allCompositionFieldData;

    final index = allCompositionFieldData.indexOf(fieldData);
    for (var i = index + 1; i < allCompositionFieldData.length; i++) {
      final subsequentFieldData = allCompositionFieldData[i];
      if (subsequentFieldData.value.isEmpty && !subsequentFieldData.isOptional)
        return subsequentFieldData;
    }
    for (var i = 0; i < index; i++) {
      final previousFieldData = allCompositionFieldData[i];
      if (previousFieldData.value.isEmpty && !previousFieldData.isOptional)
        return previousFieldData;
    }
    return null;
  }

  TextInputAction _getInputActionForCompositionFieldData(
      FormCompositionFieldData fieldData) {
    if (fieldData.inputAction != null) return fieldData.inputAction;
    final nextEmpty = _nextEmptyCompositionFieldDataAfter(fieldData);

    return nextEmpty != null ? TextInputAction.next : TextInputAction.done;
  }

  void _updateCompositionFieldData({FormCompositionFieldData except}) {
    for (final fieldData in _allCompositionFieldData) {
      if (fieldData == except) continue;
      bloc.updateFieldData(fieldData);
    }
  }

  void _onCompositionViewFocusChanged(
      FormCompositionFieldData fieldData, bool isInFocus) {
    fieldData.onFocusChanged(isInFocus);
  }

  void _onCompositionViewSubmitted(
      FormCompositionFieldData fieldData, String value, BuildContext context) {
    fieldData.onSubmitted(value);
    _changeFocus(fieldData: fieldData, context: context);
  }

  void _onCompositionViewChanged(
      FormCompositionFieldData fieldData, String value) {
    final oldValue = fieldData.value;
    fieldData.onChanged(value);
    //If the fieldValue is going from empty to not empty or vice versa.
    final emptyStateChanged = value.length + oldValue.length == 1;
    if (emptyStateChanged) {
      _updateCompositionFieldData(except: fieldData);
    }
  }

  void _resignFieldFocus(
      {@required FormCompositionFieldData fieldData,
      @required BuildContext context}) {
    final focusNode = _focusNodeManager.nodeFor(fieldData, context);
    if (focusNode != null) focusNode.unfocus();
    KeyboardAccessory.of(context).hide();
  }

  ActionKeyboardAccessoryButton _buttonFor({
    @required FormCompositionFieldData fieldData,
    StreamableFormData formData,
  }) {
    final _nextButton = SecondaryActionKeyboardAccessoryButton(
        title: _hideKeyboardTitle,
        onTap: (context) =>
            _resignFieldFocus(fieldData: fieldData, context: context));
    final _doneButton = PrimaryActionKeyboardAccessoryButton(
        title: _doneKeyboardTitle,
        onTap: (context) =>
            _resignFieldFocus(fieldData: fieldData, context: context));

    switch (_getInputActionForCompositionFieldData(fieldData)) {
      case TextInputAction.next:
        return _nextButton;
      default:
        if (formData.canSubmitWithKeyboardRaised &&
            formData != null &&
            formData.submitKeyboardAccessory != null) {
          return formData.submitKeyboardAccessory;
        }
        return _doneButton;
    }
  }

  void dispose() {
    _focusNodeManager.dispose();
  }
}

class _FocusNodeManager {
  Map<FormCompositionFieldData, FocusNode> _focusNodeMap = {};

  FocusNode nodeFor(FormCompositionFieldData fieldData, BuildContext context) {
    final node = _focusNodeMap[fieldData];
    if (node != null) return node;
    return _newNodeFor(fieldData, context);
  }

  FocusNode _newNodeFor(
      FormCompositionFieldData fieldData, BuildContext context) {
    final newNode = FocusNode();
    _focusNodeMap[fieldData] = newNode;
    return newNode;
  }

  void dispose() {
    _focusNodeMap.forEach((data, node) => node.dispose());
  }
}
