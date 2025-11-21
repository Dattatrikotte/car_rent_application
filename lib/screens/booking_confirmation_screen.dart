import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/app_provider.dart';

class BookingConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final booking = provider.currentBooking!;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F8),
      appBar: AppBar(
        title: Text(
          'Booking Confirmed',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🎉 SUCCESS CARD
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black.withOpacity(0.05),
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                children: [
                  Icon(Icons.check_circle_rounded,
                      color: Colors.green, size: 80),
                  SizedBox(height: 10),
                  Text(
                    "Booking Successful!",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // 📄 BOOKING DETAILS CARD
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black.withOpacity(0.05),
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  _detailRow(Icons.person, "Name", booking.name),
                  _detailRow(Icons.directions_car, "Car", booking.car.name),
                  _detailRow(Icons.location_on, "Location", booking.location),

                  _detailRow(
                    Icons.date_range,
                    "Dates",
                    "${DateFormat.yMMMd().format(booking.startDate)} → ${DateFormat.yMMMd().format(booking.endDate)}",
                  ),

                  _detailRow(
                    Icons.price_change,
                    "Total Price",
                    "\$${booking.totalPrice.toStringAsFixed(2)}",
                  ),
                ],
              ),
            ),

            Spacer(),

            // 🔙 BACK BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  provider.clearBooking();
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Back to Home",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // 🧩 Reusable detail row widget
  Widget _detailRow(IconData icon, String title, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 26),
          SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    )),
                Text(value,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
                     