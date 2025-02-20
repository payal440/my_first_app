import 'package:flutter/material.dart';
import 'package:my_first_app/view_Attendance.dart';

class ViewAttendancePage extends StatelessWidget {
  final List<Map<String, String>> attendanceRecords = [
    {"date": "19 Feb 2025", "status": "Present"},
    {"date": "18 Feb 2025", "status": "Absent"},
    {"date": "17 Feb 2025", "status": "Present"},
    {"date": "16 Feb 2025", "status": "Present"},
    {"date": "15 Feb 2025", "status": "Absent"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Attendance Records",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: attendanceRecords.length,
        itemBuilder: (context, index) {
          return AttendanceCard(
            date: attendanceRecords[index]["date"]!,
            status: attendanceRecords[index]["status"]!,
          );
        },
      ),
    );
  }
}

// 🔹 Custom Card for Attendance Display
class AttendanceCard extends StatelessWidget {
  final String date;
  final String status;

  AttendanceCard({required this.date, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: status == "Present" ? Colors.green[100] : Colors.red[100],
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
        ],
      ),
      child: ListTile(
        leading: Icon(
          status == "Present" ? Icons.check_circle : Icons.cancel,
          color: status == "Present" ? Colors.green : Colors.red,
          size: 28,
        ),
        title: Text(
          date,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "Status: $status",
          style: TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ),
    );
  }
}
