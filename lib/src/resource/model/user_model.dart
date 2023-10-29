// ignore_for_file: unnecessary_lambdas
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  int? id;
  String? userName;
  String? fullName;
  String? sex;
  DateTime? createdAt;
  DateTime? updateAt;
  UserModel({
    this.id,
    this.userName,
    this.fullName,
    this.createdAt,
    this.updateAt,
  });
  UserModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot["id"];
    userName = documentSnapshot['userName'];
    fullName = documentSnapshot['fullName'];
    sex = documentSnapshot['sex'];
    createdAt = documentSnapshot['createdAt'];
    updateAt = documentSnapshot['updateAt'];
  }
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    fullName = json['fullName'];
    sex = json['sex'];
    createdAt = json['createdAt'];

    updateAt = json['updateAt'];
  }
}
