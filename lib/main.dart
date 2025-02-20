import 'package:flutter/material.dart';
import 'package:my_first_app/view_notification.dart';
import 'dashboard.dart';
import 'pay_fees_page.dart';
import 'loginscreen.dart';
import 'sign_up.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/signup', // Default Signup Page
      routes: {
        '/signup': (context) => SignUpPage(),
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/': (context) => DashboardPage(),
        '/pay-fees': (context) => PayFeesPage(),
        '/view_notification': (context) => ViewNotificationsPage(),
      },
    ),
  );
}
