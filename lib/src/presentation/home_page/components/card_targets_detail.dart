import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../configs/configs.dart';
import '../../../configs/constants/app_space.dart';
import '../../../configs/widget/text/paragraph.dart';
import '../../routers.dart';
import 'app_bar_in_card.dart';
import 'package:firebase_database/firebase_database.dart';

class CardTargetsEditor extends StatefulWidget {
  CardTargetsEditor({
    super.key,
  });

  @override
  State<CardTargetsEditor> createState() => _CardTargetsEditorState();
}

class _CardTargetsEditorState extends State<CardTargetsEditor> {
  // final collection = FirebaseFirestore.instance.collection('targets');

  @override
  Widget build(
    BuildContext context,
  ) {
    final args = ModalRoute.of(context)!.settings.arguments as TargetArguments?;
    // xử lí màu
    final String? colorString = args?.targets!['colors'].toString();
    final String hexColor = colorString!.substring(8, 16);
    int colorValue = int.parse(hexColor, radix: 16);
    Color tagColor = Color(colorValue);
    return SafeArea(
        child: Scaffold(
      appBar: buildAppBarCard(context, args?.targets!['title'] ?? '', tagColor),
      body: Padding(
        padding: EdgeInsets.all(SizeToPadding.sizeVeryVeryBig),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Paragraph(
                content: args?.targets!['content'] ?? '',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                 const Paragraph(
                    content: 'Tag Colors : ' ?? '',
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: tagColor),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
