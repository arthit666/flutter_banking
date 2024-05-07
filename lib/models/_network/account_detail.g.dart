// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDetail _$AccountDetailFromJson(Map<String, dynamic> json) =>
    AccountDetail(
      json['id'] as int?,
      json['email'] as String?,
      json['account_number'] as String?,
      (json['balance'] as num?)?.toDouble(),
      (json['pocket_list'] as List<dynamic>?)
          ?.map((e) => PocketResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountDetailToJson(AccountDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'account_number': instance.accountNumber,
      'balance': instance.balance,
      'pocket_list': instance.pocketList?.map((e) => e.toJson()).toList(),
    };
