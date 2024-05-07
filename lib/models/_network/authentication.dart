import 'package:json_annotation/json_annotation.dart';

part 'authentication.g.dart';

@JsonSerializable(explicitToJson: true)
class Authentication {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'access_token')
  final String? accessToken;

  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  Authentication(
    this.id,
    this.accessToken,
    this.refreshToken,
  );

  @override
  String toString() {
    return 'Authentication{id: $id, accessToken: $accessToken, refreshToken: $refreshToken}';
  }

  factory Authentication.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationToJson(this);
}
