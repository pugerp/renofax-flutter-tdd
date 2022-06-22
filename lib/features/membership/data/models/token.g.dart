// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      json['refresh'] as String,
      json['access'] as String,
      json['obtain'] as String,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'refresh': instance.refresh,
      'access': instance.access,
      'obtain': instance.obtain,
    };
