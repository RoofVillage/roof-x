import 'package:flutter/material.dart';
import 'package:form_builder/index.dart';

mixin VerifyBusinessWalletArtboardData implements FormBuilder {
  @override
  Future<List<StreamableFormSectionData>> buildInitialSectionData(
    BuildContext context,
  ) async =>
      [
        _businessInfoSection,
        _controllerSection,
        _beneficialOwnerSection(context),
      ];

  StreamableFormSectionData get _businessInfoSection =>
      StreamableFormSectionData(
        fieldData: [
          _firstName,
          _lastName,
          _email,
          _address,
          _dob,
          _ein,
        ],
      );

  StreamableFormSectionData get _controllerSection => StreamableFormSectionData(
        headerData: StreamableFormSectionHeaderData(
          title: 'Business Controller',
          subtitle: 'Someone with the responsibility to manage or direct this business.'
        ),
        fieldData: [
          _controller,
        ],
      );

  StreamableFormSectionData _beneficialOwnerSection(BuildContext context) =>
      StreamableFormSectionData(
        headerData: StreamableFormSectionHeaderData(
          title: 'Business Owners',
          subtitle:
              'Add information for every individual who owns at least 25% of this business.',
        ),
        fieldData: [
          BeneficialOwnerMetaFieldData(),
        ],
        buttonData: StreamableFormSectionButtonData(
          text: 'Add another',
          onTap: () => form.insertFieldData(
            _beneficialOwnerField(context, removable: true),
            after: form.formData.sectionData.last.fieldData.last,
          ),
        ),
      );

  BeneficialOwnerMetaFieldData _beneficialOwnerField(
    BuildContext context, {
    bool removable,
  }) {
    final field = BeneficialOwnerMetaFieldData(
      isRequired: true,
      isRemovable: removable ?? false,
    );

    setupFieldDataOnTapListeners(context, fieldData: [field]);

    return field;
  }

  Future<void> submit(BuildContext context) {
    // TODO: implement submit
    return null;
  }

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
}
