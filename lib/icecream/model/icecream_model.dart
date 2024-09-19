// class IceCreamModel {
//   List<Icecream>? icecream;
//
//   IceCreamModel({this.icecream});
//
//   IceCreamModel.fromJson(Map<String, dynamic> json) {
//     if (json['icecream'] != null) {
//       icecream = <Icecream>[];
//       json['icecream'].forEach((v) {
//         icecream!.add(new Icecream.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.icecream != null) {
//       data['icecream'] = this.icecream!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Icecream {
//   String? flavor;
//   String? image;
//   String? description;
//   List<String>? toppings;
//   List<Ingredients>? ingredients;
//   double? price;
//
//   Icecream(
//       {this.flavor,
//         this.image,
//         this.description,
//         this.toppings,
//         this.ingredients,
//         this.price});
//
//   Icecream.fromJson(Map<String, dynamic> json) {
//     flavor = json['flavor'];
//     image = json['image'];
//     description = json['description'];
//     toppings = json['toppings'].cast<String>();
//     if (json['ingredients'] != null) {
//       ingredients = <Ingredients>[];
//       json['ingredients'].forEach((v) {
//         ingredients!.add(new Ingredients.fromJson(v));
//       });
//     }
//     price = json['price'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['flavor'] = this.flavor;
//     data['image'] = this.image;
//     data['description'] = this.description;
//     data['toppings'] = this.toppings;
//     if (this.ingredients != null) {
//       data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
//     }
//     data['price'] = this.price;
//     return data;
//   }
// }
//
// class Ingredients {
//   String? name;
//   String? quantity;
//
//   Ingredients({this.name, this.quantity});
//
//   Ingredients.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     quantity = json['quantity'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['quantity'] = this.quantity;
//     return data;
//   }
// }
//
//
//
//



// To parse this JSON data, do
//
//     final iceCreamModel = iceCreamModelFromJson(jsonString);

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
