import 'package:flutter/material.dart';

import '../constants.dart';

enum GenderOption { female, male, other }

class PersonalInfoFields {
  static Column buildGeneralField(
      String nameField, Function onChanged, String text, BuildContext context) {
    final node = FocusScope.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nameField,
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                color: Colors.grey[700],
              ),
        ),
        SizedBox(height: kDefaultPadding / 2.5),
        TextFormField(
          initialValue: text == null ? "" : text,
          textInputAction: TextInputAction.next,
          decoration: inputDecoration.copyWith(hintText: nameField),
          validator: (value) {
            if (value.isEmpty) {
              return kFieldNullError + nameField;
            }
            return null;
          },
          onChanged: onChanged,
          onEditingComplete: () => node.nextFocus(),
        ),
      ],
    );
  }

  static Column buildPhoneField(
      String phone, Function onChange, BuildContext context) {
    final node = FocusScope.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Telephone Number",
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                color: Colors.grey[700],
              ),
        ),
        SizedBox(height: kDefaultPadding / 2.5),
        TextFormField(
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          decoration: inputDecoration.copyWith(hintText: "Telephone Number"),
          initialValue: phone == null ? "" : phone,
          validator: (value) {
            if (value.isEmpty) {
              return kFieldNullError + "Telephone Number";
            }

            return null;
          },
          onChanged: onChange,
          onEditingComplete: () => node.nextFocus(),
        ),
      ],
    );
  }

  static Widget buildDobField(
      ValueNotifier dob, BuildContext context, Function onTap) {
    return ValueListenableBuilder(
      valueListenable: dob,
      builder: (context, value, child) {
        return GestureDetector(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Date of Birth",
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.grey[700],
                    ),
              ),
              SizedBox(height: kDefaultPadding / 2.5),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kLightGreyColor,
                  borderRadius: BorderRadius.circular(kDefaultPadding),
                ),
                child: dob.value == ''
                    ? Text(
                        "Select Date of Birth",
                        style: TextStyle(color: kHintTextColor),
                      )
                    : Text(dob.value),
              )
            ],
          ),
        );
      },
    );
  }
}
