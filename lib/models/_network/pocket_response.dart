import 'package:json_annotation/json_annotation.dart';

part 'pocket_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PocketResponse {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'balance')
  final double? balance;

  @JsonKey(name: 'title')
  final String? title;

  PocketResponse(
    this.id,
    this.balance,
    this.title,
  );

  @override
  String toString() {
    return 'PocketResponse{id: $id, balance: $balance, title: $title}';
  }

  factory PocketResponse.fromJson(Map<String, dynamic> json) =>
      _$PocketResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PocketResponseToJson(this);
}
