// ignore_for_file: unnecessary_lambdas
import 'package:cloud_firestore/cloud_firestore.dart';

class TargetsModel {
  int? id;
  String? title;
  String? content;
  int? priorityLevel;
  String? status;
  String? userId;
  DateTime? createdAt;
  DateTime? updateAt;
  TargetsModel(
      {this.id,
      this.title,
      this.content,
      this.priorityLevel,
      this.status,
      this.userId,
      this.createdAt,
      this.updateAt});
  TargetsModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot["id"];
    title = documentSnapshot['title'];
    content = documentSnapshot['content'];
    priorityLevel = documentSnapshot['priorityLevel'];
    status = documentSnapshot['status'];
    userId = documentSnapshot['userId'];
    createdAt = documentSnapshot['createdAt'];
    updateAt = documentSnapshot['updateAt'];
  }
  TargetsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    priorityLevel = json['priorityLevel'];
    status = json['status'];
    userId = json['userId'];
    // createdAt = json['createdAt'];
    // updateAt = json['updateAt'];
  }
}

// abstract class UserModelFactory {
//   static List<TargetsModel> createList(String jsonString) {
//     final rawModels = jsonDecode(jsonString) as List;
//     final models = rawModels
//         .map((rawModel) => UserModelFactory._fromJson(rawModel))
//         .toList();
//     return models;
//   }

//   static TargetsModel create(String jsonString) {
//     final jsonMap = jsonDecode(jsonString);
//     final targetsModel = _fromJson(jsonMap);
//     return targetsModel;
//   }

//   static String toJson(TargetsModel model) {
//     final data = _toMap(model);
//     return json.encode(data);
//   }

//   static Map<String, dynamic> _toMap(
//     TargetsModel targetsModel,
//   ) {
//     final data = <String, dynamic>{};
//     data['body_text'] = targetsModel.body_text;
//     data['PriorityLevel'] = targetsModel.PriorityLevel;
//     data['status'] = targetsModel.status;
//     data['user_id'] = targetsModel.user_id;
//     data['created_at'] = targetsModel.created_at;
//     data['update_at'] = targetsModel.update_at;

//     return data;
//   }

//   static TargetsModel _fromJson(Map<String, dynamic> json) {
//     final targetsModel = TargetsModel()
//       ..body_text = json['body_text']
//       ..PriorityLevel = json['PriorityLevel']
//       ..status = json['status']
//       ..user_id = json['user_id']
//       ..created_at = json['create_at']
//       ..update_at = json['update_at'];
//     return targetsModel;
//   }
// }
