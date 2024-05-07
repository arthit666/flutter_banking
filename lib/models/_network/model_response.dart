import 'package:json_annotation/json_annotation.dart';
part 'model_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ModelResponse {
  @JsonKey(name: 'id')
  final int? id;

  ModelResponse(this.id);

  @override
  String toString() {
    return 'ModelResponse{id: $id}';
  }

  factory ModelResponse.fromJson(Map<String, dynamic> json) =>
      _$ModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ModelResponseToJson(this);
}
