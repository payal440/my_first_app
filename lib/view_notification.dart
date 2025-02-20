import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_first_app/view_notification.dart';

class ViewNotificationsPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {"date": "19 Feb 2025", "message": "Your fee payment is due soon!"},
    {"date": "18 Feb 2025", "message": "New bus schedule updated."},
    {"date": "17 Feb 2025", "message": "Upcoming college fest details."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return SlideNotificationCard(
            title: notifications[index]["message"]!,
            date: notifications[index]["date"]!,
          );
        },
      ),
    );
  }
}

// 🔹 Custom Notification Card with Slide to Delete Feature
class SlideNotificationCard extends StatelessWidget {
  final String title;
  final String date;

  SlideNotificationCard({required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              // TODO: Implement delete action (if needed)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Notification dismissed!")),
              );
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: "Dismiss",
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.deepPurpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.notifications, color: Colors.white, size: 28),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    date,
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
