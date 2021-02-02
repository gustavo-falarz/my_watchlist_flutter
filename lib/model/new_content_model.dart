import 'content_model.dart';

class NewContentModel {
  String userId;

  ContentModel content;

  String type;

  NewContentModel({this.userId, this.content, this.type});

  Map<String, dynamic> toJson() =>
      {'userId': userId, 'content': content.toJson(), 'type': type};
}
