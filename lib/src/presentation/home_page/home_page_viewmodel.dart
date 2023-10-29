// ignore_for_file: cast_nullable_to_non_nullable

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../configs/app_result/app_result.dart';
import '../../resource/model/targets_model.dart';
import '../../utils/utils.dart';
import '../base/base.dart';
import '../routers.dart';

class HomePageViewModel extends BaseViewModel {
  List<TargetsModel> targets = [];
  Future<void> init() async {
    await fetchData();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String usersCollection = 'users';
  final String targetCollection = 'targets';
  //Limit Text (...)
  Future<String?> getIdUser() async {
    return await AppPref.getToken();
  }

  Future<void> goToSignIn(BuildContext context) =>
      Navigator.pushReplacementNamed(context, Routers.signIn);

  Future<void> fetchData() async {
    final userId = await getIdUser();
    final result = await FirebaseFirestore.instance
        .collection('targets')
        .where('userId', isEqualTo: userId)
        .get();
    if (result.docs.isNotEmpty) {
      final List<DocumentSnapshot> documents = result.docs;
      for (var document in documents) {
        // final data = document.data() as TargetsModel;
        // targets.add(data);
        targets = result.docs.map((document) {
          final data = document.data() as Map<String, dynamic>;
          return TargetsModel.fromJson(
            data,
          ); // Sử dụng hàm chuyển đổi JSON nếu có
        }).toList();
      }
    } else {
      log(result.toString());
    }
    notifyListeners();
  }

  String limitText(String text, int limit) {
    List<String> words = text.split(' ');
    if (words.length > limit) {
      words = words.sublist(0, limit);
      return words.join(' ') + '...';
    }
    return text;
  }

  Future<void> goToDetailsCard(context, dynamic data) => Navigator.pushNamed(
        context,
        Routers.cardEditor,
        arguments: TargetArguments(targets: data),
      );
  Future<void> addTargets(
    int id,
    String content,
    int priorityLevel,
    String status,
    DateTime createdAt,
    DateTime updateAt,
  ) async {
    final userId = await getIdUser();

    try {
      await _firestore
          .collection(usersCollection)
          .doc(id.toString())
          .collection(targetCollection)
          .doc(id.toString())
          .set({
        'id': id,
        'content': content,
        'priorityLevel': priorityLevel,
        'status': status,
        'userID': userId,
        'createdAt': createdAt,
        'updateAt': updateAt
      });
    } catch (e) {}
  }

  Future<void> updateTargets(int id, String content, int priorityLevel,
      String status, int userID, DateTime createdAt, DateTime updateAt) async {
    try {
      await _firestore
          .collection(usersCollection)
          .doc(id.toString())
          .collection(targetCollection)
          .doc(id.toString())
          .update({
        'id': id,
        'content': content,
        'priorityLevel': priorityLevel,
        'status': status,
        'userID': userID,
        'createdAt': createdAt,
        'updateAt': updateAt
      });
    } catch (e) {}
  }

  Future<void> deleteTargets(int id, String bodyText, int priorityLevel,
      String status, int userId, DateTime createdAt, DateTime updateAt) async {
    try {
      await _firestore
          .collection(usersCollection)
          .doc(id.toString())
          .collection(targetCollection)
          .doc(id.toString())
          .delete();
    } catch (e) {}
  }

  void getUserIdFromUsersCollection() {
    FirebaseFirestore.instance.collection('users').get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        final String userId = doc.id;

        // Gọi hàm để hiển thị các targets liên quan đến user
        showTargetsForUser(userId);
      });
    }).catchError((e) {
      print('Error fetching users: $e');
    });
  }

  void showTargetsForUser(String userId) {
    FirebaseFirestore.instance
        .collection('targets')
        .where('userId', isEqualTo: userId)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        // Lấy dữ liệu từ collection Targets
        String titleName = doc.data()['title'];
        // Hiển thị thông tin từ Targets
      });
    }).catchError((e) {
      print('Error fetching Targets: $e');
    });
  }

  notifyListeners();
}
