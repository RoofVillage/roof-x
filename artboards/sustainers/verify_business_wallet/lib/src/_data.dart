import 'package:flutter/material.dart';
import 'package:form_builder/index.dart';

mixin VerifyBusinessWalletArtboardData implements FormBuilder {
  @override
  get initialSectionData async {
    return [
      StreamableFormSectionData(
        fieldData: [
          _firstName,
          _lastName,
          _email,
          _address,
          _dob,
          _ein,
        ],
      ),
      StreamableFormSectionData(
        headerData: StreamableFormSectionHeaderData(
          title: 'Businesss Controller',
        ),
        fieldData: [
          _controller,
        ],
      ),
      StreamableFormSectionData(
        headerData: StreamableFormSectionHeaderData(
          title: 'Beneficial Owner',
        ),
        fieldData: [
          _hasBeneficialOwner,
        ],
      )
    ];
  }

  Future<void> submit(BuildContext context) {
    // TODO: implement submit
    return null;
  }

  @override
  void setupFields(
    BuildContext context, {
    List<StreamableFormFieldData> fieldData,
  }) =>
      _hasBeneficialOwner.addOnChangedListener(_toggleBeneficialOwnerField);

  void _toggleBeneficialOwnerField(bool hasBeneficialOwner) =>
      hasBeneficialOwner
          ? form.insertFieldData(_beneficialOwner, after: _hasBeneficialOwner)
          : form.removeFieldData(_beneficialOwner);

  static final _firstName = FormFirstNameTextFieldData(
    isRequired: true,
  );
  final _lastName = FormLastNameTextFieldData(
    isRequired: true,
  );
  final _email = FormEmailTextFieldData(
    isRequired: true,
  );
  final _dob = FormDateOfBirthFieldData();
  final _ein = FormEinFieldData(
    isRequired: true,
  );
  static final _address = AddressMetaFieldData(
    title: 'Business Address',
    isRequired: true,
  );
  final _controller = ControllerMetaFieldData(
    isRequired: true,
  );
  final _hasBeneficialOwner = FormSwitchFieldData(
    title: 'At least one person owns 25% or more of this business',
  );
  final _beneficialOwner = BeneficialOwnerMetaFieldData(
    isRequired: true,
  );
}
