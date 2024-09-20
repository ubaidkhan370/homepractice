import 'dart:convert';

IceCreamModel iceCreamModelFromJson(String str) => IceCreamModel.fromJson(json.decode(str));

String iceCreamModelToJson(IceCreamModel data) => json.encode(data.toJson());

class IceCreamModel {
  List<Icecream> icecream;

  IceCreamModel({
    required this.icecream,
  });

  factory IceCreamModel.fromJson(Map<String, dynamic> json) => IceCreamModel(
    icecream: List<Icecream>.from(json["icecream"].map((x) => Icecream.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "icecream": List<dynamic>.from(icecream.map((x) => x.toJson())),
  };
}

class Icecream {
  String flavor;
  String image;
  String description;
  List<String> toppings;
  List<Ingredient> ingredients;
  double price;

  Icecream({
    required this.flavor,
    required this.image,
    required this.description,
    required this.toppings,
    required this.ingredients,
    required this.price,
  });

  factory Icecream.fromJson(Map<String, dynamic> json) => Icecream(
    flavor: json["flavor"],
    image: json["image"],
    description: json["description"],
    toppings: List<String>.from(json["toppings"].map((x) => x)),
    ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
    price: json["price"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "flavor": flavor,
    "image": image,
    "description": description,
    "toppings": List<dynamic>.from(toppings.map((x) => x)),
    "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
    "price": price,
  };
}

class Ingredient {
  String name;
  String quantity;

  Ingredient({
    required this.name,
    required this.quantity,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    name: json["name"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "quantity": quantity,
  };
}
