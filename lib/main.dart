import 'package:flutter/material.dart';
import 'package:my_first_app/view_notification.dart';
import 'dashboard.dart';
import 'pay_fees_page.dart';
import 'loginscreen.dart';
import 'sign_up.dart';
import 'package:my_first_app/View_Attendance.dart';
import 'package:my_first_app/help.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/signup', // Default Signup Page
      routes: {
        '/signup': (context) => SignUpPage(),
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/pay-fees': (context) => PayFeesPage(),
        '/view-notifications':(context) => ViewNotificationsPage(), // Add route
        '/view-attendance': (context) => ViewAttendancePage(),
        '/help-support': (context) => HelpSupportPage(),
      },
    ),
  );
}
