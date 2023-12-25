// import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
//
// import '../../Constants/pusher_constants.dart';
//
// class PusherServices {
//   PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
//
//   pusherInit() async {
//     await pusher.init(
//         apiKey: API_KEY,
//         cluster: API_CLUSTER,
//         onEvent: onEvent,
//         onSubscriptionSucceeded: onSubscriptionSucceeded,
//         onSubscriptionError: onSubscriptionError,
//         onDecryptionFailure: onDecryptionFailure
//
//         // authParams: {
//         // 'params': { 'foo': 'bar' },
//         // 'headers': { 'baz': 'boo' }
//         // }
//         );
//
//     final myChannel = await pusher.subscribe(
//         channelName: "my-channel",
//         onEvent: (event) {
//           print("Got channel event: $event");
//         });
//     await pusher.connect();
//
//     var event = PusherEvent(channelName: 'my-channel', eventName: 'my-event');
//     myChannel.trigger(event);
//   }
//
//   void onEvent(PusherEvent event) {
//     print("onEvent: $event");
//
//   }
//
//
//   static void onSubscriptionSucceeded(String channelName, dynamic data) {
//     print("onSubscriptionSucceeded: $channelName data: $data");
//   }
//
//   static void onSubscriptionError(String message, dynamic e) {
//     print("onSubscriptionError: $message Exception: $e");
//   }
//
//   static void onDecryptionFailure(String event, String reason) {
//     print("onDecryptionFailure: $event reason: $reason");
//   }
// }
