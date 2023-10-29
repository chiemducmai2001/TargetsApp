import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../configs/configs.dart';
import '../../configs/constants/app_space.dart';
import '../base/base.dart';
import '../home_page/home_page.dart';
import '../sign_up/dialog.dart';
import 'sign_in.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  SignInViewModel? _viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SignInViewModel>(
      viewModel: SignInViewModel(),
      onViewModelReady: (viewModel) => _viewModel = viewModel?..init(),
      builder: (context, viewModel, child) {
        return buildSignIn();
      },
    );
  }

  Widget buildLogin() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70),
      child: Paragraph(
        content: SignInLanguage.signIn,
        style: STYLE_BIG.copyWith(fontWeight: FontWeight.w500, fontSize: 25),
      ),
    );
  }

  Widget buildFieldEmail() {
    return AppFormField(
      labelText: SignInLanguage.email,
      hintText: SignInLanguage.enterEmail,
      // keyboardType: TextInputType.phone,
      textEditingController: _viewModel!.emailController,
      onChanged: (value) {
        _viewModel!
          ..validEmail(value)
          ..onSignIn();
      },
      validator: _viewModel!.messageEmail ?? '',
    );
  }

  Widget buildFieldPass() {
    return AppFormField(
      labelText: SignInLanguage.password,
      hintText: SignInLanguage.enterPassword,
      textEditingController: _viewModel!.passwordController,
      obscureText: true,
      onChanged: (value) {
        _viewModel!
          ..validatePassword(value)
          ..onSignIn();
      },
      validator: _viewModel!.messagePassword ?? '',
    );
  }

  Widget buildForgotPass() {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeToPadding.sizeSmall),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Paragraph(
              textAlign: TextAlign.end,
              content: SignInLanguage.forgotPass,
              style: STYLE_MEDIUM.copyWith(
                color: AppColors.PRIMARY_PINK,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOnSignIn() {
    return AppButton(
      enableButton: _viewModel!.enableSignIn,
      content: SignInLanguage.signIn,
      onTap: () async {
        await _viewModel!.onLogin();
      },
    );
  }

  Widget buildNote() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeToPadding.sizeLarge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Paragraph(
            content: SignInLanguage.contentNotAccount,
            style: STYLE_MEDIUM,
          ),
          SizedBox(width: SpaceBox.sizeSmall),
          InkWell(
            onTap: () {
              _viewModel!.goToSignUp();
            },
            child: Paragraph(
              content: SignInLanguage.nowSignUp,
              style: STYLE_MEDIUM.copyWith(
                color: AppColors.PRIMARY_PINK,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildSignIn() {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeToPadding.sizeLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildLogin(),
                  buildFieldEmail(),
                  buildFieldPass(),
                  buildForgotPass(),
                  buildOnSignIn(),
                  buildNote(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
