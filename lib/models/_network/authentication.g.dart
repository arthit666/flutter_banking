// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authentication _$AuthenticationFromJson(Map<String, dynamic> json) =>
    Authentication(
      json['id'] as int?,
      json['access_token'] as String?,
      json['refresh_token'] as String?,
    );

Map<String, dynamic> _$AuthenticationToJson(Authentication instance) =>
    <String, dynamic>{
      'id': instance.id,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
