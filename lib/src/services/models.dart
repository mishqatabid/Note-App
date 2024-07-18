import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Notes {
  Notes(
      {this.title = "",
      this.note = "",
      this.datecreated = "",
      this.noteid = "",
      this.lastupdated = "",
      this.uid = "",
      this.pfp = ""});
  String title;
  String note;
  String datecreated;
  String lastupdated;

  String noteid;

  String uid;
  String pfp;

  factory Notes.fromJson(Map<String, dynamic> json) => _$NotesFromJson(json);
  Map<String, dynamic> toJson() => _$NotesToJson(this);
}
