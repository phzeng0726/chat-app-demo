// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImageListDto _$$_ImageListDtoFromJson(Map<String, dynamic> json) =>
    _$_ImageListDto(
      list: (json['list'] as List<dynamic>)
          .map((e) => ImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ImageListDtoToJson(_$_ImageListDto instance) =>
    <String, dynamic>{
      'list': instance.list,
    };

_$_ImageDto _$$_ImageDtoFromJson(Map<String, dynamic> json) => _$_ImageDto(
      url: json['url'] as String,
      path: json['path'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$$_ImageDtoToJson(_$_ImageDto instance) =>
    <String, dynamic>{
      'url': instance.url,
      'path': instance.path,
      'userId': instance.userId,
    };
