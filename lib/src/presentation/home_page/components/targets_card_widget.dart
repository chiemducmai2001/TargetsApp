// ignore_for_file: avoid_dynamic_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../configs/configs.dart';
import '../../../configs/constants/app_space.dart';
import '../../../configs/constants/constants.dart';
import '../../routers.dart';
import 'app_bar_in_card.dart';

class TargetCardWidget extends StatelessWidget {
  TargetCardWidget({super.key, this.onTap, this.doc});
  final Function()? onTap;
  final QueryDocumentSnapshot? doc;
  Color? selectedColors;

  // xử lí màu

  @override
  Widget build(BuildContext context) {
    // Xử lý màu
    final colorString = doc?['colors'].toString();
    final hexColor = colorString!.substring(8, 16);
    final colorValue = int.parse(hexColor, radix: 16);
    final tagColor = Color(colorValue);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(SizeToPadding.sizeLarge),
        margin: EdgeInsets.all(SizeToPadding.sizeMedium),
        decoration: BoxDecoration(
          color: tagColor,
          borderRadius: BorderRadius.circular(BorderRadiusSize.sizeSmall),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: AppColors.BLACK_100!),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                doc?['title'] ?? '',
                style: STYLE_LARGE.copyWith(
                  color: AppColors.COLOR_WHITE,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Flexible(
              child: SizedBox(
                width: double.infinity / 2,
                child: Text(
                  doc?['content'] ?? '',
                  style: STYLE_SMALL.copyWith(
                    color: AppColors.COLOR_WHITE,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
