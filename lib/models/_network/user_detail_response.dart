import 'package:json_annotation/json_annotation.dart';
part 'user_detail_response.g.dart';

@JsonSerializable(explicitToJson: true)
class UserDetailReponse {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'fname')
  final String? fName;

  @JsonKey(name: 'lname')
  final String? lName;

  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'avatar')
  final String? avatar;

  UserDetailReponse(
    this.id,
    this.fName,
    this.lName,
    this.username,
    this.avatar,
  );

  @override
  String toString() {
    return 'UserDetailReponse{id: $id, fName: $fName, lName: $lName, username: $username, avatar: $avatar}';
  }

  factory UserDetailReponse.fromJson(Map<String, dynamic> json) =>
      _$UserDetailReponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailReponseToJson(this);
}
