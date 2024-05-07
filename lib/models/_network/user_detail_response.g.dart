// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailReponse _$UserDetailReponseFromJson(Map<String, dynamic> json) =>
    UserDetailReponse(
      json['id'] as int?,
      json['fname'] as String?,
      json['lname'] as String?,
      json['username'] as String?,
      json['avatar'] as String?,
    );

Map<String, dynamic> _$UserDetailReponseToJson(UserDetailReponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fname': instance.fName,
      'lname': instance.lName,
      'username': instance.username,
      'avatar': instance.avatar,
    };
