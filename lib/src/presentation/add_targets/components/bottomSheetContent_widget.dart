import 'package:flutter/material.dart';

import '../../../configs/configs.dart';
import '../../../configs/constants/app_space.dart';

Widget BottomSheetContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(color: AppColors.COLOR_WHITE),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisSize: MainAxisSize.max, children: [
              Icon(Icons.delete),
              SizedBox(
                width: SpaceBox.sizeMedium,
              ),
              Paragraph(
                content: 'Delete Note',
                style: STYLE_MEDIUM.copyWith(
                  color: AppColors.BLACK_500,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]),
          ),
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(color: AppColors.COLOR_WHITE),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisSize: MainAxisSize.max, children: [
              Icon(Icons.person_add),
              SizedBox(
                width: SpaceBox.sizeMedium,
              ),
              Paragraph(
                content: 'Collaborator',
                style: STYLE_MEDIUM.copyWith(
                  color: AppColors.BLACK_500,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]),
          ),
        ),
        const Divider(
            height: 5,
            thickness: 1,
            indent: 5,
            endIndent: 5,
            color: AppColors.BLACK_300),
        Center(
          child: Paragraph(
            content: 'Select Note Color',
            style: STYLE_MEDIUM.copyWith(
              color: AppColors.BLACK_500,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }