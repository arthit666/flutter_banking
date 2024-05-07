// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pocket_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PocketResponse _$PocketResponseFromJson(Map<String, dynamic> json) =>
    PocketResponse(
      json['id'] as int?,
      (json['balance'] as num?)?.toDouble(),
      json['title'] as String?,
    );

Map<String, dynamic> _$PocketResponseToJson(PocketResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
      'title': instance.title,
    };
