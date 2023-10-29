import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../configs/configs.dart';
import '../../configs/widget/loading/loading_diaglog.dart';
import '../../resource/service/auth.dart';
import '../../utils/app_valid.dart';
import '../base/base.dart';
import '../routers.dart';
import '../sign_in/sign_in.dart';

class SignUpViewModel extends BaseViewModel {
  AuthApi authApi = AuthApi();
  bool enableNext = false;
  String? messagePhone;
  String? messageEmail;
  String? messageFullName;
  String? messagePassword;
  String? messageConfirmPassword;
  String? phone;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  dynamic init() {}

  Future<void> goToProfileUpdate() =>
      Navigator.pushNamed(context, Routers.updateProfile, arguments: phone);

  Future<void> goToSignIn() =>
      Navigator.pushReplacementNamed(context, Routers.signIn);

  void validPhone(String? value) {
    final result = AppValid.validatePhoneNumber(value);
    if (result != null) {
      messagePhone = result;
    } else {
      messagePhone = '';
    }
    notifyListeners();
  }

  void validEmail(String? value) {
    final result = AppValid.validateEmail(value);
    if (result != null) {
      messageEmail = result;
    } else {
      messageEmail = '';
    }
    notifyListeners();
  }

  void validFullName(String? value) {
    final result = AppValid.validateFullName(value);
    if (result != null) {
      messageFullName = result;
    } else {
      messageFullName = '';
    }
    notifyListeners();
  }

  void validatePassword(String? value) {
    final result = AppValid.validatePassword(value);
    if (result != null) {
      messagePassword = result;
    } else {
      messagePassword = '';
    }
    notifyListeners();
  }

  void validatePasswordConfirm(String pass, String? confirmPass) {
    final result = AppValid.validatePasswordConfirm(pass, confirmPass);
    if (result != null) {
      messageConfirmPassword = result;
    } else {
      messageConfirmPassword = '';
    }
    notifyListeners();
  }

  void onRegister() {
    if (messageEmail == '' &&
        messageFullName == '' &&
        messagePassword == '' &&
        messageConfirmPassword == '') {
      log(enableNext.toString());
      enableNext = true;
    } else {
      enableNext = false;
    }
    notifyListeners();
  }

  dynamic showOpenDialog(_) {
    showDialog(
      context: context,
      builder: (context) {
        return WarningDialog(
          content: SignUpLanguage.existsAccount,
          image: AppImages.icPlus,
          title: SignUpLanguage.failed,
          leftButtonName: SignUpLanguage.cancel,
          color: AppColors.BLACK_500,
          colorNameLeft: AppColors.BLACK_500,
          rightButtonName: SignInLanguage.signIn,
          onTapLeft: () {
            Navigator.pop(context);
          },
          onTapRight: () {
            goToSignIn();
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

  Future<void> onSignUp() async {
    final email = emailController.text.trim();
    final fullName = fullNameController.text.trim();
    final password = passwordController.text.trim();
    LoadingDialog.showLoadingDialog(context);
    final result = await authApi.register(
      AuthParams(
        email: email,
        fullName: fullName,
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
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    }
  }

  Future<void> checkPhoneExists() async {
    LoadingDialog.showLoadingDialog(context);
    final result = await authApi.checkPhoneNumberExists(
      AuthParams(
        phoneNumber: phone,
      ),
    );

    final value = switch (result) {
      Success(value: final accessToken) => accessToken,
      Failure(exception: final exception) => exception,
    };

    if (!AppValid.isNetWork(value)) {
      LoadingDialog.hideLoadingDialog(context);
      showDialogNetwork(context);
    } else if (value is Exception) {
      LoadingDialog.hideLoadingDialog(context);
      showOpenDialog(context);
    } else {
      LoadingDialog.hideLoadingDialog(context);
      await goToProfileUpdate();
    }
  }
}
