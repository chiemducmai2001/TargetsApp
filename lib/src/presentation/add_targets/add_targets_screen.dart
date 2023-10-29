import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'dart:math';

import '../../configs/configs.dart';
import '../../configs/constants/app_space.dart';
import '../base/base.dart';
import '../home_page/components/app_bar_in_card.dart';
import 'add_targets.dart';
import 'package:firebase_database/firebase_database.dart';

import 'components/app_bar_widget.dart';

class AddNoteScreen extends StatefulWidget {
  AddNoteScreen({
    super.key,
  });
  @override
  State<AddNoteScreen> createState() => _AddNoteScreen();
}

class _AddNoteScreen extends State<AddNoteScreen> {
  Color? tagColors = AppColors.COLOR_GREY;
  TextEditingController idController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController createdAt = TextEditingController();
  late AddNoteViewModel _viewModel;
  String? nameCategory;
  int? numberCategory;
  bool? isChecked;
  final _random = Random();
  @override
  Widget build(BuildContext context) {
    return BaseWidget<AddNoteViewModel>(
      viewModel: AddNoteViewModel(),
      onViewModelReady: (viewModel) => _viewModel = viewModel!..init(),
      builder: (context, viewModel, child) {
        return buildHome(context);
      },
    );
  }

  void initState() {
    super.initState();

    tagColors = tagColors!; // Sử dụng màu đã chọn
  }

  Widget SelectNoteColors() {
    return GridView.count(
      crossAxisCount: 7,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 8.0,
      children: [
        Card(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Container(
            color: Colors.primaries[_random.nextInt(Colors.primaries.length)]
                [_random.nextInt(9) * 100],
            padding: const EdgeInsets.all(30),
            child: Text('Test'),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Container(
            color: Colors.primaries[_random.nextInt(Colors.primaries.length)]
                [_random.nextInt(9) * 100],
            padding: const EdgeInsets.all(30),
            child: Text('Test'),
          ),
        ),
      ],
    );
  }

  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.all(SizeToPadding.sizeLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Paragraph(
              content: 'Target Title',
              style: STYLE_MEDIUM.copyWith(
                color: AppColors.BLACK_500,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFieldTitle(),
          const Divider(
            height: 100,
            thickness: 2,
          ),
          Paragraph(
            content: 'Descreption ',
            style: STYLE_MEDIUM.copyWith(
              color: AppColors.BLACK_500,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFieldTargets(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSelectColors(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Paragraph(
                  content: 'Tag Colors ',
                  style: STYLE_MEDIUM.copyWith(
                    color: AppColors.BLACK_500,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: tagColors,
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(SizeToPadding.sizeBig),
            child: AppButton(
              content: 'Submit',
              enableButton: true,
              onTap: () {
                FirebaseFirestore.instance
                    .collection('targets')
                    .add(
                      {
                        'title': titleController.text,
                        'content': contentController.text,
                        'id': idController.text,
                        'priorityLevel': 1,
                        'status': 'Done',
                        'userId': 1,
                        'createdAt': DateTime.now(),
                        'updateAt': DateTime.now(),
                        'colors': tagColors.toString(),
                      },
                    )
                    .then((value) {})
                    .catchError(
                        (error) => print("Failed to add Targets: $error"));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget TextFieldTitle() {
    return Padding(
      padding: EdgeInsets.all(SizeToPadding.sizeVeryVerySmall),
      child: TextFormField(
        controller: titleController,
        decoration: const InputDecoration(
          hintText: 'Write Title here...',
          border: InputBorder.none,
        ),
        onSaved: (String? value) {
          // This optional block of code can be used to run
          // code when the user saves the form.
        },
        validator: (String? value) {
          return (value != null && value.contains('@'))
              ? 'Do not use the @ char.'
              : null;
        },
      ),
    );
  }

  Widget TextFieldTargets() {
    return Padding(
      padding: EdgeInsets.all(SizeToPadding.sizeVeryVerySmall),
      child: TextFormField(
        controller: contentController,
        decoration: const InputDecoration(
          hintText: 'Write Targets here...',
          border: InputBorder.none,
        ),
        validator: (String? value) {
          if (value == null) {
            return "Not null";
          }
        },
      ),
    );
  }

  Widget buildSelectColors() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              tagColors = CardColors.REDCARD;
            });
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: CardColors.REDCARD,
                borderRadius: BorderRadius.circular(90)),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              tagColors = CardColors.GREENCARD;
            });
          },
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: CardColors.GREENCARD,
                borderRadius: BorderRadius.circular(90)),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              tagColors = CardColors.BLUECARD;
            });
          },
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: CardColors.BLUECARD,
                borderRadius: BorderRadius.circular(90)),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              tagColors = CardColors.YELLOCARD;
            });
          },
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: CardColors.YELLOCARD,
                borderRadius: BorderRadius.circular(90)),
          ),
        ),
      ],
    );
  }

  Widget buildHome(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildBody(),
            ],
          ),
        ),
      ),
    );
  }
}
