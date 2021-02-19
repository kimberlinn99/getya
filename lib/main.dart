import 'package:flutter/material.dart';
import 'package:getya/screens/chat/chat_screen.dart';
import 'package:getya/screens/deliveryStatus/delivery_status_screen.dart';
import 'package:getya/screens/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
import 'routes.dart';
import 'scroll_behavior_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GETYA',
      debugShowCheckedModeBanner: false,
      routes: routes,
      theme: themeData.copyWith(
        textTheme:
            GoogleFonts.notoSansTextTheme(Theme.of(context).textTheme).copyWith(
          headline1: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyText1: TextStyle(fontSize: 18, color: Colors.black),
          bodyText2: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: ScrollBehaviorConfiguration(),
          child: child,
        );
      },
      home: DeliveryStatusScreen(),
    );
  }
}
