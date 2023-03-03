import 'package:client/src/features/profile/domain/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  factory Message({
    @JsonKey(name: "_id") @Default("") String id,
    @Default("") String content,
    required Profile from,
    required String to,
    required DateTime createdAt,
    required DateTime updatedAt
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}

messageListFromJson(List<dynamic> list) {
  return list.map((m) => Message.fromJson(m as Map<String, dynamic>))
    .toList();
}