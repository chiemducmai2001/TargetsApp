import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../../../main.dart';
import '../../configs/configs.dart';
import '../../configs/constants/app_space.dart';
import '../../configs/language/homepage_language.dart';
import '../base/base.dart';
import 'add_todo.dart';
import 'components/components.dart';
import 'components/form_field_add_todo.dart';

class AddToDoScreen extends StatefulWidget {
  final List<String> entries = <String>['Card 1 ', 'Card 2', 'Card 3'];
  final List<int> colorCodes = <int>[600, 500, 100];

  AddToDoScreen({super.key});

  @override
  State<AddToDoScreen> createState() => _AddToDoScreen();
}

class _AddToDoScreen extends State<AddToDoScreen> {
  late AddToDoViewModel _viewModel;
  String? nameCategory;
  int? numberCategory;
  bool? isChecked;
  final _random = Random();
  @override
  Widget build(BuildContext context) {
    return BaseWidget<AddToDoViewModel>(
      viewModel: AddToDoViewModel(),
      onViewModelReady: (viewModel) => _viewModel = viewModel!..init(),
      builder: (context, viewModel, child) {
        return buildHome();
      },
    );
  }

  Widget buildHome() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildAppbar(),
            buildBody(),
          ],
        ),
      ),
    );
  }

  Widget buildAppbar() {
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
        content: 'Add To Do',
        style: STYLE_MEDIUM.copyWith(
          color: AppColors.BLACK_500,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: [bottomSheetField()],
    );
  }

  Widget bottomSheetField() {
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
                  bottomSheetContent(),
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

  Widget bottomSheetContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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

  Widget buildBody() {
    return Column(
      children: [FormFieldAddTodo()],
    );
  }
}
