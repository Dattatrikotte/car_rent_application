import 'package:flutter/material.dart';
import '../models/car.dart';
import '../models/booking.dart';

class AppProvider extends ChangeNotifier {
  Car? _selectedCar;
  Booking? _currentBooking;

  Car? get selectedCar => _selectedCar;
  Booking? get currentBooking => _currentBooking;

  void selectCar(Car car) {
    _selectedCar = car;
    notifyListeners();
  }

  void createBooking(Booking booking) {
    _currentBooking = booking;
    notifyListeners();
  }

  void clearBooking() {
    _currentBooking = null;
    _selectedCar = null;
    notifyListeners();
  }
}