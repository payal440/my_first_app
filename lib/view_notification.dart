import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewNotificationsPage extends StatefulWidget {
  @override
  _ViewNotificationsPageState createState() => _ViewNotificationsPageState();
}

class _ViewNotificationsPageState extends State<ViewNotificationsPage> {
  List<Map<String, String>> notifications = [
    {"date": "Feb 19, 2025", "message": "Your bus fee payment is due soon."},
    {"date": "Feb 18, 2025", "message": "Face scan attendance updated."},
    {"date": "Feb 17, 2025", "message": "New route added for Bus No. 5."},
    {"date": "Feb 16, 2025", "message": "College trip scheduled on Feb 25."},
  ];

  Future<void> _refreshNotifications() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate fetching new data
    setState(() {
      notifications.insert(0, {
        "date": "Feb 19, 2025",
        "message": "New notification added dynamically!",
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshNotifications,
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return _buildNotificationCard(notifications[index]);
          },
        ),
      ),
    );
  }

  Widget _buildNotificationCard(Map<String, String> notification) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple.shade100,
          child: Icon(Icons.notifications, color: Colors.deepPurple),
        ),
        title: Text(
          notification["message"]!,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          notification["date"]!,
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[700]),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
      ),
    );
  }
}
