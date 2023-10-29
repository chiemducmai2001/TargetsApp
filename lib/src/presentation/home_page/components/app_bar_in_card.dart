import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../configs/configs.dart';
import '../../../configs/constants/app_space.dart';
import '../../add_targets/add_targets.dart';

import '../home_page_screen.dart';
import 'bottom_sheet.dart';

buildAppBarCard(
  context,
  String? textAppbar,
  Color bgColour,
) {
  return AppBar(
    elevation: 5,
    backgroundColor: bgColour,
    leading: IconButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePageScreen()));
      },
      icon: const Icon(
        Icons.arrow_back,
        color: AppColors.BLACK_500,
      ),
    ),
    title: Paragraph(
      content: textAppbar ?? '',
      style: STYLE_MEDIUM.copyWith(
        color: AppColors.BLACK_500,
        fontWeight: FontWeight.w400,
      ),
    ),
    actions: [
      // Nut de chinh sua
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.edit),
        color: AppColors.COLOR_WHITE,
      ),
      // Nut de xoa
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.delete),
        color: AppColors.COLOR_WHITE,
      ),
    ],
  );
 

}

class CardColors {
  // ignore: constant_identifier_names
  static const REDCARD = Color.fromRGBO(226, 25, 25, 1);

  static const GREENCARD = Color.fromRGBO(60, 230, 54, 1);

  static const BLUECARD = Color.fromRGBO(24, 89, 209, 1);

  static const BLACKCARD = Color.fromRGBO(0, 0, 0, 1);
  static const YELLOCARD = Color.fromARGB(255, 255, 239, 146);
  static const PURPLECARD = Color.fromARGB(255, 218, 10, 236);
  static const LIGHT_BLACK = Color.fromARGB(255, 131, 130, 131);
}
