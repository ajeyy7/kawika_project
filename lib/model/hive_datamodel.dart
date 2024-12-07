import 'package:hive/hive.dart';
part 'hive_datamodel.g.dart';

@HiveType(typeId: 0)
class HiveData extends HiveObject {
  @HiveField(0)
  int? postId;
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String? body;

  HiveData({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });
  factory HiveData.fromJson(Map<String, dynamic> json) => HiveData(
      postId: json['postId'],
      body: json['body'],
      email: json['email'],
      id: json['id'],
      name: json['name']);

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
