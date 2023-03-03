import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../utilities/notification.dart';

class NotificationListenerProvider {
  void getMessage(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      RemoteNotification? notification = event.notification;
      AndroidNotification? androidNotification = event.notification?.android;

      if (notification != null && androidNotification != null) {
        ///Show local notification
        showNotification(
            title: notification.title,
            body: notification.body,
            notificationId: notification.hashCode);
      }
    });
  }
}
