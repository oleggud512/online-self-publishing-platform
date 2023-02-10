import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  factory Message({
    @JsonKey(name: "_id") @Default("") String id,
    @Default("") String content,
    required String sender,
    required DateTime createdAt,
    required DateTime updatedAt
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}