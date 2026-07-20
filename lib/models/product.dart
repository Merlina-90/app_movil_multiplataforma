class Product {
  int? id;
  String name;
  String description;
  int quantity;
  String imagePath;
  double latitude;
  double longitude;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.quantity,
    required this.imagePath,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'quantity': quantity,
      'imagePath': imagePath,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  // 🔹 Convertir Map → Product (para leer desde SQLite)
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int?,
      name: map['name'] as String,
      description: map['description'] as String,
      quantity: map['quantity'] as int,
      imagePath: map['imagePath'] as String,
      latitude: (map['latitude'] as num).toDouble(),
      longitude: (map['longitude'] as num).toDouble(),
    );
  }
}
