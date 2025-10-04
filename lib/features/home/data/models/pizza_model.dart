class PizzaModel {
  final String pizzaId;
  final String picture;
  final bool isVeg;
  final int spicy;
  final String name;
  final String description;
  final double price;
  final double discount;
  final List<MacroModel> macros;

  PizzaModel({
    required this.pizzaId,
    required this.picture,
    required this.isVeg,
    required this.spicy,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.macros,
  });

  factory PizzaModel.fromJson(Map<String, dynamic> json) {
    return PizzaModel(
      pizzaId: json['pizzaId'],
      picture: json['picture'],
      isVeg: json['isVeg'],
      spicy: json['spicy'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      macros: (json['macros'] as List<dynamic>)
          .map((e) => MacroModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pizzaId': pizzaId,
      'picture': picture,
      'isVeg': isVeg,
      'spicy': spicy,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'macros': macros.map((e) => e.toJson()).toList(),
    };
  }
}

class MacroModel {
  final int calories;
  final int protein;
  final int fat;
  final int carbs;

  MacroModel({
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbs,
  });

  factory MacroModel.fromJson(Map<String, dynamic> json) {
    return MacroModel(
      calories: json['calories'],
      protein: json['protein'],
      fat: json['fat'],
      carbs: json['carbs'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'protein': protein,
      'fat': fat,
      'carbs': carbs,
    };
  }
}

