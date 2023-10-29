import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spa_app_management/src/presentation/home_page/components/item_grid_view_button.dart';

import '../../../configs/configs.dart';
import '../../../configs/constants/app_space.dart';

import 'item_button_gird_view_widget.dart';

//Appbar của screen Targets
buildAppBar(
    {BuildContext? context, String? textAppbar, Function()? onPressed}) {
  return AppBar(
    elevation: 5,
    backgroundColor: AppColors.COLOR_WHITE,
    leading: IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.logout,
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
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.color_lens_outlined),
        color: AppColors.BLACK_500,
      ),
      IconButton(
        onPressed: () {
          buildDialogGridView(context!);
        },
        icon: Icon(Icons.grid_view_outlined),
        color: AppColors.BLACK_500,
      ),
    ],
  );
}
