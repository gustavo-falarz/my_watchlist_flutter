import 'content.dart';

class ContentDTO {
  String userId;

  Content content;

  String type;

  ContentDTO({this.userId, this.content, this.type});

  Map<String, dynamic> toJson() =>
      {'userId': userId, 'content': content.toJson(), 'type': type};
}
