import 'package:cloud_firestore/cloud_firestore.dart';

import '../base/base.dart';

class HomeViewModel extends BaseViewModel {
  init() {}
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String usersCollection = "users";
  final String targetCollection = "targets";
  Future<void> addTargets(
      int id,
      String body_text,
      int PriorityLevel,
      String status,
      int user_id,
      DateTime created_at,
      DateTime update_at) async {
    try {
      await _firestore
          .collection(usersCollection)
          .doc(id.toString())
          .collection(targetCollection)
          .doc(id.toString())
          .set({
        "id": id,
        "body_text": body_text,
        "PriorityLevel": PriorityLevel,
        "status": status,
        "user_id": user_id,
        "created_at": created_at,
        "update_at": update_at
      });
    } catch (e) {}
  }

  Future<void> updateTargets(
      int id,
      String body_text,
      int PriorityLevel,
      String status,
      int user_id,
      DateTime created_at,
      DateTime update_at) async {
    try {
      await _firestore
          .collection(usersCollection)
          .doc(id.toString())
          .collection(targetCollection)
          .doc(id.toString())
          .update({
        "id": id,
        "body_text": body_text,
        "PriorityLevel": PriorityLevel,
        "status": status,
        "user_id": user_id,
        "created_at": created_at,
        "update_at": update_at
      });
    } catch (e) {}
  }

  notifyListeners();
}
