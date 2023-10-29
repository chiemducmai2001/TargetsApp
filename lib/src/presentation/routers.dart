import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../resource/model/model.dart';
import 'app/splash.dart';

import 'home_page/components/card_targets_detail.dart';
import 'home_page/home_page.dart';
import 'sign_in/sign_in.dart';
import 'sign_up/sign_up_screen.dart';
import 'verification_code/verification_code_screen.dart';

class TemplateArguments {
  TemplateArguments(this.data, this.created);
  final dynamic data;
  final String created;
}

class RegisterArguments {
  RegisterArguments({
    this.pass,
    this.verificationId,
    this.userModel,
  });
  final String? pass;
  final String? verificationId;
  final UserModel? userModel;
}

class TargetArguments {
  TargetArguments({this.targets});
  QueryDocumentSnapshot<Object?>? targets;
}

class TodoArguments {
  TodoArguments({this.todo});
  QueryDocumentSnapshot<Object?>? todo;
}

class Routers {
  static const String getStarted = '/getStarted';
  static const String home = '/home';
  static const String homeDetails = '/homeDetails';
  static const String verification = '/verification';
  static const String updateProfile = '/updateProfile';
  static const String createPassword = '/createPassword';
  static const String signIn = '/signIn';
  static const String addService = '/addService';
  static const String serviceList = '/serviceList';
  static const String serviceDetails = '/serviceDetails';
  static const String editService = '/editService';
  static const String signUp = '/signUp';
  static const String navigation = '/navigation';
  static const String cardEditor = '/cardEditor';
  static const String cardTodoEditor = '/cardTodoEditor';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case getStarted:
        return animRoute(
          const SplashScreen(),
          beginOffset: right,
          name: getStarted,
          arguments: arguments,
        );
      case cardTodoEditor:
        return animRoute(
          CardTargetsEditor(),
          beginOffset: right,
          name: cardEditor,
          arguments: arguments,
        );
      case cardEditor:
        return animRoute(
          CardTargetsEditor(),
          beginOffset: right,
          name: cardTodoEditor,
          arguments: arguments,
        );
      case verification:
        return animRoute(
          const VerificationScreen(),
          beginOffset: right,
          name: verification,
          arguments: arguments,
        );

      case home:
        return animRoute(
           HomePageScreen(),
          beginOffset: right,
          name: home,
          arguments: arguments,
        );

      case signIn:
        return animRoute(
          const SignInScreen(),
          beginOffset: right,
          name: signIn,
          arguments: arguments,
        );

      case signUp:
        return animRoute(
          const SignUpScreen(),
          beginOffset: right,
          name: signUp,
          arguments: arguments,
        );

      // case profileMember:
      //   return animRoute(const ProfileMemberScreen(),
      //       beginOffset: right, name: profileMember, arguments: arguments);

      default:
        return animRoute(
          Center(
            child: Text('No route defined for ${settings.name}'),
          ),
          name: '/error',
        );
    }
  }

  static Route animRoute(
    Widget page, {
    required String name,
    Offset? beginOffset,
    Object? arguments,
  }) {
    return PageRouteBuilder(
      settings: RouteSettings(name: name, arguments: arguments),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final begin = beginOffset ?? const Offset(0, 0);
        const end = Offset.zero;
        const curve = Curves.ease;
        final tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Offset center = const Offset(0, 0);
  static Offset top = const Offset(0, 1);
  static Offset bottom = const Offset(0, -1);
  static Offset left = const Offset(-1, 0);
  static Offset right = const Offset(1, 0);
}
