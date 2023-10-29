import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../../../configs/constants/app_space.dart';

class FormFieldAddNote extends StatefulWidget {
  FormFieldAddNote({
    super.key,
  });
  final TextNote = TextEditingController();

  @override
  State<FormFieldAddNote> createState() => _FormField();
}

class _FormField extends State<FormFieldAddNote> {
  String? Title;
  @override
  Widget build(BuildContext context) {
    String? Title;
    return Padding(
      padding: EdgeInsets.all(SizeToPadding.sizeVeryVerySmall),
      child: TextFormField(
        decoration: InputDecoration(hintText: Title),
        onSaved: (String? value) {
          // This optional block of code can be used to run
          // code when the user saves the form.
        },
        validator: (String? value) {
          return (value != null && value.contains('@'))
              ? 'Do not use the @ char.'
              : null;
        },
      ),
    );
  }
}
