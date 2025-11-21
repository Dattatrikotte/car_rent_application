class Car {
  final String id;
  final String name;
  final String imageUrl;  // Mock image URL or asset
  final double pricePerDay;
  final String specs;  // e.g., "4 seats, AC, Manual"
  final bool isAvailable;

  Car({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.pricePerDay,
    required this.specs,
    required this.isAvailable,
  });
}