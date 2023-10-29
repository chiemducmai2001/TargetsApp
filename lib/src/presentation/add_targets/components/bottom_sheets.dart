import 'package:flutter/material.dart';

import '../../../configs/configs.dart';
import '../../../configs/widget/text/paragraph.dart';
import 'bottomSheetContent_widget.dart';

Widget BottomSheetField(context) {
  return IconButton(
    onPressed: () {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                BottomSheetContent(),
              ],
            ),
          );
        },
      );
    },
    icon: Icon(Icons.more_vert),
    color: AppColors.BLACK_500,
  );
}
