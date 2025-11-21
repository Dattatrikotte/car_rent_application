import 'package:flutter/material.dart';
import '../mock_data/mock_cars.dart';
import '../models/car.dart';
import 'car_detail_screen.dart';

class CarListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F6),
      appBar: AppBar(
        title: Text(
          'Available Cars',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),

      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: mockCars.length,
        itemBuilder: (context, index) {
          Car car = mockCars[index];

          return GestureDetector(
            onTap: () {
              if (car.isAvailable) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CarDetailScreen(car: car)),
                );
              }
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Row(
                children: [
                  // Car Image
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    child: Image.network(
                      car.imageUrl,
                      width: 120,
                      height: 90,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.car_rental, size: 60, color: Colors.grey),
                    ),
                  ),

                  SizedBox(width: 12),

                  // Car Info
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            car.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            "\$${car.pricePerDay}/day",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),

                          SizedBox(height: 5),

                          Text(
                            car.isAvailable ? "Available" : "Unavailable",
                            style: TextStyle(
                              color:
                                  car.isAvailable ? Colors.blue : Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Icon(Icons.arrow_forward_ios, color: Colors.grey),
                  SizedBox(width: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
