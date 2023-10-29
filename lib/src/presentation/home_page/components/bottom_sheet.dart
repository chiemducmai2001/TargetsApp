import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../configs/configs.dart';
import '../../../configs/constants/app_space.dart';

class BottomSheetSelection extends StatelessWidget {
  const BottomSheetSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 50,
          decoration: const BoxDecoration(color: AppColors.COLOR_WHITE),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisSize: MainAxisSize.max, children: [
              const Icon(Icons.delete),
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
}
