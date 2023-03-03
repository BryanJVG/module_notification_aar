import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:module_notification/home/home.dart';

//void main() => runApp(const MyApp());

Future<void> main() async {
  //imageCache.clear();
  //await dotenv.load(fileName: '.env.prod');
  const envFile=  String.fromEnvironment("ENV", defaultValue: ".env.dev");
  await dotenv.load(fileName: envFile);
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HomePage());
}
