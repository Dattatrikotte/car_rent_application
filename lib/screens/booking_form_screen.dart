import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../models/booking.dart';
import '../providers/app_provider.dart';
import 'booking_confirmation_screen.dart';

class BookingFormScreen extends StatefulWidget {
  @override
  _BookingFormScreenState createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends State<BookingFormScreen> {
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;

  void _pickStartDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    setState(() => _startDate = picked);
  }

  void _pickEndDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: _startDate ?? DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    setState(() => _endDate = picked);
  }

  void _confirmBooking() {
    if (_nameController.text.isNotEmpty &&
        _locationController.text.isNotEmpty &&
        _startDate != null &&
        _endDate != null) {
      final provider = Provider.of<AppProvider>(context, listen: false);
      final booking = Booking(
        name: _nameController.text,
        startDate: _startDate!,
        endDate: _endDate!,
        location: _locationController.text,
        car: provider.selectedCar!,
      );
      provider.createBooking(booking);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => BookingConfirmationScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F6),
      appBar: AppBar(
        title: Text(
          "Booking Form",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),

          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 5),
                )
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ---------- NAME FIELD ----------
                Text("Full Name",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                SizedBox(height: 5),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    hintText: "Enter your name",
                  ),
                ),

                SizedBox(height: 20),

                // ---------- LOCATION FIELD ----------
                Text("Location",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                SizedBox(height: 5),
                TextField(
                  controller: _locationController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    hintText: "Enter pickup location",
                  ),
                ),

                SizedBox(height: 20),

                // ---------- START DATE ----------
                Text(
                  "Start Date",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8),

                GestureDetector(
                  onTap: _pickStartDate,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _startDate == null
                              ? "Select start date"
                              : DateFormat.yMMMd().format(_startDate!),
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(Icons.calendar_month)
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // ---------- END DATE ----------
                Text(
                  "End Date",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8),

                GestureDetector(
                  onTap: _pickEndDate,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _endDate == null
                              ? "Select end date"
                              : DateFormat.yMMMd().format(_endDate!),
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(Icons.calendar_month)
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30),

                // ---------- BUTTON ----------
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _confirmBooking,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      backgroundColor: Colors.blueAccent,
                      elevation: 5,
                    ),
                    child: Text(
                      "Confirm Booking",
                      style: TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
