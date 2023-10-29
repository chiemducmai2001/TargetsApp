import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../configs/configs.dart';
import '../../configs/constants/app_space.dart';
import '../../utils/utils.dart';
import '../add_targets/add_targets.dart';

import '../base/base.dart';

import 'components/app_bar_widget.dart';

import 'components/targets_card_widget.dart';
import 'home_page.dart';

class HomePageScreen extends StatefulWidget {
  String? todoName;
  String? categoryNameTask;
  String? contentTask;
  String? dialogText;
  HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreen();
}

class _HomePageScreen extends State<HomePageScreen> {
  late HomePageViewModel _viewModel;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ref = FirebaseDatabase.instance.ref('todo');

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomePageViewModel>(
      viewModel: HomePageViewModel(),
      onViewModelReady: (viewModel) => _viewModel = viewModel!..init(),
      builder: (context, viewModel, child) {
        return buildHomePage();
      },
    );
  }

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: const Paragraph(
                    content: 'Menu' ?? '',
                  ),
                ),
              ],
            ),
          ),
          const Column(
            children: [
              ListTile(
                leading: Icon(Icons.home),
                title: Paragraph(
                  content: 'Home',
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Paragraph(
                  content: 'Person',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildHomePage() {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: buildAppBar(
            context: context,
            textAppbar: 'App Targets',
            onPressed: () async {
              await AppPref.logout();
              await _viewModel!.goToSignIn(context);
            }),
        body: Column(
          children: [
            const Divider(
              height: 0,
              thickness: 2,
              color: Colors.black12,
            ),
            gridViewTargets()
          ],
        ),
        floatingActionButton: HawkFabMenu(
          icon: AnimatedIcons.add_event,
          body: const Paragraph(
            content: 'Hello' ?? '',
          ),
          items: [
            HawkFabMenuItem(
              label: 'Add Targets',
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddNoteScreen(),
                    ));
              },
              icon: const Icon(Icons.comment),
              labelColor: Colors.white,
              labelBackgroundColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget gridViewTargets() {
    return Expanded(
      child: Container(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            itemCount: _viewModel.targets.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            itemBuilder: (context, int index) {
              return Text(_viewModel.targets[index].title!);
            },
          )),
    );
  }

  // Widget gridViewTargets() {
  //   return Expanded(
  //     child: StreamBuilder<QuerySnapshot>(
  //       stream: FirebaseFirestore.instance.collection('targets').snapshots(),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return const Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         }
  //         if (snapshot.hasData) {
  //           return GridView(
  //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //               crossAxisCount: 2,
  //             ),
  //             children: snapshot.data!.docs
  //                 .map(
  //                   (targets) => TargetCardWidget(
  //                     onTap: () async {
  //                       await _viewModel.goToDetailsCard(context, targets);
  //                     },
  //                     doc: targets,
  //                   ),
  //                 )
  //                 .toList(),
  //           );
  //         }
  //         return const Paragraph(content: "There's no Targets");
  //       },
  //     ),
  //   );
  // }

  Widget buildBody() {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 40,
      child: ListView(
        padding: EdgeInsets.all(SizeToPadding.sizeMedium),
        children: const [SingleChildScrollView()],
      ),
    );
  }

  Widget buildCardPlan(
    Color color,
    String categoryNameTask,
    String contentTask,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Card(
        color: color,
        child: Container(
          height: SizeToPadding.sizeVeryVeryBig * 4,
          width: SizeToPadding.sizeVeryVeryBig * 2,
          padding: EdgeInsets.only(bottom: SizeToPadding.sizeVeryVerySmall),
          margin: EdgeInsets.all(SizeToPadding.sizeSmall),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Paragraph(
                          content: categoryNameTask,
                          style: STYLE_MEDIUM.copyWith(
                            color: AppColors.BLACK_500,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Paragraph(
                          content: contentTask,
                          style: STYLE_SMALL.copyWith(
                            color: AppColors.BLACK_500,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
