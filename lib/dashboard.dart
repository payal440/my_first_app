import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Campus Bus App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: dashboardItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            return DashboardCard(item: dashboardItems[index]);
          },
        ),
      ),
    );
  }
}

// 🔹 Dashboard Items Data
final List<DashboardItem> dashboardItems = [
  DashboardItem("Manage Attendance", Icons.camera_alt, [
    Colors.blue,
    Colors.lightBlueAccent,
  ], '/attendance'),
  DashboardItem("View Attendance", Icons.calendar_today, [
    Colors.green,
    Colors.lightGreenAccent,
  ], '/view-attendance'),
  DashboardItem("Pay Fees", Icons.payment, [
    Colors.orange,
    Colors.deepOrangeAccent,
  ], '/pay-fees'),
  DashboardItem("Notifications", Icons.notifications, [
    Colors.red,
    Colors.pinkAccent,
  ], '/view-notifications'),
  DashboardItem("Help & Support", Icons.support, [
    Colors.purple,
    Colors.deepPurpleAccent,
  ], '/help-support'),
  DashboardItem("Logout", Icons.logout, [Colors.black, Colors.grey], '/logout'),
];

// 🔹 Dashboard Item Model
class DashboardItem {
  final String title;
  final IconData icon;
  final List<Color> gradientColors;
  final String route;

  DashboardItem(this.title, this.icon, this.gradientColors, this.route);
}

// 🔹 Smart Dashboard Card Design
class DashboardCard extends StatefulWidget {
  final DashboardItem item;

  DashboardCard({required this.item});

  @override
  _DashboardCardState createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isTapped = true),
      onTapUp: (_) => setState(() => isTapped = false),
      onTap: () {
        if (widget.item.route == '/pay-fees') {
          // ✅ Pay Fees button click karein to '/pay-fees' page open ho
          Navigator.pushNamed(context, widget.item.route);
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: widget.item.gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: widget.item.gradientColors[0].withOpacity(
                isTapped ? 0.3 : 0.6,
              ),
              blurRadius: isTapped ? 5 : 12,
              spreadRadius: isTapped ? 1 : 3,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.item.icon, size: 50, color: Colors.white),
            SizedBox(height: 12),
            Text(
              widget.item.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
