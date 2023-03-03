import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:module_notification/home/home.dart';


//void main() => runApp( const SplashTransition());

Future<void> main() async {
  await dotenv.load(
    fileName: '.env.uat'
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage();
  runApp(const HomePage());
}
