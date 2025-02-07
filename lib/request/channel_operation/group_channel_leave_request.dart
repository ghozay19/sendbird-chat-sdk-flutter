import 'package:sendbird_sdk/request/abstract/api_request.dart';
import 'package:sendbird_sdk/services/network/http_client.dart';

class GroupChannelLeaveRequest extends ApiRequest {
  @override
  final method = Method.put;

  GroupChannelLeaveRequest({required String channelUrl, String? userId})
      : super(userId: userId) {
    url = 'group_channels/$channelUrl/leave';
  }
}
