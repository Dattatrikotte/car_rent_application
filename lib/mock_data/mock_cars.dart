import '../models/car.dart';

List<Car> mockCars = [
  Car(
    id: '1',
    name: 'Toyota Corolla',
   imageUrl: "https://i.imgur.com/9QvZ9ZK.jpeg",  // Placeholder image
    pricePerDay: 50.0,
    specs: '4 seats, AC, Automatic',
    isAvailable: true,
  ),
  Car(
    id: '2',
    name: 'Honda Civic',
   imageUrl: "https://i.imgur.com/WTqgU7I.jpeg",  // 
    pricePerDay: 60.0,
    specs: '5 seats, AC, Manual',
    isAvailable: false,
  ),
  // Add 2-3 more cars for variety
  Car(
    id: '3',
    name: 'Ford Focus',
    imageUrl: "https://i.imgur.com/2kFhJt7.jpeg",
    pricePerDay: 55.0,
    specs: '5 seats, AC, Automatic',
    isAvailable: true,
  ),
  Car(
    id: '4',
    name: 'Chevrolet Malibu',
   imageUrl: "https://i.imgur.com/yE2E6sv.jpeg",
    pricePerDay: 70.0,
    specs: '5 seats, AC, Automatic',
    isAvailable: true,
  ),
];
