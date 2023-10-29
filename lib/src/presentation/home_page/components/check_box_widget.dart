import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../configs/configs.dart';

Widget CheckBox(String contentToDo) {
  bool isChecked = false;
  return Row(
    children: [
      Checkbox(
        checkColor: Colors.white,
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
      Paragraph(
        content: contentToDo,
        style: STYLE_SMALL.copyWith(
          color: AppColors.BLACK_500,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}

void setState(Null Function() param0) {}
