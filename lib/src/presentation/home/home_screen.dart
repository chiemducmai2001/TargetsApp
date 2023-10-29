import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../configs/configs.dart';
import '../../configs/constants/app_space.dart';
import '../../configs/language/homepage_language.dart';
import '../base/base.dart';
import 'home.dart';

class HomeScreen extends StatefulWidget {
  final List<String> entries = <String>['Card 1 ', 'Card 2', 'Card 3'];
  final List<int> colorCodes = <int>[600, 500, 100];
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel _viewModel;
  String? nameCategory;
  int? numberCategory;
  bool? isChecked;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      viewModel: HomeViewModel(),
      onViewModelReady: (viewModel) => _viewModel = viewModel!..init(),
      builder: (context, viewModel, child) {
        return buildHome();
      },
    );
  }

  Widget buildAppbar() {
    final String? content;
    return AppBar(
      backgroundColor: AppColors.LINEAR_GREEN,
      elevation: 0,
      leading: new IconButton(
        icon: new Icon(Icons.more_horiz_sharp),
        onPressed: () {},
      ),
      title: Paragraph(
        textAlign: TextAlign.center,
        content: HomePageLanguage.welcomeBack,
        style: STYLE_MEDIUM.copyWith(
          color: AppColors.COLOR_WHITE,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget buildBody() {
    return Container(
      child: Column(
        children: [buildHeaderTask()],
      ),
    );
  }

  Widget buildHeaderTask() {
    int numberTask = 5;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(SizeToPadding.sizeVerySmall),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Paragraph(
                content: numberTask.toString() + ' Task',
                style: STYLE_MEDIUM.copyWith(
                  color: AppColors.LINEAR_GREEN,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Paragraph(
                content: 'Aspirant people , are not you?',
                style: STYLE_MEDIUM.copyWith(
                  color: AppColors.LINEAR_GREEN,
                  fontWeight: FontWeight.w300,
                ),
              ),
              
            ],
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(SpaceBox.sizeSmall),
            margin: EdgeInsets.all(SpaceBox.sizeMedium),
            decoration: BoxDecoration(
                color: AppColors.LINEAR_GREEN,
                border: Border.all(
                  color: AppColors.LINEAR_GREEN,
                ),
                borderRadius:
                    BorderRadius.circular(BorderRadiusSize.sizeLarge)),
            child: Paragraph(
              content: 'Add Task',
              textAlign: TextAlign.center,
              style: STYLE_MEDIUM.copyWith(
                color: AppColors.COLOR_WHITE,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildCategory() {
    return Padding(
      padding: EdgeInsets.all(SizeToPadding.sizeVerySmall),
      child: Row(
        children: [
          Column(
            children: [
              Paragraph(
                content: ' Category',
                style: STYLE_MEDIUM.copyWith(
                  color: AppColors.LINEAR_GREEN,
                  fontWeight: FontWeight.w700,
                ),
              ),
              buildCategoryPlan(
                  nameCategory = 'Personal Plan', numberCategory = 6),
              buildCategoryPlan(
                  nameCategory = 'Company Plan', numberCategory = 5),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCategoryPlan(String? nameCategory, int? numberCategory) {
    return Container(
        width: MediaQuery.of(context).size.width - 58,
        padding: EdgeInsets.all(SizeToPadding.sizeVerySmall),
        margin: EdgeInsets.all(SizeToPadding.sizeVerySmall),
        decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(BorderRadiusSize.sizeSmall)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.person),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Paragraph(
                      content: nameCategory,
                      style: STYLE_SMALL.copyWith(
                        color: AppColors.LINEAR_GREEN,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Paragraph(
                      content: ' $numberCategory Plans remaining',
                      style: STYLE_SMALL.copyWith(
                        color: AppColors.LINEAR_GREEN,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Paragraph(
                  content: 'Go to plan',
                  style: STYLE_SMALL.copyWith(
                    color: AppColors.LINEAR_GREEN,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Icon(
                  color: AppColors.PRIMARY_GREEN,
                  Icons.arrow_forward_ios,
                  size: Size.sizeSmall,
                )
              ],
            )
          ],
        ));
  }

  Widget CardTask() {
    return Card(
      color: AppColors.COLOR_WHITE,
      shadowColor: AppColors.SECONDARY_GREEN,
      child: Container(
        height: SizeToPadding.sizeVeryVeryBig * 2,
        width: SizeToPadding.sizeVeryVeryBig * 3,
        padding: EdgeInsets.all(SizeToPadding.sizeNone),
        margin: EdgeInsets.all(SizeToPadding.sizeSmall),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Paragraph(
                      content: '#Meeting',
                      style: STYLE_SMALL.copyWith(
                        color: AppColors.LINEAR_GREEN,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          size: Size.sizeSmall * 2,
                          color: AppColors.SECONDARY_GREEN,
                        ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(SizeToPadding.sizeVeryVerySmall - 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CheckBox(),
                          Paragraph(
                            content: 'Do HomeWork Today',
                            style: STYLE_VERY_SMALL_BOLE.copyWith(
                              color: AppColors.LINEAR_GREEN,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Paragraph(
                        textAlign: TextAlign.start,
                        content: 'Members',
                        style: STYLE_VERY_SMALL.copyWith(
                          color: AppColors.LINEAR_GREEN,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget CheckBox() {
    return Checkbox(
      checkColor: Colors.white,
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }

  Widget buildListPlan() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(SizeToPadding.sizeLarge),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: SizeToPadding.sizeSmall),
              child: Row(
                children: [
                  Paragraph(
                    textAlign: TextAlign.start,
                    content: 'On going',
                    style: STYLE_VERY_SMALL.copyWith(
                      color: AppColors.LINEAR_GREEN,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeToPadding.sizeVerySmall),
                    child: Paragraph(
                      textAlign: TextAlign.start,
                      content: 'Completed',
                      style: STYLE_VERY_SMALL.copyWith(
                        color: AppColors.LINEAR_GREEN,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: SizeToPadding.sizeVeryVeryBig * 4,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  CardTask(),
                  CardTask(),
                  CardTask(),
                  CardTask(),
                  CardTask(),
                  CardTask(),
                  CardTask(),
                  CardTask(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHome() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildAppbar(),
          buildBody(),
          buildCategory(),
          buildListPlan(),
        ],
      ),
    );
  }
}
