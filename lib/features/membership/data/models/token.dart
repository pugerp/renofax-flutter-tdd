import 'package:json_annotation/json_annotation.dart';
import 'package:renofax/features/membership/domain/entities/token_entity.dart';

part 'token.g.dart';

@JsonSerializable()
class Token extends TokenEntity {
  Token(
    String refresh,
    String access,
    String obtain,
  ) : super(
          refresh,
          access,
          obtain,
        );

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
  Map<String, dynamic> toJson() => _$TokenToJson(this);

// @JsonKey(name: 'refresh')
// final String refresh;
// @JsonKey(name: 'access')
// final String access;
// @JsonKey(name: 'obtain')
// final String obtain;
//
// Token({
//   required this.refresh,
//   required this.access,
//   required this.obtain,
// });
//
// factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
// Map<String, dynamic> toJson() => _$TokenToJson(this);
}
