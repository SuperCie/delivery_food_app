import 'package:delivery_food/models/cart_item.dart';
import 'package:delivery_food/models/food.dart';
import 'package:flutter/cupertino.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
// list food menu // list ini meliputi semua data burger dll
  final List<Food> _menu = [
    // burgers
    Food(
        name: 'Melted Beef Cheese Burger',
        description:
            'A classic with gourmet touches, suitable for casual dining with a luxurious twist.',
        imagePath: 'assets/images/burgers/cheese_burger.jpeg',
        price: 18,
        category: foodCategory.burgers,
        availableAddons: [
          Addon(name: 'Extra Sauce', price: 2),
          Addon(name: 'Extra Cheese', price: 3),
          Addon(name: 'Extra Patty', price: 6),
        ]),
    Food(
        name: 'Truffle Bliss Burger',
        description:
            'Combining Wagyu and lobster with truffle aioli makes this a high-end culinary experience.',
        imagePath: 'assets/images/burgers/truffle_bliss.jpeg',
        price: 32,
        category: foodCategory.burgers,
        availableAddons: [
          Addon(name: 'Extra Sauce', price: 2),
          Addon(name: 'Extra Cheese', price: 3),
        ]),
    Food(
        name: 'Vegetarian Delight Burger',
        description:
            'A healthy, premium vegetarian option that remains accessible.',
        imagePath: 'assets/images/burgers/vegetarian_burger.jpeg',
        price: 15,
        category: foodCategory.burgers,
        availableAddons: [
          Addon(name: 'Extra Sauce', price: 2),
          Addon(name: 'Extra Cheese', price: 3),
        ]),
    Food(
        name: 'Dry-Aged Wagyu Burger',
        description:
            'Dry-aged Wagyu offers a refined taste for a price that reflects its premium quality.',
        imagePath: 'assets/images/burgers/dry_aged_wahyu.jpeg',
        price: 25,
        category: foodCategory.burgers,
        availableAddons: [
          Addon(name: 'Extra Sauce', price: 2),
          Addon(name: 'Extra Cheese', price: 3),
        ]),
    Food(
        name: 'Golden Truffle Wagyu Delight',
        description:
            'Japanese A5 Wagyu, black truffle, and gold leaf combine for a top-tier luxury dining option.',
        imagePath: 'assets/images/burgers/golden_truffle.jpeg',
        price: 75,
        category: foodCategory.burgers,
        availableAddons: [Addon(name: '-', price: 0)]),
    // salads
    Food(
        name: 'Luxe Caesar Elegance',
        description: 'A sophisticated take on a classic, ideal for fine dining',
        imagePath: 'assets/images/salads/luxe_caesar.jpeg',
        price: 16,
        category: foodCategory.salads,
        availableAddons: [
          Addon(name: 'Seared Salmon', price: 7),
          Addon(name: 'Extra Dressing', price: 1.50),
          Addon(name: 'Toasted Nuts', price: 2.50),
        ]),
    Food(
        name: 'Mediterranean Opulence',
        description:
            'A vibrant, fresh, and flavorful Mediterranean-inspired salad.',
        imagePath: 'assets/images/salads/mediterranean.jpeg',
        price: 18,
        category: foodCategory.salads,
        availableAddons: [
          Addon(name: 'Seared Salmon', price: 7),
          Addon(name: 'Extra Dressing', price: 1.50),
          Addon(name: 'Toasted Nuts', price: 2.50),
        ]),
    Food(
        name: 'Truffle Infused Mushroom Mélange',
        description:
            'Rich truffle oil and wild mushrooms elevate this salad to indulgent heights.',
        imagePath: 'assets/images/salads/mushroom_truffle.jpeg',
        price: 20,
        category: foodCategory.salads,
        availableAddons: [
          Addon(name: 'Seared Salmon', price: 7),
          Addon(name: 'Extra Dressing', price: 1.50),
          Addon(name: 'Toasted Nuts', price: 2.50),
        ]),
    Food(
        name: 'Exotic Lobster and Avocado Symphony',
        description:
            'The addition of fresh lobster and champagne vinaigrette makes this a luxurious option.',
        imagePath: 'assets/images/salads/avocado_lobster.jpeg',
        price: 28,
        category: foodCategory.salads,
        availableAddons: [
          Addon(name: 'Seared Salmon', price: 7),
          Addon(name: 'Extra Dressing', price: 1.50),
          Addon(name: 'Toasted Nuts', price: 2.50),
        ]),
    Food(
        name: 'Golden Beet and Goat Cheese Harmony',
        description:
            'Perfectly balanced with sweet, tangy, and creamy elements.',
        imagePath: 'assets/images/salads/golden_beet.jpeg',
        price: 18,
        category: foodCategory.salads,
        availableAddons: [
          Addon(name: 'Seared Salmon', price: 7),
          Addon(name: 'Extra Dressing', price: 1.50),
          Addon(name: 'Toasted Nuts', price: 2.50),
        ]),

    // desserts
    Food(
        name: 'Cheesecake',
        description: 'A timeless classic suitable for any occasion.',
        imagePath: 'assets/images/dessert/cheesecake.jpg',
        price: 10,
        category: foodCategory.desserts,
        availableAddons: [
          Addon(name: 'Scoop of Ice Cream', price: 4),
          Addon(name: 'Whipped Cream', price: 1.50)
        ]),
    Food(
        name: 'Almond Chocolate Tart',
        description: 'A rich and indulgent dessert for chocolate lovers.',
        imagePath: 'assets/images/dessert/chocolate_almond.jpeg',
        price: 12,
        category: foodCategory.desserts,
        availableAddons: [
          Addon(name: 'Scoop of Ice Cream', price: 4),
          Addon(name: 'Whipped Cream', price: 1.50)
        ]),
    Food(
        name: 'Matcha Mille Crêpes',
        description: 'A delicate, layered dessert with a modern twist.',
        imagePath: 'assets/images/dessert/matcha.jpeg',
        price: 14,
        category: foodCategory.desserts,
        availableAddons: [
          Addon(name: 'Scoop of Ice Cream', price: 4),
          Addon(name: 'Whipped Cream', price: 1.50)
        ]),
    Food(
        name: 'Red Velvet Cake',
        description: 'A crowd-pleasing dessert with luxurious appeal.',
        imagePath: 'assets/images/dessert/red_velvet.jpeg',
        price: 10,
        category: foodCategory.desserts,
        availableAddons: [
          Addon(name: 'Scoop of Ice Cream', price: 4),
          Addon(name: 'Whipped Cream', price: 1.50)
        ]),
    Food(
        name: 'Exotic Mango',
        description: 'Refreshing tropical flavors make this a standout choice.',
        imagePath: 'assets/images/dessert/mango.jpeg',
        price: 11,
        category: foodCategory.desserts,
        availableAddons: [
          Addon(name: 'Scoop of Ice Cream', price: 4),
          Addon(name: 'Whipped Cream', price: 1.50)
        ]),

    // drinks
    Food(
        name: 'Caramel Latte',
        description: '',
        imagePath: 'assets/images/drinks/caramel_latte.jpeg',
        price: 6,
        category: foodCategory.drinks,
        availableAddons: [Addon(name: '-', price: 0)]),
    Food(
        name: 'Americano',
        description: '',
        imagePath: 'assets/images/drinks/americano.jpeg',
        price: 5,
        category: foodCategory.drinks,
        availableAddons: [Addon(name: '-', price: 0)]),
    Food(
        name: 'Lemon Tea',
        description: '',
        imagePath: 'assets/images/drinks/lemon_tea.jpeg',
        price: 5,
        category: foodCategory.drinks,
        availableAddons: [Addon(name: '-', price: 0)]),
    Food(
        name: 'Orange Cocktail',
        description: '',
        imagePath: 'assets/images/drinks/orange_cocktail.jpeg',
        price: 8,
        category: foodCategory.drinks,
        availableAddons: [Addon(name: '-', price: 0)]),
    Food(
        name: 'Mineral Water',
        description: '',
        imagePath: 'assets/images/drinks/equil.jpeg',
        price: 4,
        category: foodCategory.drinks,
        availableAddons: [Addon(name: '-', price: 0)]),
  ];

  /*
    G E T T E R S

  */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;
  /*
   O P E R A T I O N S
  */
  // get user cart
  final List<CartItem> _cart = [];

  //delivery address(which user can change/update)
  String _deliveryAddress = 'Enter your address';

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if there is a  cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the foods items are the same
      bool isSameFood = item.food == food;
      // check if the list of selected addons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // if item already exists, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // otherwise, add a new cart item to the cart
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    // update the UI
    notifyListeners();
  }

  // remove from cart
  void removeCartItem(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // update the address
  void updateAddres(newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  // H E L P E R S

  // generate a receipt
  String displayReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt..");
    receipt.writeln();

    // format the date to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("--------------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formattedPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln("   Add-ons: ${_formattedAddon(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("--------------");
    receipt.writeln();
    receipt.writeln("Total items: ${getTotalItemCount()}");
    receipt.writeln("Total price: ${_formattedPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to $deliveryAddress");

    return receipt.toString();
  }

  // format double value into money
  String _formattedPrice(double price) {
    return '\$${price.toStringAsFixed(2)}';
  }

  // format list of addons into a string summary
  String _formattedAddon(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formattedPrice(addon.price)})")
        .join(", ");
  }
}
