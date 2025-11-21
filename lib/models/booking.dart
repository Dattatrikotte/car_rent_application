
import 'car.dart';
class Booking {
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final String location;
  final Car car;

  Booking({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.car,
  });

  double get totalPrice => car.pricePerDay * (endDate.difference(startDate).inDays + 1);
}