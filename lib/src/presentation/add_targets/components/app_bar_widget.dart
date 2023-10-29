import 'package:flutter/material.dart';
import 'package:spa_app_management/src/presentation/add_targets/components/bottom_sheets.dart';

import '../../../configs/configs.dart';
import '../../../configs/widget/text/paragraph.dart';

buildAppbar(context) {
  return AppBar(
    elevation: 0,
    backgroundColor: AppColors.COLOR_WHITE,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back,
        color: AppColors.BLACK_500,
      ),
    ),
    title: Paragraph(
      content: 'Add note',
      style: STYLE_MEDIUM.copyWith(
        color: AppColors.BLACK_500,
        fontWeight: FontWeight.w400,
      ),
    ),
    actions: [BottomSheetField(context)],
  );
}
