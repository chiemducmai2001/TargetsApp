import 'package:cloud_firestore/cloud_firestore.dart';

import '../../resource/model/targets_model.dart';
import '../base/base.dart';
import 'package:firebase_database/firebase_database.dart';



class AddNoteViewModel extends BaseViewModel {
  init() {}
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String usersCollection = "users";
  final String targetCollection = "targets";

  Future<void> addTargets(
    int? id,
    String? title,
    String? content,
    int? priorityLevel,
    String? status,
    String? userId,
    DateTime? createdAt,
    DateTime? updateAt,
  ) async {
    final timeSent = DateTime.now();
    try {
      await _firestore
          .collection(usersCollection)
          .doc(id.toString())
          .collection(targetCollection)
          .doc(id.toString())
          .set({
        "id": id,
        "title": title,
        "content": content,
        "priorityLevel": priorityLevel,
        "status": status,
        "userId": userId,
        "createdAt": createdAt,
        "updateAt": updateAt
      });
    } catch (e) {
      print("User Added");
    }
  }

  Future<void> updateTargets(
    int? id,
    String? title,
    String? content,
    String? status,
    String? userId,
  ) async {
    try {
      await _firestore
          .collection(usersCollection)
          .doc(id.toString())
          .collection(targetCollection)
          .doc(id.toString())
          .update({
        "id": id,
        "title": title,
        "content": content,
        "status": status,
        "userId": userId,
      });
    } catch (e) {}
  }

  Future<void> deleteTargets(
    int? id,
    String? title,
    String? content,
    int? priorityLevel,
    String? status,
    String? userId,
    DateTime? createdAt,
    DateTime? updateAt,
  ) async {
    try {
      await _firestore
          .collection(usersCollection)
          .doc(id.toString())
          .collection(targetCollection)
          .doc(id.toString())
          .delete();
    } catch (e) {}
  }

  notifyListeners();
}
