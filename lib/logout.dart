import 'package:flutter/material.dart';
import 'package:my_first_app/logout.dart';

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Logout"),
      content: Text("Are you sure you want to log out?"),
      actions: [
        TextButton(
          child: Text("Cancel", style: TextStyle(color: Colors.grey)),
          onPressed: () {
            Navigator.of(context).pop(); // Dialog close
          },
        ),
        TextButton(
          child: Text("Logout", style: TextStyle(color: Colors.red)),
          onPressed: () {
            // User logout karega aur login page pe chala jayega
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/login',
              (route) => false,
            );
          },
        ),
      ],
    );
  }
}

// 🔹 Function to Show Logout Dialog
void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return LogoutPage();
    },
  );
}
