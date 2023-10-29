// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../configs/configs.dart';
import '../../configs/widget/loading/loading_diaglog.dart';
import '../../presentation/routers.dart';
import '../../utils/http_remote.dart';
import 'service.dart';

class AuthParams {
  const AuthParams({
    // this.user,
    this.birthDate,
    this.firstName,
    this.lastName,
    this.middleName,
    this.password,
    this.phoneNumber,
    this.email,
    this.fullName,
  });
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final String? birthDate;
  final String? phoneNumber;
  final String? password;
  final String? email;
  final String? fullName;

  // final UserModel? user;
}

class AuthApi {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(String id, AuthParams? params) {
    return users
        .doc(id)
        .set({'email': params!.email, 'full_name': params.fullName, 'id': id})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<Result<String?, FirebaseAuthException>> register(
    AuthParams? params,
  ) async {
    try {
      try {
        final result =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: params!.email!,
          password: params.password!,
        );

        if (result.user != null) {
          await addUser(result.user!.uid, params);
          return Success(result.user!.uid);
        }
        return Failure(FirebaseAuthException(code: ''));
      } catch (e) {
        return Failure(FirebaseAuthException(code: e.toString()));
      }
    } on FirebaseAuthException catch (e) {
      return Failure(e);
    }
  }

  Future<Result<String?, FirebaseAuthException>> login(
    AuthParams? params,
  ) async {
    try {
      try {
        final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: params!.email!,
          password: params.password!,
        );

        if (result.user != null) {
          return Success(result.user!.uid);
        }
        return Failure(
            FirebaseAuthException(code: '', message: 'User is null'));
      } catch (e) {
        return Failure(FirebaseAuthException(code: e.toString()));
      }
    } on FirebaseAuthException catch (e) {
      return Failure(e);
    }
  }

  Future<Result<bool, Exception>> sendOTP(
    AuthParams? params,
    BuildContext context,
  ) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        final auth = FirebaseAuth.instance;
        await auth.verifyPhoneNumber(
          phoneNumber: '+84 ${params!.lastName!.characters}',
          verificationCompleted: (credential) {},
          verificationFailed: (e) {
            LoadingDialog.hideLoadingDialog(context);
          },
          codeSent: (verificationId, resendToken) {
            LoadingDialog.hideLoadingDialog(context);
            Navigator.pushNamed(
              context,
              Routers.verification,
              arguments: RegisterArguments(
                pass: params.password,
                verificationId: verificationId,
              ),
            );
          },
          codeAutoRetrievalTimeout: (verificationId) {},
          timeout: const Duration(seconds: 60),
        );
      }
      return const Success(true);
    } on SocketException catch (e) {
      return Failure(e);
    }
  }

  Future<Result<bool, Exception>> checkPhoneNumberExists(
    AuthParams? params,
  ) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        final data = await FirebaseFirestore.instance
            .collection('phone')
            .where('phone', isEqualTo: params!.phoneNumber)
            .get();
        final phone = data.docs.map((e) => e.data());
        if (phone.isNotEmpty) {
          return Failure(Exception(phone));
        } else {
          return const Success(true);
        }
      }
      return Failure(Exception('no phone'));
    } on SocketException catch (e) {
      return Failure(e);
    }
  }

  // Future<Result<UserModel, Exception>> category() async {
  //   try {
  //     final response = await HttpRemote.get(
  //       url: '/api/category?pageSize=10&page=1',
  //     );
  //     print('${response?.statusCode}');
  //     switch (response?.statusCode) {
  //       case 200:
  //         final data =
  //             json.encode(json.decode(response!.body)['data']['items']);
  //         final user = UserModelFactory.create(data);
  //         return Success(user);
  //       default:
  //         return Failure(Exception(response!.reasonPhrase));
  //     }
  //   } on Exception catch (e) {
  //     return Failure(e);
  //   }
  // }

  Future<Result<bool, Exception>> signUp(AuthParams? params) async {
    try {
      final response = await HttpRemote.post(
        url: '/api/auth/register',
        body: {
          // 'firstName': params!.user!.firstName,
          // 'lastName': params.user!.lastName,
          // 'middleName': '',
          // 'phone': params.user!.phone,
          // 'password': params.password
        },
      );
      print(response?.statusCode);
      switch (response?.statusCode) {
        case 201:
          return const Success(true);
        default:
          return Failure(Exception(response!.reasonPhrase));
      }
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
