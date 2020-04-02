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
          title: 'Beneficial Owners',
          subtitle:
              'Provide information for anyone who owns at least 25% of this business.',
        ),
        fieldData: [
          _hasNoBeneficialOwner,
          _beneficialOwnerField(removable: true),
        ],
        buttonData: StreamableFormSectionButtonData(
          text: 'Add',
          onTap: () => form.insertFieldData(
            _beneficialOwnerField(removable: true),
            after: form.formData.sectionData.last.fieldData.last,
          ),
        ),
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
      _hasNoBeneficialOwner.addOnChangedListener(_toggleBeneficialOwnerField);

  void _toggleBeneficialOwnerField(bool hasNoBeneficialOwner) {
    if (hasNoBeneficialOwner) {
      form.batchRemoveFieldData(
        form.formData.sectionData.last.fieldData
            .where(
              (fieldData) => fieldData != _hasNoBeneficialOwner,
            )
            .toList(),
      );
    }
  }

  _beneficialOwnerField({bool removable}) => BeneficialOwnerMetaFieldData(
        isRequired: true,
        isRemovable: removable ?? false,
      );

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
  final _hasNoBeneficialOwner = FormSwitchFieldData(
    title: 'No single person owns 25% or more of this business',
  );
}
