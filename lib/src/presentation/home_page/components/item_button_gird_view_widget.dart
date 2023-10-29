import 'package:flutter/material.dart';

import '../../../configs/constants/app_space.dart';
import '../../../configs/widget/text/paragraph.dart';

class ItemButtonGirdVieWidget extends StatelessWidget {
  const ItemButtonGirdVieWidget({super.key, this.content, this.icon, this.onTap});
  final String? content;
  final Widget? icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeToPadding.sizeMedium),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            icon!,
            SizedBox(
              width: SpaceBox.sizeMedium,
            ),
            Paragraph(
              content: content ?? '',
            )
          ],
        ),
      ),
    );
  }
}
