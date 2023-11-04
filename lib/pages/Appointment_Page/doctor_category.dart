class Category {
  final int id;
  final String name;

  Category(this.id, this.name);
}

final List<Category> categories = [
  Category(1, "Cardiologist"),
  Category(2, "Psychiatrist"),
  Category(3, "Dermatologist"),
  Category(4, "Pediatrician"),
  Category(5, "Orthopedic Surgeon"),
  Category(6, "Ophthalmologist"),
  Category(7, "Gynecologist"),
  Category(8, "Urologist"),
  Category(9, "Neurologist"),
  Category(10, "ENT Specialist"),
];

class Doctor {
  final String name;
  final Category category;
  final int reviewCount;

  Doctor(
      {required this.name, required this.category, required this.reviewCount});
}

final List<Doctor> doctors = [
  Doctor(name: "Dr. John Smith", category: categories[0], reviewCount: 20),
  Doctor(name: "Dr. Sarah Johnson", category: categories[1], reviewCount: 15),
  Doctor(name: "Dr. Lisa Williams", category: categories[2], reviewCount: 30),
  Doctor(name: "Dr. James Brown", category: categories[3], reviewCount: 25),
  Doctor(name: "Dr. Emily Davis", category: categories[4], reviewCount: 35),
  Doctor(name: "Dr. Michael Wilson", category: categories[5], reviewCount: 10),
  Doctor(name: "Dr. Maria Garcia", category: categories[6], reviewCount: 40),
  Doctor(name: "Dr. Robert Martinez", category: categories[7], reviewCount: 22),
  Doctor(name: "Dr. William Turner", category: categories[8], reviewCount: 18),
  Doctor(name: "Dr. Linda Adams", category: categories[9], reviewCount: 28),
];
