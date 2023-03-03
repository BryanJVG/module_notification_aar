import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void showNotification({
  required String? title,
  required String? body,
  required int notificationId,
  String channelId = 'high_channel',
  String channelTitle = 'High Importance Notification',
  String channelDescription = 'This channel is for important notification',
  Importance notificationImportance = Importance.max,
  String iconRoute = '@mipmap/notification_icon',
}) async {
  //Create the channel on the device (if a channel with an id already exists, it will be updated
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  //This doesnt work for remote notification from FIREBASE, for that icon are defined in manifest (android case)
  AndroidInitializationSettings settingsA =
      AndroidInitializationSettings(iconRoute);
  //If you handler ios enviroment need to create initializationsettings and send below
  InitializationSettings initializationSettings = InitializationSettings(
    android: settingsA,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  //Create a new AndroidNotificationChannel instance
  AndroidNotificationChannel channel = AndroidNotificationChannel(
    channelId, 
    channelTitle, 
    description: channelDescription,
    importance: notificationImportance,
  );

  //Show notification on app bar
  flutterLocalNotificationsPlugin.show(
    notificationId,
    title,
    body,
    NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
      ),
    ),
  );
}
