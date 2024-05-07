import 'package:init_app/models/_network/pocket_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_detail.g.dart';

@JsonSerializable(explicitToJson: true)
class AccountDetail {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'account_number')
  final String? accountNumber;

  @JsonKey(name: 'balance')
  final double? balance;

  @JsonKey(name: 'pocket_list')
  final List<PocketResponse>? pocketList;

  AccountDetail(
    this.id,
    this.email,
    this.accountNumber,
    this.balance,
    this.pocketList,
  );

  @override
  String toString() {
    return 'AccountDetail{id: $id, email: $email, accountNumber: $accountNumber, balance: $balance, pocketList: $pocketList}';
  }

  factory AccountDetail.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDetailToJson(this);
}
