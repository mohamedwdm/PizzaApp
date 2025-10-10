class PizzaModel {
  final int id;
  final String picture;
  final bool isVeg;
  final num spicy;
  final String name;
  final String description;
  final num price;
  final num discount;
  final MacroModel macros;

  PizzaModel({
    required this.id,
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
      id: json['id'],
      picture: json['picture'],
      isVeg: json['is_veg'],
      spicy: json['spicy'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] ),
      discount: (json['discount'] ),
      macros: MacroModel.fromJson(json['macros']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'picture': picture,
      'isVeg': isVeg,
      'spicy': spicy,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'macros': macros.toJson(),
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

