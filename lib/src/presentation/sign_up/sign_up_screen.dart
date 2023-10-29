import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../configs/configs.dart';
import '../../configs/constants/app_space.dart';
import '../base/base.dart';
import '../sign_in/sign_in.dart';
import 'dialog.dart';
import 'sign_up.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static String verify = '';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpViewModel? _viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SignUpViewModel>(
      viewModel: SignUpViewModel(),
      onViewModelReady: (viewModel) => _viewModel = viewModel?..init(),
      builder: (context, viewModel, child) {
        return buildSignIn();
      },
    );
  }

  Widget buildRegister() {
    return CustomerAppBar(
      title: SignUpLanguage.signUp,
      onTap: () async {
        Navigator.pop(context);
      },
    );
  }

  Widget buildWelComeBack() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeToPadding.sizeMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Paragraph(
            content: SignUpLanguage.welcomeBack,
            style: STYLE_MEDIUM,
          ),
          SizedBox(height: SizeToPadding.sizeVerySmall),
          Paragraph(
            content: SignUpLanguage.pleaseSignUp,
            style: STYLE_MEDIUM,
          ),
        ],
      ),
    );
  }

  Widget buildEmail() {
    return AppFormField(
      labelText: SignUpLanguage.email,
      hintText: SignUpLanguage.enterEmail,
      // keyboardType: TextInputType.phone,
      textEditingController: _viewModel!.emailController,
      onChanged: (value) {
        // _viewModel!.phone = value;
        _viewModel!
          ..validEmail(value)
          ..onRegister();
      },
      validator: _viewModel!.messageEmail ?? '',
    );
  }

  Widget buildFullName() {
    return AppFormField(
      labelText: SignUpLanguage.fullName,
      hintText: SignUpLanguage.enterFullName,
      // keyboardType: TextInputType.phone,
      textEditingController: _viewModel!.fullNameController,
      onChanged: (value) {
        // _viewModel!.phone = value;
        _viewModel!
          ..validFullName(value)
          ..onRegister();
      },
      validator: _viewModel!.messageFullName ?? '',
    );
  }

  Widget buildGender() {
    return AppFormField(
      labelText: SignUpLanguage.gender,
      // keyboardType: TextInputType.phone,
      onChanged: (value) {
        _viewModel!.phone = value;
        _viewModel!
          ..validFullName(value)
          ..onRegister();
      },
      validator: _viewModel!.messagePhone ?? '',
    );
  }

  Widget buildPassword() {
    return AppFormField(
      labelText: SignUpLanguage.password,
      hintText: SignUpLanguage.enterPassword,
      obscureText: true,
      textEditingController: _viewModel!.passwordController,
      onChanged: (value) {
        // _viewModel!.phone = value;
        _viewModel!
          ..validatePassword(value)
          ..onRegister();
      },
      validator: _viewModel!.messagePassword ?? '',
    );
  }

  Widget buildPasswordConfirm() {
    return AppFormField(
      labelText: SignUpLanguage.confirmPasword,
      hintText: SignUpLanguage.enterConfirmPass,
      obscureText: true,
      // textEditingController: confirmPassword,
      textEditingController: _viewModel!.confirmPasswordController,
      onChanged: (confirmPass) {
        _viewModel!
          ..validatePasswordConfirm(
              _viewModel!.passwordController.text, confirmPass.trim())
          ..onRegister();
      },
      validator: _viewModel!.messageConfirmPassword ?? '',
    );
  }

  // Future<bool> createUserWithEmailAndPassword() async {
  //   try {
  //     final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email.text,
  //       password: password.text,
  //     );
  //     if (result.user != null) {
  //       return true;
  //     }
  //     return false;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  Widget buildButtonSignIn() {
    return Padding(
      padding: EdgeInsets.only(top: SizeToPadding.sizeVerySmall),
      child: AppButton(
        enableButton: _viewModel!.enableNext,
        content: SignUpLanguage.register,
        onTap: () async {
          await _viewModel!.onSignUp();
        },
      ),
    );
  }

  Widget buildSignIn() {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeToPadding.sizeLarge,
              vertical: SizeToPadding.sizeMedium,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildRegister(),
                buildWelComeBack(),
                buildEmail(),
                buildFullName(),
                // buildGender(),
                buildPassword(),
                buildPasswordConfirm(),
                buildButtonSignIn()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
