// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notes _$NotesFromJson(Map<String, dynamic> json) => Notes(
      title: json['title'] as String? ?? "",
      note: json['note'] as String? ?? "",
      datecreated: json['datecreated'] as String? ?? "",
      noteid: json['noteid'] as String? ?? "",
      lastupdated: json['lastupdated'] as String? ?? "",
      uid: json['uid'] as String? ?? "",
      pfp: json['pfp'] as String? ?? "",
    );

Map<String, dynamic> _$NotesToJson(Notes instance) => <String, dynamic>{
      'title': instance.title,
      'note': instance.note,
      'datecreated': instance.datecreated,
      'lastupdated': instance.lastupdated,
      'noteid': instance.noteid,
      'uid': instance.uid,
      'pfp': instance.pfp,
    };
