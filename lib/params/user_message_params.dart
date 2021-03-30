import '../constant/enums.dart';
import '../core/message/user_message.dart';
import '../core/models/meta_array.dart';
import '../params/base_message_params.dart';

/// An object consists a set of parameters to create/update user message.
class UserMessageParams extends BaseMessageParams {
  /// Text message
  String message;

  /// The target languages that a message will be translated into
  List<String> targetLanguages;

  UserMessageParams({
    this.message,
    List<String> targetLanguages,
    String data,
    String customType,
    PushNotificationDeliveryOption pushOption,
    MentionType mentionType,
    List<String> mentionedUserIds,
    List<MessageMetaArray> metaArrays,
  })  : targetLanguages = targetLanguages ?? [],
        super(
          data: data,
          customType: customType,
          pushOption: pushOption,
          mentionType: mentionType,
          mentionedUserIds: mentionedUserIds,
          metaArrays: metaArrays,
        );

  UserMessageParams.withMessage(UserMessage userMessage, {bool deepCopy})
      : message = userMessage.message,
        targetLanguages = userMessage.translations?.keys?.toList() ?? [],
        super.withMessage(userMessage, deepCopy: deepCopy);

  Map<String, dynamic> toJson() {
    final ret = super.toJson();
    ret['message'] = message;
    ret['translation_target_langs'] = targetLanguages;
    ret.removeWhere((key, value) => value == null);
    return ret;
  }
}