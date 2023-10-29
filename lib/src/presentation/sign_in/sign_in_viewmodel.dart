import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../configs/configs.dart';
import '../../configs/widget/loading/loading_diaglog.dart';
import '../../resource/service/auth.dart';
import '../../utils/app_pref.dart';
import '../../utils/app_valid.dart';
import '../base/base.dart';
import '../home_page/home_page.dart';
import '../routers.dart';

class Constants {
  static const signInScreen = 'SignInScreen';
}

class SignInViewModel extends BaseViewModel {
  AuthApi authApi = AuthApi();

  bool enableSignIn = false;
  String? messagePhone;
  String? messageEmail;
  String? messagePassword;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  dynamic init() {}
  late int b;
  Future<void> goToSignUp() => Navigator.pushNamed(
        context,
        Routers.signUp,
      );

  Future<void> goToHome() =>
      Navigator.pushReplacementNamed(context, Routers.home);

  void validPhone(String? value) {
    final result = AppValid.validatePhoneNumber(value);
    if (result != null) {
      messagePhone = result;
    } else {
      messagePhone = null;
    }
    notifyListeners();
  }

  void validEmail(String? value) {
    final result = AppValid.validateEmail(value);
    if (result != null) {
      messageEmail = result;
    } else {
      messageEmail = null;
    }
    notifyListeners();
  }

  void validatePassword(String? value) {
    final result = AppValid.validatePassword(value);
    if (result != null) {
      messagePassword = result;
    } else {
      messagePassword = null;
    }
    notifyListeners();
  }

  void onSignIn() {
    if (messageEmail == null && messagePassword == null) {
      enableSignIn = true;
    } else {
      enableSignIn = false;
    }
    notifyListeners();
  }

  dynamic showOpenDialog(_) {
    showDialog(
      context: context,
      builder: (_) {
        return WarningDialog(
          content: SignInLanguage.validAccount,
          image: AppImages.icPlus,
          title: SignUpLanguage.failed,
          leftButtonName: SignUpLanguage.cancel,
          color: AppColors.BLACK_500,
          colorNameLeft: AppColors.BLACK_500,
          rightButtonName: SignInLanguage.nowSignUp,
          onTapLeft: () {
            Navigator.pop(context);
          },
          onTapRight: () {
            goToSignUp();
          },
        );
      },
    );
  }

  dynamic showDialogNetwork(_) {
    showDialog(
      context: context,
      builder: (context) {
        return WarningOneDialog(
          content: CreatePasswordLanguage.errorNetwork,
          image: AppImages.icPlus,
          title: SignUpLanguage.failed,
          buttonName: SignUpLanguage.cancel,
          color: AppColors.BLACK_500,
          colorNameLeft: AppColors.BLACK_500,
          onTap: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  Future<void> saveToken(String value) async {
    await AppPref.setToken(value);
  }

  void setEvenAnalytics(String? phoneNumber) {
    ConfigAnalytics.signIn(phoneNumber!);
  }

  void setSignInScreen() {
    ConfigAnalytics.setCurrentScreen(Constants.signInScreen);
  }

  Future<void> onLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    LoadingDialog.showLoadingDialog(context);
    final result = await authApi.login(
      AuthParams(
        email: email,
        password: password,
      ),
    );

    final value = switch (result) {
      Success(value: final accessToken) => accessToken,
      Failure(exception: final exception) => exception,
    };

    if (!AppValid.isNetWork(value)) {
      LoadingDialog.hideLoadingDialog(context);
      showDialogNetwork(context);
    } else if (value is FirebaseAuthException) {
      LoadingDialog.hideLoadingDialog(context);
      showOpenDialog(context);
    } else {
      LoadingDialog.hideLoadingDialog(context);
      // setEvenAnalytics(phone);
      // setSignInScreen();
      log(value.toString());
      if (value != null && value.toString().isNotEmpty) {
        await saveToken(value.toString());
        await goToHome();
      }
    }
  }
}
