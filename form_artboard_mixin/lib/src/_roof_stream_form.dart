import 'package:flutter/material.dart';
import 'package:form/index.dart';
import 'package:form_components/index.dart';

import 'data/index.dart';

class RoofStreamForm extends StreamForm<StreamableFormFieldData,
    StreamableFormSectionHeaderData> {
  final _focusNodeManager = _FocusNodeManager();

  List<FormCompositionFieldData> get _allCompositionFieldData {
    final allFieldData = bloc.formData.fieldData;
    final allTextFieldData =
        allFieldData.whereType<FormTextFieldData>().toList();
    final allTextAreaData = allFieldData.whereType<FormTextAreaData>().toList();
    List<FormCompositionFieldData> allCompositionFieldData = [];
    allCompositionFieldData.addAll(allTextFieldData);
    allCompositionFieldData.addAll(allTextAreaData);
    return allCompositionFieldData;
  }

  Widget buildTextField(
      {FormTextFieldData fieldData, int fieldIndex, int sectionIndex}) {
    final inputAction = _getInputActionForCompositionFieldData(fieldData);
    final focusNode = _focusNodeManager.nodeFor(fieldData);
    return RoofTextField(
      autofocus: fieldData.autofocus,
      fieldName: fieldData.title,
      placeholder: fieldData.placeholder,
      initialValue: fieldData.value,
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
        _onCompositionViewFocusChanged(fieldData, isInFocus);
      },
      focusNode: focusNode,
    );
  }

  Widget buildTextArea(
      {FormTextAreaData fieldData, int fieldIndex, int sectionIndex}) {
    final inputAction = _getInputActionForCompositionFieldData(fieldData);

    return RoofTextArea(
        autofocus: fieldData.autofocus,
        fieldName: fieldData.title,
        placeholder: fieldData.placeholder,
        initialValue: fieldData.value,
        textInputAction: inputAction,
        onChanged: (value) {
          _onCompositionViewChanged(fieldData, value);
        },
        onSubmitted: (value, context) {
          _onCompositionViewSubmitted(fieldData, value, context);
        },
        onFocusChanged: (isInFocus) {
          _onCompositionViewFocusChanged(fieldData, isInFocus);
        },
        focusNode: _focusNodeManager.nodeFor(fieldData));
  }

  Widget buildSwitch(
      {FormSwitchData fieldData, int fieldIndex, int sectionIndex}) {
    return RoofSwitchField(
        title: fieldData.title,
        isOnInitially: fieldData.initialValue,
        onChanged: fieldData.onChanged);
  }

  Widget buildOptionSelect(
      {FormOptionSelectData fieldData, int fieldIndex, int sectionIndex}) {
    List<RoofSelectFieldOptionData> options = fieldData.options.map((option) {
      return RoofSelectFieldOptionData(title: option.title, data: option.data);
    }).toList();

    return RoofSelectField(
        title: fieldData.title,
        emptyText: fieldData.emptyText,
        isMultiSelect: fieldData.isMultiSelect,
        options: options,
        onChanged: (selectedOptions) {
          List<FormOptionSelectValueData> convertedOptions =
              selectedOptions.map((option) {
            return FormOptionSelectValueData(
                title: option.title, data: option.data);
          }).toList();
          fieldData.onChanged(convertedOptions);
        });
  }

  @override
  Widget buildField(
      {BuildContext context,
      StreamableFormFieldData fieldData,
      int fieldIndex,
      int sectionIndex}) {
    if (fieldData is FormTextFieldData) {
      return buildTextField(
          fieldData: fieldData,
          fieldIndex: fieldIndex,
          sectionIndex: sectionIndex);
    } else if (fieldData is FormTextAreaData) {
      return buildTextArea(
          fieldData: fieldData,
          fieldIndex: fieldIndex,
          sectionIndex: sectionIndex);
    } else if (fieldData is FormSwitchData) {
      return buildSwitch(
          fieldData: fieldData,
          fieldIndex: fieldIndex,
          sectionIndex: sectionIndex);
    } else if (fieldData is FormOptionSelectData) {
      return buildOptionSelect(
          fieldData: fieldData,
          fieldIndex: fieldIndex,
          sectionIndex: sectionIndex);
    }

    return null;
  }

  void _changeFocus(
      {@required FormCompositionFieldData fieldData,
      @required BuildContext context}) {
    final nextEmptyFieldData = _nextEmptyCompositionFieldDataAfter(fieldData);

    if (nextEmptyFieldData != null) {
      final focusNode = _focusNodeManager.nodeFor(nextEmptyFieldData);
      if (focusNode != null) FocusScope.of(context).requestFocus(focusNode);
    } else {
      final focusNode = _focusNodeManager.nodeFor(fieldData);
      if (focusNode != null) focusNode.unfocus();
    }
  }

  FormTextFieldData _nextEmptyCompositionFieldDataAfter(
      FormCompositionFieldData fieldData) {
    final allCompositionFieldData = _allCompositionFieldData;

    final index = allCompositionFieldData.indexOf(fieldData);
    for (var i = index + 1; i < allCompositionFieldData.length; i++) {
      final subsequentFieldData = allCompositionFieldData[i];
      if (subsequentFieldData.value.isEmpty) return subsequentFieldData;
    }
    for (var i = 0; i < index; i++) {
      final previousFieldData = allCompositionFieldData[i];
      if (previousFieldData.value.isEmpty) return previousFieldData;
    }
    return null;
  }

  TextInputAction _getInputActionForCompositionFieldData(
      FormCompositionFieldData fieldData) {
    final nextEmpty = _nextEmptyCompositionFieldDataAfter(fieldData);

    return nextEmpty != null ? TextInputAction.next : TextInputAction.done;
  }

  void _updateCompositionFieldData({FormCompositionFieldData except}) {
    for (final fieldData in _allCompositionFieldData) {
      if (fieldData == except) continue;
      bloc.updateFieldData(fieldData);
    }
  }

  _onCompositionViewFocusChanged(
      FormCompositionFieldData fieldData, bool isInFocus) {
    if (fieldData.onFocusChanged != null) fieldData.onFocusChanged(isInFocus);
  }

  _onCompositionViewSubmitted(
      FormCompositionFieldData fieldData, String value, BuildContext context) {
    if (fieldData.onSubmitted != null) fieldData.onSubmitted(value);
    _changeFocus(fieldData: fieldData, context: context);
  }

  _onCompositionViewChanged(FormCompositionFieldData fieldData, String value) {
    final oldValue = fieldData.value;
    if (fieldData.onChanged != null) fieldData.onChanged(value);
    //If the fieldValue is going from empty to not empty or vice versa.
    final emptyStateChanged = value.length + oldValue.length == 1;
    if (emptyStateChanged) {
      _updateCompositionFieldData(except: fieldData);
    }
  }

  // KeyboardButtonData _getKeyboardButtonDataForCompositionFieldData(
  //     FormCompositionFieldData fieldData) {
  //   final hasEmptyField =
  //       _nextEmptyCompositionFieldDataAfter(fieldData) != null;

  //   // final submitState = (fieldData.canSubmitWithKeyboardRaised ?  );
  //   final nextButton = KeyboardButtonData(
  //       text: "Next",
  //       onTap: (context) => FocusScope.of(context).requestFocus(FocusNode()));

  //   final submitButton = KeyboardButtonData(
  //       text: "Next",
  //       onTap: (context) => FocusScope.of(context).requestFocus(FocusNode()));
  //   // return hasEmptyField ? nextButton : nextButton);
  // }
}

class _FocusNodeManager {
  Map<FormCompositionFieldData, FocusNode> _focusNodeMap = {};

  FocusNode nodeFor(FormCompositionFieldData fieldData) {
    final node = _focusNodeMap[fieldData];
    if (node != null) return node;
    final newNode = FocusNode();
    _focusNodeMap.addAll({fieldData: newNode});
    return newNode;
  }
}

// class KeyboardButtonData {
//   final String text;
//   final Function(BuildContext) onTap;

//   KeyboardButtonData({@required this.text, @required this.onTap});
// }
