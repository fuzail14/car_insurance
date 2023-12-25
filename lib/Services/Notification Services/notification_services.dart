// import 'dart:convert';

// import 'package:app_settings/app_settings.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as Http;
// import 'package:userapp/Services/Shared%20Preferences/MySharedPreferences.dart';

// import '../../Constants/api_routes.dart';
// import '../../Module/HomeScreen/Model/residents.dart';
// import '../../Module/Login/Model/User.dart';
// import '../../Routes/set_routes.dart';

// class NotificationServices {
//   FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   initFlutterNotificationPlugin(RemoteMessage message) async {
//     var androidInitialization =
//         AndroidInitializationSettings("@mipmap/ic_launcher");
//     var initializeSetting =
//         InitializationSettings(android: androidInitialization);

//     await flutterLocalNotificationsPlugin.initialize(initializeSetting,
//         onDidReceiveNotificationResponse: (payload) async {
//       handleMessages(message);
//     });
//   }

//   fireBaseInit() {
//     FirebaseMessaging.onMessage.listen((message) {
//       initFlutterNotificationPlugin(message);
//       showNotificationFlutter(message);
//     });
//   }

//   Future<void> showNotificationFlutter(RemoteMessage message) async {
//     // Android Channel Initialization
//     AndroidNotificationChannel androidNotificationChannel =
//         AndroidNotificationChannel(
//       "high_importance_channel",
//       "high_importance_channel",
//       description: "smart-gate-notification",
//       importance: Importance.max,
//     );

//     AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//             androidNotificationChannel.id, androidNotificationChannel.name,
//             channelDescription: androidNotificationChannel.description,
//             importance: Importance.max,
//             priority: Priority.high,
//             ticker: 'ticker');

//     NotificationDetails notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);

//     Future.delayed(Duration.zero, () {
//       flutterLocalNotificationsPlugin.show(
//           0,
//           message.notification!.title.toString(),
//           message.notification!.body.toString(),
//           notificationDetails);
//     });
//   }

//   requestNotification() async {
//     NotificationSettings settings = await firebaseMessaging.requestPermission(
//         alert: true,
//         announcement: true,
//         badge: true,
//         sound: true,
//         carPlay: true,
//         criticalAlert: true,
//         provisional: true);
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print('permission granted');
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       print('permission denied');
//       AppSettings.openAppSettings();
//     }
//   }

//   Future<String?> getDeviceToken() async {
//     String? deviceToken = await firebaseMessaging.getToken();

//     return deviceToken;
//   }

//   refreshDeviceToken() async {
//     firebaseMessaging.onTokenRefresh.listen((event) {
//       event.toString();
//     });
//   }

//   Future<void> setupInteractMessage() async {
//     // when app is terminated
//     RemoteMessage? message =
//         await FirebaseMessaging.instance.getInitialMessage();

//     if (message != null) {
//       handleMessages(message);
//     }

//     // when app is running in background then this function is call
//     FirebaseMessaging.onMessageOpenedApp.listen((event) {
//       handleMessages(event);
//     });
//   }

//   handleMessages(RemoteMessage message) async {
//     User user = await MySharedPreferences.getUserData();

//     final Residents resident = await loginResidentDetails(
//         token: user.bearerToken!, userid: user.userId!);

//     if (message.data['type'] == 'Event') {
//       Get.toNamed(eventsscreen, arguments: [user, resident]);
//     } else if (message.data['type'] == 'Noticeboard') {
//       Get.toNamed(noticeboardscreen, arguments: [user, resident]);
//     } else if (message.data['type'] == 'PreApproveEntry') {
//       Get.toNamed(preapproveentryscreen, arguments: [user, resident]);
//     } else if (message.data['type'] == 'Report') {
//       Get.toNamed(adminreports, arguments: [user, resident]);
//     } else if (message.data['type'] == 'ReportHistory') {
//       Get.toNamed(reportshistoryscreen, arguments: [user, resident]);
//     }
//   }

//   Future<Residents> loginResidentDetails(
//       {required int userid, required String token}) async {
//     print("${userid.toString()}");
//     print(token);

//     final response = await Http.get(
//       Uri.parse(Api.loginResidentDetails + "/" + userid.toString()),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Authorization': "Bearer $token"
//       },
//     );

//     var data = jsonDecode(response.body.toString());
//     print(data);

//     var e = data['data'];

//     var societyData = data['data']['societydata'];

//     var societyId = societyData[0]['societyid'];
//     var superAdminId = societyData[0]['superadminid'];

//     print(societyId);
//     print('superAdminId $superAdminId');

//     final Residents residents = Residents(
//         id: e['id'],
//         residentid: e['residentid'],
//         subadminid: e['subadminid'],
//         username: e['username'],
//         superadminid: superAdminId,
//         societyid: societyId,
//         country: e["country"],
//         state: e["state"],
//         city: e["city"],
//         houseaddress: e["houseaddress"],
//         vechileno: e["vechileno"],
//         residenttype: e["residenttype"],
//         propertytype: e["propertytype"],
//         committeemember: e["committeemember"],
//         status: e["status"],
//         createdAt: e["createdAt"],
//         updatedAt: e["updatedAt"]);

//     if (response.statusCode == 200) {
//       return residents;
//     }

//     return residents;
//   }
// }
