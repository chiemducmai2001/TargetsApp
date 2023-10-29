import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../configs/configs.dart';
import '../../../configs/constants/app_space.dart';
import 'item_button_gird_view_widget.dart';

Future<void> buildDialogGridView(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      content: Builder(
        builder: (context) {
          final height = MediaQuery.of(context).size.height;
          final width = MediaQuery.of(context).size.width;

          return SizedBox(
            height: height - 444,
            width: width - 400,
            child: Column(
              children: [
                const Paragraph(content: 'Select layout'),
                Padding(
                  padding: EdgeInsets.all(SizeToPadding.sizeLarge),
                  child: const Column(
                    children: [
                      ItemButtonGirdVieWidget(
                        content: 'GridView',
                        icon: Icon(Icons.grid_view_outlined),
                      ),
                      ItemButtonGirdVieWidget(
                        content: 'GridView',
                        icon: Icon(Icons.grid_view_sharp),
                      ),
                      ItemButtonGirdVieWidget(
                        content: 'List View',
                        icon: Icon(Icons.line_style_outlined),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    ),
  );
}
