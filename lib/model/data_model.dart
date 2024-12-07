class Data {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  Data({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };

  @override
  String toString() {
    return 'Data(postId: $postId, id: $id, name: $name, email: $email, body: $body)';
  }
}
