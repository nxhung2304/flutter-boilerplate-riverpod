// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExampleParams _$ExampleParamsFromJson(Map<String, dynamic> json) =>
    _ExampleParams(
      title: json['title'] as String,
      description: json['description'] as String?,
      time: json['time'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      dueDate: json['due_date'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ExampleParamsToJson(_ExampleParams instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'time': instance.time,
      'date': instance.date?.toIso8601String(),
      'due_date': instance.dueDate,
      'category_id': instance.categoryId,
    };
