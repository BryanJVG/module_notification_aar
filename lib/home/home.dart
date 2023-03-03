import 'package:flutter/material.dart';
import 'package:module_notification/home/widgets/tab_bar.dart';
import '../assets/static_values.dart';
import 'widgets/body.dart';
import 'widgets/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: "Twitter Layout",
      home: Scaffold(
        appBar: Header(
          userModel: user,
        ),
        body: const Body(),
        bottomNavigationBar: const TabsHome(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
