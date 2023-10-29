import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../../../configs/configs.dart';
import '../../../configs/constants/app_space.dart';

class FormFieldAddTodo extends StatefulWidget {
  FormFieldAddTodo({super.key});
  final TextNote = TextEditingController();

  @override
  State<FormFieldAddTodo> createState() => _FormFieldAddTodo();
}

class _FormFieldAddTodo extends State<FormFieldAddTodo> {
  TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeToPadding.sizeSmall),
      child: TextFormField(
        controller: contentController,
        decoration: InputDecoration(
            hintText: 'Click to Add ToDo',
            prefixIcon: IconButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('todo')
                      .add({'content': contentController.text});
                },
                icon: Icon(Icons.add))),
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
