import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PayFeesPage extends StatefulWidget {
  @override
  _PayFeesPageState createState() => _PayFeesPageState();
}

class _PayFeesPageState extends State<PayFeesPage> {
  bool isPaid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pay Fees',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade700, Colors.purple.shade400],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFeeCard(),
              SizedBox(height: 20),
              _buildPaymentMethods(),
              Spacer(),
              _buildPayNowButton(),
              SizedBox(height: 10),
              _buildInvoiceButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeeCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withOpacity(0.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Fee Amount:",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "₹15,000",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.yellowAccent,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Payment Status: ",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                isPaid ? "Paid" : "Pending",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isPaid ? Colors.greenAccent : Colors.redAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethods() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Payment Method:",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _paymentOption(Icons.account_balance, "UPI"),
            _paymentOption(Icons.credit_card, "Card"),
            _paymentOption(Icons.language, "Net Banking"),
          ],
        ),
      ],
    );
  }

  Widget _paymentOption(IconData icon, String method) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [Colors.white70, Colors.white]),
          ),
          child: Icon(icon, size: 30, color: Colors.deepPurple),
        ),
        SizedBox(height: 5),
        Text(
          method,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildPayNowButton() {
    return ElevatedButton(
      onPressed:
          isPaid
              ? null
              : () {
                setState(() {
                  isPaid = true;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Payment Successful!"),
                    backgroundColor: Colors.green,
                  ),
                );
              },
      style: ElevatedButton.styleFrom(
        backgroundColor: isPaid ? Colors.grey : Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 15),
        minimumSize: Size(double.infinity, 50),
        shadowColor: Colors.black54,
        elevation: 8,
      ),
      child: Text(
        isPaid ? "Payment Completed" : "Pay Now",
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildInvoiceButton() {
    return OutlinedButton.icon(
      onPressed:
          isPaid
              ? () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Invoice Downloaded!"),
                    backgroundColor: Colors.blue,
                  ),
                );
              }
              : null,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 12),
        minimumSize: Size(double.infinity, 50),
        side: BorderSide(color: isPaid ? Colors.blue : Colors.grey),
      ),
      icon: Icon(Icons.download, color: isPaid ? Colors.blue : Colors.grey),
      label: Text(
        "Download Invoice",
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: isPaid ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}
