// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatMessageListDto _$$_ChatMessageListDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ChatMessageListDto(
      list: (json['list'] as List<dynamic>)
          .map((e) => ChatMessageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChatMessageListDtoToJson(
        _$_ChatMessageListDto instance) =>
    <String, dynamic>{
      'list': instance.list,
    };

_$_ChatMessageDto _$$_ChatMessageDtoFromJson(Map<String, dynamic> json) =>
    _$_ChatMessageDto(
      fromId: json['fromId'] as String,
      toId: json['toId'] as String,
      content: json['content'] as String,
      createdTimeStamp: json['createdTimeStamp'] as int,
      type: json['type'] as int,
    );

Map<String, dynamic> _$$_ChatMessageDtoToJson(_$_ChatMessageDto instance) =>
    <String, dynamic>{
      'fromId': instance.fromId,
      'toId': instance.toId,
      'content': instance.content,
      'createdTimeStamp': instance.createdTimeStamp,
      'type': instance.type,
    };
