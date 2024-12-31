// food item
class Food {
  final String name; // Cheese Burger
  final String
      description; // a classic burger seasoned beef patty topped with high class of melted cheese
  final String imagePath; // lib/images/cheese_burger.png
  final double price; // Rp 125.000,00
  final foodCategory category; // burgers
  List<Addon> availableAddons; // [extra patty, extra sauce, extra cheese]

  Food(
      {required this.name,
      required this.description,
      required this.imagePath,
      required this.price,
      required this.category,
      required this.availableAddons});
}

// food categories
enum foodCategory {
  burgers,
  salads,
  desserts,
  drinks,
}

// food addons
class Addon {
  String name;
  double price;

  Addon({required this.name, required this.price});
}
